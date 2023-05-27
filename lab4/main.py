from scipy.stats import norm
import math
import random
from prettytable import PrettyTable

lfrs = lambda x: ((x[0] or x[1]) and x[2] and x[3] and (x[4] or x[5] or x[6]))
min_count_of_additional_parts = 0
max_count_of_additional_parts = 15
eps = 0.001
a = 0.999
P = 0.995
count_of_parts = [2, 2, 3]
alpha = [4 * 10 ** -5, 10 ** -5, 8 * 10 ** -5]
T = 8760


def calculate_N():
    t = norm.ppf(0.995)
    N = round((t ** 2 * (a * (1 - a)) / eps ** 2))
    print("t =", t, "N =", N)
    return N


def calculate_p(args, N):
    def find_min(t):
        mn = t[0]
        ind = 0
        for i in range(count_of_parts[j] - 1):
            if mn > t[i + 1]:
                mn = t[i + 1]
                ind = i + 1
        return ind

    d = 0
    for i in range(N):
        x = []
        for j in range(len(count_of_parts)):
            t = []
            for k in range(count_of_parts[j]):
                t.append(-math.log(random.random(), math.e) / alpha[j])
            for k in range(args[j]):
                index = find_min(t)
                t[index] -= math.log(random.random(), math.e) / alpha[j]
            for k in range(count_of_parts[j]):
                x.append(t[k] > T)
        if not lfrs(x):
            d += 1
    return 1 - d / N


def calculate_all_p(N):
    th = ["L1", "L2", "L3", "Всего частей", "P"]
    table = PrettyTable(th)
    for i in range(min_count_of_additional_parts, max_count_of_additional_parts + 1):
        print(i)
        for j in range(min_count_of_additional_parts, max_count_of_additional_parts + 1):
            for k in range(min_count_of_additional_parts, max_count_of_additional_parts + 1):
                if i + j + k <= max_count_of_additional_parts:
                    temp_p = calculate_p([i, j, k], N=N)
                    if temp_p > P:
                        table.add_row([i, j, k, i + j + k, temp_p])
    print(table)


if __name__ == "__main__":
    calculate_all_p(calculate_N())

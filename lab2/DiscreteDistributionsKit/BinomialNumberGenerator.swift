//
//  BinomialNumberGenerator.swift
//  lab2
//
//  Created by denis.beloshitsky on 09.02.2023.
//

import Foundation

final class BinomialNumberGenerator: DiscreteDistributionNumberGenerator {
    static func generateSequence(of size: Int, params: Any...) -> [Int] {
        guard let N = params[0] as? Int,
              let p = params[1] as? Double
        else { return [] }

        var res = [Int](repeating: 0, count: size)
        for i in 0 ..< size {
            res[i] = IRNBIN(N, p)
        }

        return res
    }

    private static func IRNBIN(_ N: Int, _ p: Double) -> Int {
        guard N < 100 else {
            return Int(round(RNNORM(N, p) + 0.5)) // аппроксимируем нормальным распределением
        }

        var M = Double.random()
        var r = 0
        var P = pow((1 - p), Double(N))

        M -= P
        while M >= 0 {
            P *= (Double(N - r) / Double(r + 1)) * (p / (1 - p))
            M -= P
            r += 1
        }

        return r
    }

    private static func RNNORM(_ N: Int, _ p: Double) -> Double {
        expectedValue(N, p) + Double.normalDistributionValue * standartDeviation(N, p)
    }
}

private extension BinomialNumberGenerator {
    /// Математическое ожидание (теориетическое значение)
    static func expectedValue(_ N: Int, _ p: Double) -> Double {
        Double(N) * p
    }

    /// Среднеквадратичное отклонение (теориетическое значение)
    static func standartDeviation(_ N: Int, _ p: Double) -> Double {
        sqrt(Double(N) * p * (1 - p))
    }
}

//
//  main.swift
//  lab1
//
//  Created by denis.beloshitsky on 08.02.2023.
//

import Foundation

let n = [10, 100, 1000, 10000]

n.forEach { length in
    var generator: RandomNumberGenerator = SystemRandomNumberGenerator()
    let seq = generateSequence(of: length, l: 0, r: 1, using: &generator)
    exportToFile(seq, title: length.description)

    let seqParams = [seq.expectedValue, seq.variance, seq.standartDeviation]
    exportToFile(seqParams, title: "params for \(length)")

    let corrCoefficients = correlationCoefficientsSequence(for: seq)
    exportToFile(corrCoefficients, title: "cc for \(length)")

    let probablilityDensityResults = probablilityDensity(for: seq)
    let integralDistributionResults = integralDistribution(for: seq)
    exportToFile(f: probablilityDensityResults, F: integralDistributionResults, title: " for \(length)")
}

/// **Вычисление последовательности коэффициентов корреляции**
func correlationCoefficientsSequence(for numberSequence: [Double]) -> [Double] {
    var res = [Double](repeating: 0.0, count: numberSequence.count)

    for f in 1 ... numberSequence.count {
        let numerator = countSumForCorrelationFunc(sequence: numberSequence, shift: f)
        let denominator = countSumForCorrelationFunc(sequence: numberSequence)
        res[f - 1] = numerator / denominator
    }

    return res
}

/// **Вспомогательная функция для вычисления числителя и знаменателя корелляционной функции**
func countSumForCorrelationFunc(sequence: [Double], shift: Int = 0) -> Double {
    var sum = 0.0
    let eV = sequence.expectedValue

    for i in 0 ..< sequence.count - shift {
        sum += (sequence[i] - eV) * (sequence[i + shift] - eV)
    }

    return sum
}

/// **Плотность распределения**
///
/// Разбиваем на интервалы, далее расчитываем частоты по каждому
/// интервалу и вероятность попадания значения в каждый интервал.
/// Результат делим на шаг интервала.
func probablilityDensity(for sequence: [Double], numberOfIntervals: Int = 100) -> [Double] {
    var f = [Double](repeating: 0.0, count: numberOfIntervals)
    let delta = 1.0 / Double(numberOfIntervals)
    let denominator = sequence.dCount * delta

    for i in 1 ... numberOfIntervals {
        let cur = Double(i) * delta
        let prev = Double(i - 1) * delta
        f[i - 1] = sequence.filter { $0 >= prev && $0 < cur }.dCount / denominator
    }

    return f
}

/// **Интегральная функция распределения**
///
/// Разбиваем на интервалы, для каждого значения x.
/// Далее, рассматриваем количество наблюдений меньше x и
/// поулченный результат делим на объем выборки.
func integralDistribution(for sequence: [Double], numberOfIntervals: Int = 100) -> [Double] {
    var f = [Double](repeating: 0.0, count: numberOfIntervals)

    for i in 1 ... numberOfIntervals {
        let x = 0.01 * Double(i)
        f[i - 1] = sequence.filter { $0 < x }.dCount / sequence.dCount
    }

    return f
}

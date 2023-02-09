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
    let arr = generateSequence(of: length, l: 0, r: 1, with: &generator)
    writeToFile(arr, title: arr.count.description)
}

func correlationCoefficientsSequence(numberSequence: [Double]) -> [Double] {
    var res = [Double](repeating: 0.0, count: numberSequence.count)

    for f in 1 ... numberSequence.count {
        res[f - 1] = countSumForCorrelationFunc(sequence: numberSequence, shift: f) / countSumForCorrelationFunc(sequence: numberSequence)
    }

    return res
}

func countSumForCorrelationFunc(sequence: [Double], shift: Int = 0) -> Double {
    var sum = 0.0
    let eV = sequence.expectedValue

    for i in 0 ..< sequence.count - shift {
        sum += (sequence[i] - eV) * (sequence[i + shift] - eV)
    }

    return sum
}

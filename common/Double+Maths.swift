//
//  Double+Maths.swift
//  labs
//
//  Created by denis.beloshitsky on 09.02.2023.
//

import func Foundation.sqrt

extension [Double] {
    // мат ожидание
    var expectedValue: Double {
        reduce(0, +) / Double(count)
    }

    // дисперсия
    var variance: Double {
        let eV = expectedValue
        let sum = reduce(into: 0) { partialResult, elem in
            partialResult += (elem - eV) * (elem - eV)
        }
        return sum / Double(count)
    }

    // СКО
    var standartDeviation: Double {
        sqrt(variance)
    }
}

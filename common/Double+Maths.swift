//
//  Double+Maths.swift
//  labs
//
//  Created by denis.beloshitsky on 09.02.2023.
//

import func Foundation.sqrt

extension [Double] {
    /// Математическое ожидание
    var expectedValue: Double {
        reduce(0, +) / Double(count)
    }

    /// Дисперсия случайной величины
    var variance: Double {
        let eV = expectedValue
        let sum = reduce(into: 0) { partialResult, elem in
            partialResult += (elem - eV) * (elem - eV)
        }
        return sum / Double(count)
    }

    /// Среднеквадратичное отклонение
    var standartDeviation: Double {
        sqrt(variance)
    }

    var dCount: Double {
        Double(count)
    }
}

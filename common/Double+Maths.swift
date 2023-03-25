//
//  Double+Maths.swift
//  labs
//
//  Created by denis.beloshitsky on 09.02.2023.
//

import func Foundation.pow
import func Foundation.sqrt
import class GameplayKit.GKRandomSource
import class GameplayKit.GKGaussianDistribution

extension Double {
    static func random() -> Double {
        Double.random(in: 0.0 ... 1.0)
    }

    static var normalDistributionValue: Double {
       let distribution = GKGaussianDistribution(randomSource: GKRandomSource(), mean: 0.0, deviation: 1.0)
       return Double(distribution.nextInt())
   }

    func rounded(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

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

extension [Int] {
    var toDouble: [Double] {
        self.map { Double($0) }
    }
}

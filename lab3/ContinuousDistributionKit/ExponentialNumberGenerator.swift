//
//  ExponentialNumberGenerator.swift
//  lab3
//
//  Created by denis.beloshitsky on 15.04.2023.
//

import Foundation

final class ExponentialNumberGenerator: ContinuousDistributionNumberGenerator {
    static func generateSequence(of size: Int, params: Any...) -> [Double] {
        guard let b = params.first as? Double else { return [] }

        var res = [Double](repeating: 0, count: size)
        for i in 0 ..< size {
            res[i] = RNEXP(b)
        }

        return res
    }

    private static func RNEXP(_ b: Double) -> Double {
        -b * log(Double.random())
    }
}

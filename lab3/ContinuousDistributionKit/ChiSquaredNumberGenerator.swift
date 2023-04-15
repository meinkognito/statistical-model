//
//  ChiSquaredNumberGenerator.swift
//  lab3
//
//  Created by denis.beloshitsky on 15.04.2023.
//

import Foundation

final class ChiSquaredNumberGenerator: ContinuousDistributionNumberGenerator {
    static func generateSequence(of size: Int, params: Any...) -> [Double] {
        var res = [Double](repeating: 0, count: size)
        for i in 0 ..< size {
            res[i] = RNCHIS(size)
        }

        return res
    }

    static func RNCHIS(_ N: Int) -> Double {
        var Y = 0.0

        for _ in 0 ..< N {
            Y += Double.random() * Double.random()
        }

        return Y
    }
}

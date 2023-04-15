//
//  ChiSquaredNumberGenerator.swift
//  lab3
//
//  Created by denis.beloshitsky on 15.04.2023.
//

import Foundation

final class ChiSquaredNumberGenerator: ContinuousDistributionNumberGenerator {
    static func generateSequence(of size: Int, params: Any...) -> [Double] {
        guard let N = params.first as? Int else { return [] }

        var res = [Double](repeating: 0, count: size)
        for i in 0 ..< size {
            res[i] = RNCHIS(N)
        }

        return res
    }

    static func RNCHIS(_ N: Int) -> Double {
        var Y = 0.0

        for _ in 0 ..< N {
            let u = Double.normalDistributionValue
            Y += u * u
        }

        return Y
    }
}

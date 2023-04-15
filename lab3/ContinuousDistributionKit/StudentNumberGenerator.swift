//
//  StudentNumberGenerator.swift
//  lab3
//
//  Created by denis.beloshitsky on 15.04.2023.
//

import Foundation

final class StudentNumberGenerator: ContinuousDistributionNumberGenerator {
    static func generateSequence(of size: Int, params: Any...) -> [Double] {
        guard let N = params.first as? Int else { return [] }

        var res = [Double](repeating: 0, count: size)
        for i in 0 ..< size {
            res[i] = RNSTUD(N)
        }

        return res
    }

    private static func RNSTUD(_ N: Int) -> Double {
        let z = Double.normalDistributionValue
        let Y = ChiSquaredNumberGenerator.RNCHIS(N)
        return z / sqrt(Y / Double(N))
    }
}

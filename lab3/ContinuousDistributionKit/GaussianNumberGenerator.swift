//
//  GaussianNumberGenerator.swift
//  lab3
//
//  Created by denis.beloshitsky on 15.04.2023.
//

import Foundation

final class GaussianNumberGenerator: ContinuousDistributionNumberGenerator {
    static func generateSequence(of size: Int, params: Any...) -> [Double] {
        guard let rnrm = params.first as? RNRM else { return [] }

        var res = [Double](repeating: 0, count: size)
        for i in 0 ..< size {
            res[i] = rnrm.gen()
        }

        return res
    }
}

enum RNRM {
    case _1
    case _2

    var gen: () -> Double {
        switch self {
        case ._1:
            return RNRM_1
        case ._2:
            return RNRM_2
        }
    }

    /// Box–Muller method
    private func RNRM_1() -> Double {
        let u1 = Double.random()
        let u2 = Double.random()
        return sqrt(-2 * log(u2)) * cos(2 * Double.pi * u1)
    }

    /// central limit theorem method
    private func RNRM_2() -> Double {
        var R = 0.0
        for _ in 0 ..< 12 {
            R += Double.random()
        }
        return R - 6
    }
}

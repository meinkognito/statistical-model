//
//  PoissonNumberGenerator.swift
//  lab2
//
//  Created by denis.beloshitsky on 09.02.2023.
//

import Foundation

class PoissonNumberGenerator: CustomNumberGenerator {
    static func generateSequence(of size: Int, params: Any...) -> [Int] {
        guard let mu = params[0] as? Double,
              let irnp = params[1] as? IRNP
        else { return [] }

        var res = [Int](repeating: 0, count: size)
        for i in 0 ..< size {
            res[i] = irnp.gen(mu)
        }

        return res
    }
}

enum IRNP {
    case OI
    case SN

    var gen: ((_ mu: Double) -> Int) {
        switch self {
        case .OI:
            return IRNPOI
        case .SN:
            return IRNPSN

        }
    }

    private func IRNPOI(_ mu: Double) -> Int {
        guard mu < 88 else {
            return Int(round(RNNORM(mu, mu) + 0.5))
        }

        var P = exp(-mu)
        var M = Double.random()

        var r = 0
        M -= P

        while (M >= 0) {
            r += 1
            P *= mu / Double(r)
            M -= P
        }

        return r
    }

    private func IRNPSN(_ mu: Double) -> Int {
        guard mu < 88 else {
            return Int(round(RNNORM(mu, mu) + 0.5))
        }

        let e = exp(-mu)
        var M = Double.random()
        var k = 0

        while (M >= e) {
            k += 1
            M *= Double.random()
        }

        return k
    }

    private func RNNORM(_ m: Double, _ d: Double) -> Double {
        m + Double.normalDistributionValue * sqrt(d)
    }
}

//
//  PoissonNumberGenerator.swift
//  lab2
//
//  Created by denis.beloshitsky on 09.02.2023.
//

import Foundation

class PoissonNumberGenerator: CustomNumberGenerator {
    func generateSequence(of size: Int, params: Any...) -> [Int] {
        guard let mu = params[0] as? Double,
              let gen = params[1] as? ((Double) -> Int) else { return [] }

        var res = [Int](repeating: 0, count: size)
        for i in 0 ..< size {
            res[i] = gen(mu)
        }

        return res
    }

    private func IRNPOI(_ mu: Double) -> Int {
        guard mu < 88 else {
            return Int(round(RNNORM(mu, mu) + 0.5))
        }

        var P = exp(-mu)
        var m = Double.random()

        var r = 0
        m -= P

        while (m >= 0) {
            r += 1
            P *= mu / Double(r)
            m -= P
        }

        return r
    }

    private func IRNPSN(_ mu: Double) -> Int {
        guard mu < 88 else {
            return Int(round(RNNORM(mu, mu) + 0.5))
        }

        var e = exp(-mu)
        var m = Double.random()
        var k = 0

        while (m >= e) {
            k += 1
            m *= Double.random()
        }

        return k
    }

    private func RNNORM(_ m: Double, _ d: Double) -> Double {
        m + Double.normalDistributionValue * sqrt(d)
    }
}

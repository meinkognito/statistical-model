//
//  GeometricNumberGenerator.swift
//  lab2
//
//  Created by denis.beloshitsky on 09.02.2023.
//

import Foundation

class GeometricNumberGenerator: CustomNumberGenerator {
    func generateSequence(of size: Int, params: Any...) -> [Int] {
        guard let p = params[0] as? Double,
              let irngeo = params[1] as? IRNGEO else { return [] }

        var res = [Int](repeating: 0, count: size)
        for i in 0 ..< size {
            res[i] = irngeo.gen(p)
        }

        return res
    }
}

enum IRNGEO {
    case first
    case second
    case third

    var gen: ((_ p: Double) -> Int) {
        switch self {
        case .first:
            return IRNGEO_1
        case .second:
            return IRNGEO_2
        case .third:
            return IRNGEO_3
        }
    }

    private func IRNGEO_1(_ p: Double) -> Int {
        var m = Double.random()
        var P = p
        var r = 0

        while m >= 0 {
            m -= p
            P *= (1 - p)
            r += 1
        }

        return r
    }

    private func IRNGEO_2(_ p: Double) -> Int {
        var k = 1
        var m = Double.random()

        while m > p {
            m = Double.random()
            k += 1
        }

        return k
    }

    private func IRNGEO_3(_ p: Double) -> Int {
        var u = Double.random()
        var q = 1 - p

        return Int(floor(log(u) / log(q)) + 1)
    }
}


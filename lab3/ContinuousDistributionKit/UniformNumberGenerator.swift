//
//  UniformNumberGenerator.swift
//  lab3
//
//  Created by denis.beloshitsky on 15.04.2023.
//

final class UniformNumberGenerator: ContinuousDistributionNumberGenerator {
    static func generateSequence(of size: Int, params: Any...) -> [Double] {
        guard let a = params[0] as? Double,
              let b = params[1] as? Double
        else { return [] }

        var res = [Double](repeating: 0, count: size)
        for i in 0 ..< size {
            res[i] = RNUNI(a, b)
        }

        return res
    }

    private static func RNUNI(_ a: Double, _ b: Double) -> Double {
        (b - a) * Double.random() + a
    }
}

//
//  UniformNumberGenerator.swift
//  lab2
//
//  Created by denis.beloshitsky on 09.02.2023.
//

import Foundation

class UniformNumberGenerator: CustomNumberGenerator {
    func generateSequence(of size: Int, params: Any...) -> [Int] {
        guard let ILOW = params[0] as? Int,
              let IUP = params[1] as? Int
        else { return [] }

        var res = [Int](repeating: 0, count: size)
        for i in 0 ..< size {
            res[i] = IRNUNI(ILOW, IUP)
        }

        return res
    }

    private func IRNUNI(_ ILOW: Int, _ IUP: Int) -> Int {
        Int(floor(Double(IUP - ILOW) * Double.random() + Double(ILOW)))
    }
}

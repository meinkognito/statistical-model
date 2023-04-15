//
//  F+f.swift
//  lab3
//
//  Created by denis.beloshitsky on 15.04.2023.
//

import Foundation

func F(_ u: [Double], _ isGaussianOrStudent: Bool) -> [Double] {
    let closure: ([Double], Double, Double, Double) -> Double = { arr, x, _, _ in
        arr.filter { $0 < x }.dCount / arr.dCount
    }
    return foo(u, with: closure, isGaussianOrStudent: isGaussianOrStudent)
}

func f(_ u: [Double], _ isGaussianOrStudent: Bool) -> [Double] {
    let closure: ([Double], Double, Double, Double) -> Double = { arr, x, xPrev, delta in
        arr.filter { $0 < x && $0 >= xPrev }.dCount / arr.dCount * delta
    }
    return foo(u, with: closure, isGaussianOrStudent: isGaussianOrStudent)
}

func foo(_ u: [Double],
         intervals: Int = 9,
         with myFunc: ([Double], Double, Double, Double) -> Double,
         isGaussianOrStudent: Bool) -> [Double] {
    guard let min = u.min(), let max = u.max() else { return [] }

    var delta = (max - min) / Double(intervals)
    delta = delta < 1 ? 1.0 : delta.rounded(to: 1)

    var start = (max - min) / 2.0 - Double(intervals) / 2.0 * delta
    if isGaussianOrStudent {
        start = -Double(intervals) / 2.0 + delta
    }

    var f = [Double](repeating: 0.0, count: intervals)

    for i in 1 ... intervals {
        let x = start + delta * Double(i)
        let xPrev = start + delta * (Double(i) - 1)
        f[i - 1] = myFunc(u, x, xPrev, delta)
    }

    return f
}

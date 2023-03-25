//
//  main.swift
//  lab2
//
//  Created by denis.beloshitsky on 09.02.2023.
//

import Foundation

let arraySize = 10000



private func logInfo(about array: [Int]) {
    // m and d
    // f and F
}

private func f(u: [Int]) -> [Double] {
    foo(u, with: fClosure)
}

private func F(u: [Int]) -> [Double] {
    foo(u, with: FClosure)
}

private func foo(_ u: [Int], intervals: Int = 9, with myFunc: ([Double], Double, Double, Double) -> Double) -> [Double] {
    let uDouble = u.toDouble
    guard let min = uDouble.min(), let max = uDouble.max() else { return [] }

    var delta = (max - min) / Double(intervals)
    delta = delta < 1 ? 1.0 : delta.rounded(to: 1)

    let start = (max - min) / 2.0 - Double(intervals) / 2.0 * delta
    var f = [Double](repeating: 0.0, count: intervals)

    for i in 1 ... intervals {
        let x = start + delta * Double(i)
        let xPrev = start + delta * (Double(i) - 1)
        f[i - 1] = myFunc(uDouble, x, xPrev, delta)
    }

    return f
}

private let fClosure: ([Double], Double, Double, Double) -> Double = { arr, x, xPrev, delta in
    arr.filter { $0 < x && $0 >= xPrev }.dCount / arr.dCount * delta
}

private let FClosure: ([Double], Double, Double, Double) -> Double = { arr, x, _, _ in
    arr.filter { $0 < x }.dCount / arr.dCount
}

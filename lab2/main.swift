//
//  main.swift
//  lab2
//
//  Created by denis.beloshitsky on 09.02.2023.
//

import Foundation

let arraySize = 10000

// uniform distribution
let ILOW = 1
let IUP = 100
logInfo(about: UniformNumberGenerator.generateSequence(of: arraySize, params: ILOW, IUP),
        title: "uniform")

// binomial distribution
let n = 10
let p = 0.5
logInfo(about: BinomialNumberGenerator.generateSequence(of: arraySize, params: n, p),
        title: "binomial")

// geometric distribution
logInfo(about: GeometricNumberGenerator.generateSequence(of: arraySize, params: p, IRNGEO._1),
        title: "geometric_IRNGEO_1")
logInfo(about: GeometricNumberGenerator.generateSequence(of: arraySize, params: p, IRNGEO._2),
        title: "geometric_IRNGEO_2")
logInfo(about: GeometricNumberGenerator.generateSequence(of: arraySize, params: p, IRNGEO._3),
        title: "geometric_IRNGEO_3")

// Poisson distribution
let mu = 10.0
logInfo(about: PoissonNumberGenerator.generateSequence(of: arraySize, params: mu, IRNP.OI),
        title: "poisson_IRNPOI")
logInfo(about: PoissonNumberGenerator.generateSequence(of: arraySize, params: mu, IRNP.SN),
        title: "poisson_IRNPSN")



// MARK: - logging and calculating properties
private func logInfo(about seq: [Int], title: String) {
    let seqParams = [seq.toDouble.expectedValue, seq.toDouble.variance]
    exportToFile(seqParams, title: "params for \(title)")
    exportToFile(f: f(seq), F: F(seq), title: " \(title)")
}

private func f(_ u: [Int]) -> [Double] {
    let closure: ([Double], Double, Double, Double) -> Double = { arr, x, xPrev, delta in
        arr.filter { $0 < x && $0 >= xPrev }.dCount / arr.dCount * delta
    }
    return foo(u, with: closure)
}

private func F(_ u: [Int]) -> [Double] {
    let closure: ([Double], Double, Double, Double) -> Double = { arr, x, _, _ in
        arr.filter { $0 < x }.dCount / arr.dCount
    }
    return foo(u, with: closure)
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

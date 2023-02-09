//
//  Utils.swift
//  labs
//
//  Created by denis.beloshitsky on 09.02.2023.
//

import Foundation

// MARK: generate sequence of random elements

func generateSequence(of length: Int, l: Double, r: Double, with generator: inout RandomNumberGenerator) -> [Double] {
    var res = [Double]()
    res.reserveCapacity(length)

    for _ in 0 ..< length {
        res.append(Double.random(in: l ... r, using: &generator))
    }

    return res
}

// MARK: export sequence to file

func writeToFile(_ sequence: [Double], title: String) {
    let str = sequence.description.trimmingCharacters(in: .punctuationCharacters)
    let filename = desktopDirectory.appendingPathComponent("\(title).csv")

    do {
        try str.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
    } catch {
        fatalError("🫡🫡🫡")
    }
}

var desktopDirectory: URL {
    FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask)[0]
}

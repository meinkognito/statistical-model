//
//  Utils.swift
//  labs
//
//  Created by denis.beloshitsky on 09.02.2023.
//

import Foundation

// MARK: - generate sequence of random elements

func generateSequence(of length: Int, l: Double, r: Double, using generator: inout RandomNumberGenerator) -> [Double] {
    var res = [Double](repeating: 0.0, count: length)

    for i in 0 ..< length {
        res[i] = Double.random(in: l ... r, using: &generator)
    }

    return res
}

// MARK: - export sequence to file

enum FileFormat: String {
    case txt
    case csv
}

/// convience method for exporting f and F simultaneously
func exportToFile(f sequence1: [Double], F sequence2: [Double], title: String) {
    exportToFile(sequence1, title: "f\(title)", fileFormat: .csv)
    exportToFile(sequence2, title: "bigF\(title)", fileFormat: .csv)
}

func exportToFile(_ sequence: [Double], title: String, fileFormat: FileFormat = .txt) {
    guard let filename = desktopDirectory?.appendingPathComponent("\(title).\(fileFormat.rawValue)") else { return }
    let str = sequence.description.trimmingCharacters(in: .punctuationCharacters)

    do {
        try str.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
    } catch {
        fatalError("🫡🫡🫡")
    }
}

var desktopDirectory: URL? {
    FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask).first
}

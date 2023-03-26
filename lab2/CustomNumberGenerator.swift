//
//  CustomNumberGenerator.swift
//  lab2
//
//  Created by denis.beloshitsky on 19.03.2023.
//

protocol CustomNumberGenerator {
    static func generateSequence(of size: Int, params: Any...) -> [Int]
}

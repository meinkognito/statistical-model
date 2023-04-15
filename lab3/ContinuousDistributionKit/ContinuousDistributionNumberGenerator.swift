//
//  ContinuousDistributionNumberGenerator.swift
//  lab3
//
//  Created by denis.beloshitsky on 15.04.2023.
//

protocol ContinuousDistributionNumberGenerator {
    static func generateSequence(of size: Int, params: Any...) -> [Double]
}

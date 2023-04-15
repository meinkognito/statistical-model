//
//  main.swift
//  lab3
//
//  Created by denis.beloshitsky on 15.04.2023.
//

import Foundation

let arraySize = 10000

// uniform distribution
let a = 1.0
let b = 100.0

logInfo(about: UniformNumberGenerator.generateSequence(of: arraySize, params: a, b),
        title: "uniform")

// gaussian distribution
logInfo(about: GaussianNumberGenerator.generateSequence(of: arraySize, params: RNRM._1),
        isGaussianOrStudent: true,
        title: "gaussian_RNRM1")
logInfo(about: GaussianNumberGenerator.generateSequence(of: arraySize, params: RNRM._2),
        isGaussianOrStudent: true,
        title: "gaussian_RNRM2")

// exponential distribution
let expB = 1.0
logInfo(about: ExponentialNumberGenerator.generateSequence(of: arraySize, params: expB),
        title: "exponential")

// chi-squared distribution
let n = 10
logInfo(about: ChiSquaredNumberGenerator.generateSequence(of: arraySize, params: n),
        title: "chi-squared")

// student distribution
logInfo(about: StudentNumberGenerator.generateSequence(of: arraySize, params: n),
        isGaussianOrStudent: true,
        title: "student")

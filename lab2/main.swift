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
logInfo(about: UniformNumberGenerator.generateSequence(of: arraySize, params: ILOW, IUP).toDouble,
        title: "uniform")

// binomial distribution
let n = 10
let p = 0.5
logInfo(about: BinomialNumberGenerator.generateSequence(of: arraySize, params: n, p).toDouble,
        title: "binomial")

// geometric distribution
logInfo(about: GeometricNumberGenerator.generateSequence(of: arraySize, params: p, IRNGEO._1).toDouble,
        title: "geometric_IRNGEO_1")
logInfo(about: GeometricNumberGenerator.generateSequence(of: arraySize, params: p, IRNGEO._2).toDouble,
        title: "geometric_IRNGEO_2")
logInfo(about: GeometricNumberGenerator.generateSequence(of: arraySize, params: p, IRNGEO._3).toDouble,
        title: "geometric_IRNGEO_3")

// Poisson distribution
let mu = 10.0
logInfo(about: PoissonNumberGenerator.generateSequence(of: arraySize, params: mu, IRNP.OI).toDouble,
        title: "poisson_IRNPOI")
logInfo(about: PoissonNumberGenerator.generateSequence(of: arraySize, params: mu, IRNP.SN).toDouble,
        title: "poisson_IRNPSN")

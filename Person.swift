//
//  Person.swift
//  project 4
//
//  Created by GRIGORIAN LILIT on 01/04/2018.
//  Copyright © 2018 GRIGORIAN LILIT. All rights reserved.
//

import Cocoa

// Persons name
enum Name: String {
    case John, Mary, Mark, Sandra, Sasha, Julieta, Mariam, Melissa, Alexandre, Arman, Serguey, Lucas // 12
    static func allValues() -> [Name] {
        return [John , Mary , Mark , Sandra , Sasha , Julieta , Mariam , Melissa , Alexandre , Arman , Serguey , Lucas ]
    }
}

// Class representing persons
class Person {
    let kMaxNumberOfInterests = 5  // each person has 5 different interests
    
    var name: Name
    var interests: [Interest] { return Array(interestsDictonary.values) }
    var interestsDictonary = [String: Interest]() // 1.. 5
    init(_ name: Name) {
        self.name = name
    }
    
    func addInterest(_ interest: Interest) -> Bool {
        if interestsDictonary.count < kMaxNumberOfInterests {
            interestsDictonary [interest.name] = interest
            return true
        }
        return false
    }
    
    func canAddMoreInterests() -> Bool {
        return interestsDictonary.count < kMaxNumberOfInterests
    }
}


//
//  RandomeNumber.swift
//  project 4
//
//  Created by GRIGORIAN LILIT on 04/04/2018.
//  Copyright © 2018 GRIGORIAN LILIT. All rights reserved.
//

import Cocoa

// Randome number
class RandomNumber  {
    func generate(between min: UInt, and max: UInt) -> UInt {
        return UInt(arc4random_uniform(UInt32(max - min))) + min
    }
}

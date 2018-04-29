//
//  Interest.swift
//  project 4
//
//  Created by GRIGORIAN LILIT on 04/04/2018.
//  Copyright © 2018 GRIGORIAN LILIT. All rights reserved.
//

import Cocoa

// Interests name
enum InterestName: String {
    case playingGolf, goingToTheMovie, boxing, playingFootball, classicalMusic, singing, goingToTheatre, playingBasketball, doingBusiness, technology // 10
    static func allInterests() -> [InterestName]{
        return [playingGolf , goingToTheMovie , boxing , playingFootball , classicalMusic , singing , goingToTheatre , playingBasketball , doingBusiness , technology ]
    }
}

// Interest class
class Interest {
    var name: String
    init(_ name: String) {
        self.name = name
    }
}

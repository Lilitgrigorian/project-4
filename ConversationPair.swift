//
//  ConversationPair.swift
//  project 4
//
//  Created by GRIGORIAN LILIT on 08/04/2018.
//  Copyright © 2018 GRIGORIAN LILIT. All rights reserved.
//

import Cocoa

// Conversation pair class
class ConversationPair {
        var personOne: Person
        var personTwo: Person
        var subjects: [Interest]
    init (personOne: Person, personTwo: Person, subjects: [Interest]) { // initialisation of persons and interests
        self.personOne = personOne
        self.personTwo = personTwo
        self.subjects = subjects
    
    }
    func description () -> String { // building a conversation pair based on its different interests
        return "\(personOne.name) \(personTwo.name)"
    }
    
}


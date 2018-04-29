//
//  Game.swift
//  project 4
//
//  Created by GRIGORIAN LILIT on 04/04/2018.
//  Copyright © 2018 GRIGORIAN LILIT. All rights reserved.
//

import Cocoa

// Creation of game class
class Game {
    var persons = [Person]()
    var names = Name.allValues()
    
    
    //Generate players
    func generatePlayers() {
        let numberOfParticipants: UInt = RandomNumber().generate(between: 2, and: 12) // 2...12
        for _ in 1...numberOfParticipants  {
            let randomName: Name = generateRandomName ()
            let person = Person(randomName)
            persons.append(person)
        }
    }
    
    //Generate randome name
    func generateRandomName() -> Name {
        let min = 0
        let max = names.count - 1
        let randomIndex = Int(RandomNumber().generate(between: UInt(min), and: UInt(max)))
        let name = names[randomIndex]
        names.remove(at: randomIndex)
        return name
    }
    
    
    //Create same for interest
    var interests = [Interest]()
    var interestNames = InterestName.allInterests()
    
    // Interests
    func generateInterests(person: Person) {
        print( person.name)
        let numberOfInterests : UInt = RandomNumber().generate(between: 1, and: 5) // between 1 and 5
        for _ in 1 ... numberOfInterests {
            if let randomInterestNames = self.generateRandomInterestName () {
                let interest = Interest(randomInterestNames.rawValue)
                print("  \(interest.name)  ")
                //    person.addInterest(interest)
            }
        }
    }
    
    // Randome interest name
    func generateRandomInterestName() -> InterestName? {
        let max = UInt(interestNames.count - 1)
        let randomIndex = Int(RandomNumber().generate(between: 1, and: max ))
        let  interestName = interestNames[randomIndex]
        interestNames.remove(at: randomIndex) // Avoid repetitions of interests
        return interestName
    }
    
    // Populate interest
    func populateInterest() {
        for person in persons {
            generateInterests(person: person)
            interestNames = InterestName.allInterests ()
        }
    }
    
    // Log participants introducations
    func logParticipants () {
        for person in game.persons {
            print(person.name)
            for interest in person.interests {
                print ( interest.name )
            }
        }
    }
    
    //Iterate through all interests
    func iterateInterests () {
        var interestsUsed = [String: String ]()  // Create a dictonarie
        for person in game.persons {
            print(person.name)
            var interests = person.interests
            while interests.count > 0 {
                let max = UInt(interests.count - 1)
                let randomIndex = Int(RandomNumber().generate(between: 0, and: max ))
                let  interest = interests[randomIndex]
                interests.remove(at: randomIndex)
                if interestsUsed [interest.name] == nil {
                    print( interest.name )
                    interestsUsed [interest.name] = interest.name
                }
            }
        }
    }
    
    //Create one easier func comparing  2 person
    func pair (personOne: Person, personTwo: Person) -> ConversationPair? {
        let interestsOne = nonCommunInterest(personOne: personOne, personTwo: personTwo)
        let  interestsTwo = nonCommunInterest(personOne: personTwo, personTwo: personOne)
        var interests = [Interest] ()
        if let interestsOne = interestsOne {
            interests.append(contentsOf: interestsOne)
        }
        if let interestsTwo = interestsTwo {
            interests.append(contentsOf: interestsTwo)
        }
        if interests.count > 0 {
            return ConversationPair(personOne: personOne, personTwo: personTwo, subjects: interests)
        }
        return nil
    }
    
    // non common interests for building a conversation pair
    func nonCommunInterest(personOne: Person, personTwo: Person) -> [Interest]? {
        var interests = [Interest] ()
        for interestOne in personOne.interests {
            var hasAMatch = false
            for interestTwo in personTwo.interests {
                if interestOne.name != interestTwo.name {
                    hasAMatch = true
                }
            }
            if !hasAMatch {
                interests.append(interestOne)
            }
            
        }
        if interests.count > 0 {
            return interests
        }
        return nil
    }
    
    // Building conversation pairs
    func buildConversationPairs () -> [ConversationPair]? {
        var conversationPairs = [ConversationPair]()
        for i in 0...persons.count - 1 {
            let personOne = persons[i]
            let comparePersons = (i+1)
            if comparePersons >= persons.count {break }
            for j in comparePersons ... persons.count-1 {
                let personsTwo = persons[j]
                
                if let interests = nonCommunInterest(personOne: personOne, personTwo: personsTwo) {
                    let conversationPair = ConversationPair(personOne: personOne, personTwo: personsTwo, subjects: interests)
                    conversationPairs.append(conversationPair)
                }
                
            }
        }
        return conversationPairs
    }
}

// Log conversation pairs
func logConversationPairs () {
    if let conversationPairs = game.buildConversationPairs() {
        for pair in conversationPairs {
            print ( pair.description()  )
        }
    }
    
}






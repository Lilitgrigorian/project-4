//
//  main.swift
//  project 4
//
//  Created by GRIGORIAN LILIT on 01/04/2018.
//  Copyright © 2018 GRIGORIAN LILIT. All rights reserved.
//

import Foundation



let game = Game()
game.generatePlayers()
game.populateInterest()
game.iterateInterests()
game.logParticipants()


if let conversationPairs = game.buildConversationPairs() {
    for pair in conversationPairs {
        print (pair.description() )
    }
}






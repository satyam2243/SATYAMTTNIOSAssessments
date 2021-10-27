//
//  PlayersData.swift
//  iOSAssessment-19
//
//  Created by Satyam Dixit on 27/10/21.
//

import Foundation

class PlayersData {
    
    static let sharedInstance: PlayersData = PlayersData()
    
    public init() {}
    
    var playersDataArray: [PlayersModel] = [
        
        PlayersModel(name: "Sachin",sport: "Cricket",email: "sachin@gmail.com"),
        PlayersModel(name: "Saurav Ganguli",sport: "Cricket",email: "saurav@gmail.com"),
        PlayersModel(name: "Roger Federer",sport: "Tennis",email: "roger@gmail.com"),
        PlayersModel(name: "Rafael Nadal",sport: "Tennis",email: "rafael@gmail.com"),
        PlayersModel(name: "Lionel Messi",sport: "Football",email: "lionel@gmail.com"),
        PlayersModel(name: "Cristiano Ronaldo",sport: "Football",email: "cristiano@gmail.com")
        
    ]
    
    
}

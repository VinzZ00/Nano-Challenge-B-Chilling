//
//  SharedData.swift
//  Nano1-BChilling
//
//  Created by Elvin Sestomi on 22/03/23.
//

import Foundation
import CoreLocation

enum emotion {
    case blue
    case chill
    case stress
}

struct player {
    var nama : String = ""
    var emotion : emotion = .chill
}

class PlayersData : ObservableObject {
    var chillSpot : [String : CLLocation] =
    [
        "Kumolo BSD" : CLLocation(latitude: 106.654335, longitude: 6.300620),
        "Q’Billiard" : CLLocation(latitude: 106.653560, longitude: 6.301880),
        "Techpolitan Board Game" : CLLocation(latitude: 106.654457, longitude: 6.302897)
        
    ]
    
    var blueSpot : [String : CLLocation] =
    [
        "Food Court The Breeze" : CLLocation(latitude : 106.655139, longitude : 6.301582),
        "Lake View Breeze" : CLLocation(latitude: 106.654243, longitude: 6.301937),
        "Walking Track Breeze" : CLLocation(latitude: 106.651096, longitude: 6.301616)
    ]
    
    var stressSpot : [String : CLLocation] =
    [
        "Sinar Djaya" : CLLocation(latitude: 106.654779, longitude: 6.301985),
        "Spincity" : CLLocation(latitude: 106.655111, longitude: 6.302706),
        "NXL esport center" : CLLocation(latitude: 106.655448, longitude: 6.302424),
        "Gold Gym" : CLLocation(latitude: 106.654678, longitude: 6.302001)
    ]
    
    @Published var firstPlayer : player = player();
    @Published var secondPlayer : player = player();
    @Published var thirdPlayer : player = player()
    
    var dominatingEmotion : emotion?
    
    @Published var spotAvailable : [String : CLLocation] = [:]
    @Published var finalSpot : (String, CLLocation)?;
    
    func getDominatingSpot(firstPlayer : player, secondPlayer : player, thirdPlayer : player) {
        var (blue, happy, stress) = (0,0,0)
        
        var players : [player] = [firstPlayer, secondPlayer, thirdPlayer];
        
        players.map({ x in
            
            switch x.emotion {
                case .chill :
                    happy += 1
                case .blue :
                    blue += 1
                case .stress :
                    stress += 1
            }
        })
        
        if blue > 1 {
            self.dominatingEmotion = .blue
        } else if happy > 1 {
            self.dominatingEmotion = .chill
        } else if stress > 1 {
            self.dominatingEmotion = .stress
        }
    }
    
    func getFinalSpot() {
        if let spot = dominatingEmotion {
            switch spot {
            case .chill :
                spotAvailable = chillSpot
            case .blue :
                spotAvailable = blueSpot
            case .stress :
                spotAvailable = stressSpot
            }
        }
        
        finalSpot = (Array(spotAvailable.keys)[0], Array(spotAvailable.values)[0]);
    }
    
    
    func getfinalDestinationBykey(_ name : String) {
        finalSpot = (name, spotAvailable[name]!);
    }

}

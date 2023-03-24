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
    case bluenchill
    case stressnblue
    case stressnchill
}

struct player {
    var nama : String = ""
    var emotion : emotion = .chill
}

class PlayersData : ObservableObject {
    var chillSpot : [String : CLLocation] =
    [
        "Kumolo BSD" : CLLocation(latitude: -6.300620, longitude: 106.654335),
        "Q’Billiard" : CLLocation(latitude: -6.301880, longitude: 106.653560),
        "Techpolitan Board Game" : CLLocation(latitude: -6.302897, longitude: 106.654457)
        
    ]
    
    var blueSpot : [String : CLLocation] =
    [
        "Food Court The Breeze" : CLLocation(latitude : -6.301582, longitude : 106.655139),
        "Lake View Breeze" : CLLocation(latitude: -6.301937, longitude: 106.654243),
        "Walking Track Breeze" : CLLocation(latitude: -6.301616, longitude: 106.651096)
    ]
    
    var stressSpot : [String : CLLocation] =
    [
        "Sinar Djaya" : CLLocation(latitude: -6.301985, longitude: 106.654779),
        "Spincity" : CLLocation(latitude: -6.302706, longitude: 106.655111),
        "NXL esport center" : CLLocation(latitude: -6.302424, longitude: 106.655448),
        "Gold Gym" : CLLocation(latitude: -6.302001, longitude: 106.654678)
    ]
    
    var chillnStress : [String : CLLocation] =
    [
        "Sinar Djaya" : CLLocation(latitude: -6.301985, longitude: 106.654779),
        "Gold Gym" : CLLocation(latitude: -6.302001, longitude: 106.654678),
        "Q’Billiard" : CLLocation(latitude: -6.301880, longitude: 106.653560)
    ]
    
    var bluenchill : [String : CLLocation] =
    [
        "Food Court The Breeze" : CLLocation(latitude : -6.301582, longitude : 106.655139),
        "Kumolo BSD" : CLLocation(latitude: -6.300620, longitude: 106.654335),
        "Lake View Breeze" : CLLocation(latitude: -6.301937, longitude: 106.654243)
    ]
    
    var bluenstress : [String : CLLocation] =
    [
        "Lake View Breeze" : CLLocation(latitude: -6.301937, longitude: 106.654243),
        "Spincity" : CLLocation(latitude: -6.302706, longitude: 106.655111),
        "Walking Track Breeze" : CLLocation(latitude: -6.301616, longitude: 106.651096)
    ]
    
    @Published var firstPlayer : player = player();
    @Published var secondPlayer : player = player();
    @Published var thirdPlayer : player = player()
    
    var dominatingEmotion : emotion?
    
    @Published var spotAvailable : [String : CLLocation] = [:]
    @Published var finalSpot : (String, CLLocation) = ("",CLLocation(latitude: 0, longitude: 0));
    
    func getDominatingSpot() {
        var (blue, happy, stress) = (0,0,0)
        
        let players : [player] = [firstPlayer, secondPlayer, thirdPlayer];
        
        players.map({ x in
            
//                        switch x.emotion {
//                            case .chill :
//                                happy += 1
//                            case .blue :
//                                blue += 1
//                            case .stress :
//                                stress += 1
//                        }
            if x.emotion == .chill {
                happy += 1;
            } else if x.emotion == .blue {
                blue += 1;
            } else if x.emotion == .stress {
                stress += 1;
            }
        })
        
        if blue > 1 {
            self.dominatingEmotion = .blue
        } else if happy > 1 {
            self.dominatingEmotion = .chill
        } else if stress > 1 {
            self.dominatingEmotion = .stress
        } else if blue < 1 {
            self.dominatingEmotion = .stressnchill
        } else if stress < 1 {
            self.dominatingEmotion = .bluenchill
        } else if happy < 1 {
            self.dominatingEmotion = .stressnblue
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
            case .bluenchill :
                spotAvailable = bluenchill
            case .stressnblue :
                spotAvailable = bluenstress
            case .stressnchill :
                spotAvailable = chillnStress
            }
        }
        
        finalSpot = (Array(spotAvailable.keys)[0], Array(spotAvailable.values)[0]);
    }
    
    
    func getfinalDestinationBykey(_ name : String) {
        finalSpot = (name, spotAvailable[name]!);
    }

}

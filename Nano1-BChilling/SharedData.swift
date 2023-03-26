//
//  SharedData.swift
//  Nano1-BChilling
//
//  Created by Elvin Sestomi on 22/03/23.
//

import Foundation
import CoreLocation
import MapKit


enum emotion {
    case blue
    case chill
    case stress
    case bluenchill
    case stressnblue
    case stressnchill
    case allcando
}

struct player {
    var nama : String = ""
    var emotion : emotion?
}

class PlayersData : NSObject, CLLocationManagerDelegate, ObservableObject {
    
    override init() {
        super.init()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
            )
            
        }
    }
    
    //        locations.last?.coordinate.longitude ini lgsung pake map makanya jdi $0,
    //        $0 == locations.last == CLLocation (sudah bukan array).
            
    //        Func ini akan dijalankan setiap kali ada location baru yang terdeteksi gitu
    //    https://developer.apple.com/documentation/corelocation/cllocationmanagerdelegate
        
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location Retrieval Error")
        print(error.localizedDescription)
    }
    
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
    
    var allcanDo : [String : CLLocation] =
    [
        "Kumolo BSD" : CLLocation(latitude: -6.300620, longitude: 106.654335),
        "Food Court The Breeze" : CLLocation(latitude : -6.301582, longitude : 106.655139),
        "Sinar Djaya" : CLLocation(latitude: -6.301985, longitude: 106.654779),
    ]
    
    @Published var region = MKCoordinateRegion();
    @Published var idx = 1;
    @Published var firstPlayer : player = player();
    @Published var secondPlayer : player = player();
    @Published var thirdPlayer : player = player()
    
    private let manager = CLLocationManager()
    var dominatingEmotion : emotion?
    
    @Published var spotAvailable : [String : CLLocation] = [:]
    @Published var finalSpot : (String, CLLocation) = ("",CLLocation(latitude: 0, longitude: 0));
    
    func getDominatingSpot() {
        var (blue, happy, stress) = (0,0,0)
        
        let players : [player] = [firstPlayer, secondPlayer, thirdPlayer];
        
        players.map({ x in

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
        } else if blue == 0 && stress != 0 && happy != 0 {
            self.dominatingEmotion = .stressnchill
        } else if stress == 0 && happy != 0 && blue != 0 {
            self.dominatingEmotion = .bluenchill
        } else if happy == 0 && stress != 0 && blue != 0 {
            self.dominatingEmotion = .stressnblue
        } else {
            self.dominatingEmotion = .allcando
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
            case .allcando :
                spotAvailable = allcanDo
            }
        }
        
        finalSpot = (Array(spotAvailable.keys)[0], Array(spotAvailable.values)[0]);
    }
    
    
    func getfinalDestinationBykey(_ name : String) {
        finalSpot = (name, spotAvailable[name]!);
    }

}

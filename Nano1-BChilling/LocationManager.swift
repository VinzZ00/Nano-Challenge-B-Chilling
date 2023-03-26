//
//  LocationManager.swift
//  TestingMap
//
//  Created by Elvin Sestomi on 21/03/23.
//


import MapKit
import CoreLocation


class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    @Published var region = MKCoordinateRegion();
    private let manager = CLLocationManager()
    
    override init() {
        super.init()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations : [CLLocation]) {
//        locations.last.map {
//            region = MKCoordinateRegion(
//                center : CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude), 
//                span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
//            )
//        }
//    }
    
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

}

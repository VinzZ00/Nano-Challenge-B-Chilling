//
//  ContentView.swift
//  Directions
//
//  Created by Catherine Candice on 23/03/23.
//

//
//  ContentView.swift
//  Directions
//

import MapKit
import SwiftUI
import UIKit

struct DirectionView: View {
    
    
    var images : [String : Image] =
    [
        "Kumolo BSD" : Image("KUMULO BSD"),
        "Q’Billiard" : Image("Q BILLIARD"),
        "Techpolitan Board Game" : Image("TECHPOLITAN"),
        "Food Court The Breeze" : Image("FOOD COURT BREEZE"),
        "Lake View Breeze" : Image("LAKE VIEW BREEZE"),
        "Walking Track Breeze" : Image("WALKING TRACK BREEZE"),
        "Sinar Djaya" : Image("SINAR DJAYA"),
        "Spincity" : Image("SPINCITY"),
        "Gold Gym" : Image("GOLD GYM")
    ]
    
    @EnvironmentObject var playerData : PlayersData
    @State private var directions: [String] = []
    @State private var showDirections = false
    
    var body: some View {
        VStack {
//            Text(String(playerData.finalSpot.0))
//            Text(String(playerData.finalSpot.1.coordinate.longitude))
//            Text(String(playerData.finalSpot.1.coordinate.latitude))
            MapView(p2longitude: playerData.finalSpot.1.coordinate.longitude, p2latitude: playerData.finalSpot.1.coordinate.latitude, directions: $directions)
            
            ZStack {
                VStack {
                    HStack{
                        Spacer()
//                        Image("Q BILLIARD")
//                            .scaledToFit()
//                            .padding()
                        
                        images[String(playerData.finalSpot.0)]!
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .cornerRadius(8)
//                            .clipped()
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: -10, trailing: 10))
                        VStack(alignment: .leading){
                            Text("\(playerData.finalSpot.0)")
                                .font(.title)
                                .foregroundColor(.white)
                                .bold()
                            Button(action: {
                                self.showDirections.toggle()
                            }){
                                    Text("Start")
                                        .frame(width: 179, height: 40)
                                        .background(Color(red: 53/255, green: 229/255, blue: 130/255))
                                        .cornerRadius(13.5)
                                        .bold()
                                        .foregroundColor(.white)
                            }
//                            NavigationLink(
//                                destination: DirectionView()
//                                    .navigationBarHidden(true)
//                            ){
//
//                            }.simultaneousGesture(TapGesture().onEnded{
//                                playerData.finalSpot = (
//                                    Array(playerData.spotAvailable.keys)[idx], Array(playerData.spotAvailable.values)[idx]
//                                )
//
//                                if idx < playerData.spotAvailable.count {
//                                    idx += 1
//                                } else if idx > playerData.spotAvailable.count {
//                                    idx = 0;
//                                }
//                            })
                            
                            NavigationLink(destination: DirectionView()) {
                                Text("Suggest Other Place")
                                    .font(.system(size: 15))
                                    .padding()
                                    .frame(width: 179, height: 40)
                                    .background(.white).foregroundColor(Color(red: 20/255, green: 202/255, blue: 225/255))
                                    .cornerRadius(13.5)
                                    .bold()
                            }.simultaneousGesture(TapGesture().onEnded() {
                                playerData.finalSpot = (
                                    Array(playerData.spotAvailable.keys)[playerData.idx],
                                    Array(playerData.spotAvailable.values)[playerData.idx]
                                );
                                
                                if playerData.idx < playerData.spotAvailable.count-1 {
                                    playerData.idx += 1
                                } else {
                                    playerData.idx = 0;
                                }
                            })
                            
                            NavigationLink(destination: Home()
                                .navigationBarHidden(true)){
                                Text("Back To Home?")
                                        .frame(width: 179, height: 40)
                                        .background(Color(red: 255/255, green: 87/255, blue: 87/255))
                                        .cornerRadius(13.5)
                                        .bold()
                                        .foregroundColor(.white)
                            }

                        }
                        Spacer()
                    }
                    .disabled(directions.isEmpty)
    //            .padding()
                }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .frame(height:250)
                    .background(Color(red: 20 / 255, green: 202 / 255, blue: 225 / 255))
    //            .frame(height:250)
    //                .background(Color(red: 20 / 255, green: 202 / 255, blue: 225 / 255))
                .padding(.top, 0)
            }
        }.sheet(isPresented: $showDirections, content: {
            NavigationView{
                VStack(spacing: 0) {
                    Text("Directions")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .foregroundColor(.black)
                    
                    Divider().background(Color(UIColor.systemBlue))
                    
                    List(0..<self.directions.count, id: \.self) { i in
                        Text(self.directions[i]).padding()
                    }
                    .foregroundColor(Color(red: 20 / 255, green: 202 / 255, blue: 225 / 255))
                        .cornerRadius(20)
                        
                    
                    Button(action: {
                        self.showDirections.toggle()
                    }){
                            Text("End Route")
                                .frame(width: 179, height: 40)
                                .background(Color(red: 255/255, green: 87/255, blue: 87/255))
                                .cornerRadius(13.5)
                                .bold()
                                .foregroundColor(.white)
                    }.padding()
                                    }.background(Color(red: 20 / 255, green: 202 / 255, blue: 225 / 255))
            }
        })
    }
}

struct MapView: UIViewRepresentable {
    
    typealias UIViewType = MKMapView
    @EnvironmentObject var playerData : PlayersData
    @State var p2longitude : CLLocationDegrees =  6.300620;
    @State var p2latitude : CLLocationDegrees = 106.654335;
    @Binding var directions: [String]
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
//        let appleCoordinate = CLLocationCoordinate2D(latitude: -6.302230, longitude: 106.652264)
        
//        let region = MKCoordinateRegion(
//            center: playerData.region,
//            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        
        let region = playerData.region
        mapView.setRegion(region, animated: true)
        
        // Apple Academy (user place
        let p1 = MKPlacemark(coordinate: playerData.region.center)
        
        // Breeze (nanti di-set pake sharedData aja sesuai tujuan)
        let p2 = MKPlacemark(coordinate: playerData.finalSpot.1.coordinate)
        print("latitude: \(playerData.finalSpot.1.coordinate.latitude)")
        
        //      let p2 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: playerData.finalSpot!.1.coordinate.latitude, longitude: playerData.finalSpot!.1.coordinate.longitude))
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: p1)
        request.destination = MKMapItem(placemark: p2)
        request.transportType = .walking
        
        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            guard let route = response?.routes.first else { return }
            mapView.addAnnotations([p1, p2])
            mapView.addOverlay(route.polyline)
            mapView.setVisibleMapRect(
                route.polyline.boundingMapRect,
                edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),
                animated: true)
            self.directions = route.steps.map { $0.instructions }.filter { !$0.isEmpty }
        }
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
    }
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .systemBlue
            renderer.lineWidth = 5
            return renderer
        }
    }
}

struct DirectionView_Preview: PreviewProvider {
    static var previews: some View {
        DirectionView()
    }
}

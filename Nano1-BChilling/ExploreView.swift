//
//  ExploreView.swift
//  Nano1-BChilling
//
//  Created by Elvin Sestomi on 23/03/23.
//

import SwiftUI
import MapKit

struct ExploreView: View {
    
    @EnvironmentObject var playersData : PlayersData
    @State var drawerIsActive : Bool = true;
    
   
    
    var body: some View {
        NavigationView {
            ZStack{
                // disini letak map
                
                VStack(alignment: .center)
                {
                    HStack(alignment : .top)
                    {
                        Spacer()
                        Button(action: {
                            drawerIsActive.toggle()
                        }){
                            Text("Drawer") // Sementara
                            //Custom button yang arrow ke atas
                            var (stringLoc, _) = playersData.finalSpot!
                            Text("\(stringLoc)")
                        }
                        Spacer()
                    }
                    Spacer()
                }.background(Color(red: 20/225, green: 202/225, blue: 225/225))
                    .cornerRadius(43)
                    .ignoresSafeArea()
                    .offset(y : (drawerIsActive) ? 540 : 259)
                    .animation(.easeInOut(duration: 1), value: drawerIsActive)
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}

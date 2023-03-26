//
//  ContentView.swift
//  Nano1-BChilling
//
//  Created by Elvin Sestomi on 20/03/23.
//

import SwiftUI

struct Home: View {
    
    @StateObject var playersData = PlayersData();
    
    @State var degress : Double = 0
    @State var valid : Bool = false;
    
    @State var p1Choose : Bool = false;
    @State var p2Choose : Bool = false;
    @State var p3Choose : Bool = false;
    
    @State var stPerstEmo : Bool = true;
    @State var stPerndEmo : Bool = true;
    @State var stPerrdEmo : Bool = true;
    
    @State var ndPerstEmo : Bool = true;
    @State var ndPerndEmo : Bool = true;
    @State var ndPerrdEmo : Bool = true;
    
    @State var rdPerstEmo : Bool = true;
    @State var rdPerndEmo : Bool = true;
    @State var rdPerrdEmo : Bool = true;
    
    @State var exploreView : Bool = false;
    
    
    var body : some View {
        
        NavigationView {
            VStack{
                Image("HomeLogo2")
                    .padding(.bottom, -20)
                    .padding(.top, -20)
                VStack {
                    
                    ZStack {
                        VStack{
                            HStack{
                                Spacer()
                            }
                            Spacer();
                        }
                        .background(Color(red: 20/225, green: 202/225, blue: 225/225))
                            .cornerRadius(40)
                            .ignoresSafeArea(.all)
                            .padding(.top, -24)
                        
                        VStack{
                            Text("Please list your chill\nfriends below,")
                                .font(.system(size: 24))
                                .multilineTextAlignment(.center)
                                .bold()
                                .foregroundColor(.white)
                                .padding()
                            
                            TextField("Your Name", text: $playersData.firstPlayer.nama)
                                .frame(width : 280, height: 28)
                                            .frame(width: 280, height: 28)
                                                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                                        .background(.white)
                                                        .cornerRadius(30)
                                                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                                                        .autocorrectionDisabled(true)
                            
                            HStack {
                                Button("😎", action: {
                                    if !stPerstEmo {
                                        stPerstEmo.toggle()
                                    }
                                    stPerndEmo = false
                                    stPerrdEmo = false
                                    playersData.firstPlayer.emotion = .chill
                                    
                                    p1Choose = true
                                    
                                    if p2Choose == true || p3Choose == true {
                                        valid = true
                                    }
                                }).font(.system(size : 30))
                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                                    .opacity((stPerstEmo) ? 1 : 0.5)
                                
                                Button("😕", action: {
                                    if !stPerndEmo {
                                        stPerndEmo.toggle()
                                    }
                                    stPerstEmo = false;
                                    stPerrdEmo = false
                                    playersData.firstPlayer.emotion = .blue
                                    
                                    p1Choose = true
                                    
                                    if p2Choose == true || p3Choose == true {
                                        valid = true
                                    }
                                    
                                }).font(.system(size : 30))
                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                                    .opacity((stPerndEmo) ? 1 : 0.5)
                                
                                Button("🤯", action: {
                                    if !stPerrdEmo {
                                        stPerrdEmo.toggle()
                                    }
                                    stPerstEmo = false
                                    stPerndEmo = false
                                    playersData.firstPlayer.emotion = .stress
                                    
                                    p1Choose = true
                                    
                                    if p2Choose == true || p3Choose == true {
                                        valid = true
                                    }
                                }).font(.system(size : 30))
                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                                    .opacity((stPerrdEmo) ? 1 : 0.5)
                                    
                                
                                
                            }
                            
                            TextField("Your Friend's Name", text: $playersData.secondPlayer.nama)
                                .frame(width: 280, height: 28)
                                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                            .background(.white)
                                            .cornerRadius(30)
                                            .padding(EdgeInsets(top: -10, leading: 16, bottom: 0, trailing: 16))
                                            .autocorrectionDisabled(true)
                                            
                            HStack {
                                Button("😎", action: {
                                    ndPerstEmo = true
                                    ndPerndEmo = false
                                    ndPerrdEmo = false
                                    
                                    playersData.secondPlayer.emotion = .chill
                                    
                                    p2Choose = true
                                    
                                    if p1Choose == true || p3Choose == true {
                                        valid = true
                                    }
                                    
                                    
                                    
                                }).font(.system(size : 30))
                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                                    .opacity(ndPerstEmo ? 1 : 0.5)
                               
                                Button("😕", action: {
                                    ndPerstEmo = false
                                    ndPerndEmo = true
                                    ndPerrdEmo = false
                                    
                                    playersData.secondPlayer.emotion = .blue
                                    
                                    p2Choose = true
                                    
                                    if p1Choose == true || p3Choose == true {
                                        valid = true
                                    }
                                    
                                }).font(.system(size : 30))
                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                                    .opacity(ndPerndEmo ? 1 : 0.5)
                               
                                Button("🤯", action: {
                                    ndPerstEmo = false
                                    ndPerndEmo = false
                                    ndPerrdEmo = true
                                    
                                    playersData.secondPlayer.emotion = .stress
                                    
                                    p2Choose = true
                                    
                                    if p1Choose == true || p3Choose == true {
                                        valid = true
                                    }
                                    
                                }).font(.system(size : 30))
                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                                    .opacity(ndPerrdEmo ? 1 : 0.5)
                                
                                
                            }
                            
                            TextField("Your Friend's Name", text: $playersData.thirdPlayer.nama)
                                .frame(width: 280, height: 28)
                                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                            .background(.white)
                                            .cornerRadius(30)
                                            .padding(EdgeInsets(top: -10, leading: 16, bottom: 0, trailing: 16))
                                            .autocorrectionDisabled(true)
                                            
                            HStack {
                                Button("😎", action: {
                                    rdPerstEmo = true
                                    rdPerndEmo = false
                                    rdPerrdEmo = false
                                    
                                    playersData.thirdPlayer.emotion = .chill
                                    
                                    p3Choose = true
                                    
                                    if p1Choose == true || p2Choose == true {
                                        valid = true
                                    }
                                    
                                }).font(.system(size : 30))
                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                                    .opacity(rdPerstEmo ? 1 : 0.5)
                                
                                Button("😕", action: {
                                    rdPerstEmo = false
                                    rdPerndEmo = true
                                    rdPerrdEmo = false
                                    
                                    playersData.thirdPlayer.emotion = .blue
                                    
                                    p3Choose = true
                                    
                                    if p1Choose == true || p2Choose == true {
                                        valid = true
                                    }
                                    
                                }).font(.system(size : 30))
                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                                    .opacity(rdPerndEmo ? 1 : 0.5)
                                
                                Button("🤯", action: {
                                    rdPerstEmo = false
                                    rdPerndEmo = false
                                    rdPerrdEmo = true
                                    
                                    playersData.thirdPlayer.emotion = .stress
                                    
                                    p3Choose = true
                                    
                                    if p1Choose == true || p2Choose == true {
                                        valid = true
                                    }
                                    
                                }).font(.system(size : 30))
                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                                    .opacity(rdPerrdEmo ? 1 : 0.5)
                                    
                                
                                
                            }.padding(.bottom, 35)
                            
                            NavigationLink(
                                destination: DirectionView()
                                    .navigationBarHidden(true)
                            ){
                                Text("Explore!").font(.system(size: 24)).bold()}
                            .simultaneousGesture(TapGesture().onEnded{
                                playersData.getDominatingSpot()
                                
                                playersData.getFinalSpot();

                            })
                            .frame(width: 151, height: 43)
                                .background(.white)
                                .foregroundColor(.cyan)
                                .cornerRadius(22)
                                .disabled(!valid)
                                .opacity(valid ? 1 : 0.5)
                                            
                                
                            
                            
                            
                            Spacer()
                        }.padding(.top, 35)
                            
                    }
                }
//                .border(.black) //Just for debugging
                
                
                    
                    
            }.background(.white)
        }.environmentObject(playersData)
            .background(.white)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home();
    }
}

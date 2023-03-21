//
//  ContentView.swift
//  Nano1-BChilling
//
//  Created by Elvin Sestomi on 20/03/23.
//

import SwiftUI

struct Home: View {
    
    @State var p1Name = ""
    @State var p2Name = ""
    @State var p3Name = ""
    
    @State var degress : Double = 0
    
//    @State var avocadoStyle : String = "";
    
    var body : some View {
        
        NavigationView {
            VStack{
                Image("HomeLogo")
                    .padding(EdgeInsets(top: 40, leading: 0, bottom: 40, trailing: 0))
                VStack {
                    Button(action: {
                        degress += 180
                    }){
                        Image("PlaceHolderArrow")
                            .rotationEffect(.degrees(degress))
                            
                    }.frame(width: 300, height: 50)
//                        .background(.black)
                        .offset(y : 10)
                        
                        
                    
                    ZStack {
                        VStack{
                            HStack{
                                Spacer()
                            }
                            Spacer();
                        }
                        .background(.cyan)
    //                    .border(.cyan, width: 20) //Cuma buat debugging
                            .cornerRadius(40)
                            .ignoresSafeArea(.all)
                        
                        
                        VStack{
//                            Button(action: {
//
//                            }) {
////                                Image("Holder<logo>")
//                                Text("Holder").foregroundColor(.black)
//                            }
                            Text("Please list your chill\nfriends below,")
                                .font(.system(size: 24))
                                .multilineTextAlignment(.center)
                                .bold()
                                .foregroundColor(.white)
                                .padding()
                            
                            TextField("Input UserName", text: $p1Name)
                                .frame(width : 280, height: 48)
                                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                            .background(.white)
                                            .cornerRadius(30)
                                            .padding(.bottom, -10)
                                            .padding()
                                            .autocorrectionDisabled(true)
                            
                            HStack {
                                Button("😎", action: {
                                    
                                }).font(.system(size : 40))
                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                                Button("😕", action: {
                                    
                                }).font(.system(size : 40))
                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                                Button("🤯", action: {
                                    
                                }).font(.system(size : 40))
                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                                    
                                
                                
                            }
    //
    //                        Picker(selection: $avocadoStyle, label: Text("Avocado:")) {
    //                            Text("Sliced").tag("Sliced")
    //                            Text("Mashed").tag("mashed")
    //                        }.pickerStyle(.inline)
                            
                            
                            
                            
                            
                            TextField("Input UserName", text: $p2Name)
                                .frame(width: 280, height: 48)
                                            .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                                            .background(.white)
                                            .cornerRadius(30)
                                            .padding(EdgeInsets(top: -10, leading: 16, bottom: 0, trailing: 16))
                                            .autocorrectionDisabled(true)
                                            
                            HStack {
                                Button("😎", action: {
                                    
                                }).font(.system(size : 40))
                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                                Button("😕", action: {
                                    
                                }).font(.system(size : 40))
                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                                Button("🤯", action: {
                                    
                                }).font(.system(size : 40))
                                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                                
                                
                            }.padding(.bottom, 35)

                            Button(action: {
                                
                            }){
                                Text("Explore!").font(.system(size: 24)).bold()
                            }.frame(width: 151, height: 43)
                                .background(.white)
                                .foregroundColor(.cyan)
                                .cornerRadius(22)
                                            
                                
                            
                            
                            
                            Spacer()
                        }.padding(.top, 35)
                    }
                }
//                .border(.black) //Just for debugging
                
                
                    
                    
            }
        }
    }
}
    
    
//    var body: some View {
//
//        NavigationView {
//            VStack{
//
//                VStack{
//                    HStack {
//                        Spacer()
//                    }
//                    Spacer()
//                }.background(Color(uiColor: UIColor(red: 20.0, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)))
////                VStack (alignment: .center){
////                    Text("Testing")
////                }
////                    .border(Color.black)
////                    .frame(minHeight: .infinity)
////
//                //                .foregroundColor(Color(red: 20, green: 202, blue: 225))
//                    .toolbar {
//                        ToolbarItem(placement: .principal) {
//                            Image("HomeLogo")
//                            //                        .font(.system(size: 200))
//                                .offset(y : 50)
//                        }
//                    }
//            }
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home();
    }
}

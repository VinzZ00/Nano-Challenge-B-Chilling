//
//  ContentView.swift
//  Nano1-BChilling
//
//  Created by Elvin Sestomi on 20/03/23.
//

import SwiftUI

struct Home: View {
    
    
    var body : some View {
        
        NavigationView {
            VStack{
                Image("HomeLogo")
                    .padding(EdgeInsets(top: 40, leading: 0, bottom: 40, trailing: 0))
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
                        Text("Please list your chill\nfriends below,")
                            .font(.system(size: 24))
                            .multilineTextAlignment(.center)
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                    }.padding(.top, 35)
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

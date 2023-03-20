//
//  SplashScreen.swift
//  Nano1-BChilling
//
//  Created by Elvin Sestomi on 20/03/23.
//

import SwiftUI

struct SplashScreen: View {
    
    @State var  isActive = false;
    @State var size = 0.8;
    @State var opacity = 0.2;
    
    var body: some View {
        
        if isActive {
            Home();
        } else {
            VStack {
                Image("Logo")
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                    }
                }
            }.onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    withAnimation{
                        self.isActive = true;
                    }
                }
            }
        }
        
        
    }
}


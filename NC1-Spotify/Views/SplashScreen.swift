//
//  SplashScreen.swift
//  NC1-Spotify
//
//  Created by Axel Amós Hernández Cárdenas on 15/11/23.
//

import SwiftUI


struct SplashScreen: View {
    
    @Binding var isPresented: Bool
    
    @State private var opacity = 1.0
    
    var body: some View {
        ZStack {
            Color.backcolor.ignoresSafeArea()
            ZStack{
                VStack{
                    Image("spotifylogo")
                        .resizable()
                        .frame(width: 125, height: 125)
                }
            }
        }
        .opacity(opacity)
        .onAppear{
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                withAnimation(.easeIn(duration: 0.15)){
                    opacity = 0
                }
            })
            // This DQMaA will take the user to the main page.
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.3, execute: {
                withAnimation(.easeIn(duration: 0.25)){
                    isPresented.toggle()
                }
            })
        }
    }
}


#Preview {
    SplashScreen(isPresented: .constant(true))
}

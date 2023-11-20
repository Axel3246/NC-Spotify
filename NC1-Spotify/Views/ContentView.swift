//
//  ContentView.swift
//  NC1-Spotify
//
//  Created by Axel Amós Hernández Cárdenas on 15/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var isSplashScreenPresented: Bool = true
    @State private var isTapped = false

    var body: some View {
        ZStack{
            Color.backcolor.ignoresSafeArea()
            if isSplashScreenPresented{
                SplashScreen(isPresented: $isSplashScreenPresented)
            }
            else{
                TabView{
                    
                    HomeView()
                        .tabItem {
                            Label("Home", systemImage: "house.fill")
                                .font(.custom("ProductSans-Medium", size: 13, relativeTo: .body))
                                .accessibilityLabel("Go to Home Page")
                        }
                        .toolbarBackground(Color.backcolor, for: .tabBar)
                    
                    SearchView()
                        .tabItem {
                            Label("Search", systemImage: "magnifyingglass")
                                .font(.custom("ProductSans-Bold", size: 20, relativeTo: .body))
                                .accessibilityLabel("Go to Search Page")

                        }
                        .toolbarBackground(Color.backcolor, for: .tabBar)
                    
                    YourLibraryView()
                        .tabItem {
                            Label("Your Library", systemImage: "square.stack.3d.down.right")
                                .font(.custom("ProductSans-Medium", size: 13, relativeTo: .body))
                                .accessibilityLabel("Go to Library Page")

                        }
                        .toolbarBackground(Color.backcolor, for: .tabBar)
                }
                .tint(Color.secondarytextcolor)
                .listRowSeparator(.hidden)
            }
        }
    }
}

#Preview {
    ContentView()
}

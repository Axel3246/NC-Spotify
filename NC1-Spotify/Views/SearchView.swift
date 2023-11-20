//
//  SearchView.swift
//  NC1-Spotify
//
//  Created by Axel Amós Hernández Cárdenas on 16/11/23.
//

import SwiftUI

// MARK: Search Bar
struct SearchBar: View {
    @State private var text: String = ""
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .accessibilityLabel("Search bar field")
            .foregroundStyle(.secondarytextcolor)
            .frame(height: 45)
            .overlay{
                HStack{
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                    
                    TextField(text: $text){
                        Text("What do you want to listen to?")
                            .font(.custom("ProductSans-Regular", size: 17, relativeTo: .title3))
                            .foregroundStyle(.secondarybgcolor)
                    }
                }
                .foregroundStyle(.secondarybgcolor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .padding(.top, 2)
    }
}

// MARK: TOP BAR
struct SearchHeaderView: View {
    
    var body: some View {
        
        VStack{
            HStack{
                Button(action: {}){
                    Image("profilepic")
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .accessibilityLabel("Go to profile page")
                }
                Text("Search")
                    .font(.custom("ProductSans-Bold", size: 25, relativeTo: .title2))
                    .kerning(-0.5)
                
                Spacer()
                
                Button(action: {}){
                    Text(Image(systemName: "camera"))
                        .font(.title2)
                        .bold()
                }
                .accessibilityLabel("Scan")
            }
            // SEARCH BAR GOES HERE
            SearchBar()
        }
        .frame(maxWidth: .infinity,  alignment: .topLeading)
        .foregroundStyle(Color.secondarytextcolor)
        .padding()
    }
}


// MARK: Card Component
struct BrowseRecomendations: View {
    
    let item: Artist
    
    var body: some View {
        
        Button(action: {}){
            ZStack{
                
                Image(item.image)
                    .resizable()
                    .frame(width: 72, height: 72)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .rotationEffect(.degrees(20))
                    .offset(x: 72, y: 13)
                    .shadow(radius: 10)
                
                Text(item.name)
                    .font(.custom("ProductSans-Bold", size: 19, relativeTo: .title))
                    .foregroundStyle(Color.secondarytextcolor)
                    .frame(maxWidth: .infinity, maxHeight: 80, alignment: .topLeading)
                    .padding(.horizontal, 10)
            }
            .frame(height: 100)
            .background(RoundedRectangle(cornerRadius: 4).foregroundStyle(item.color))
            .clipped()
            
        }
        .accessibilityLabel("Go to \(item.name) recommendations.")
        .padding()
        .padding(.bottom, -25)
    }
}

// MARK: Card Grid
struct BrowseGrid: View {
    
    private var mySearchVM = SearchVM()
    
    let columns = [
        GridItem(.flexible(), spacing: -15),
        GridItem(.flexible(), spacing: -15)
    ]
    
    var body: some View {
        
        Text("Browse all")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.custom("ProductSans-Bold", size: 16, relativeTo: .title3))
            .foregroundStyle(.secondarytextcolor)
            .padding(.horizontal)
            .padding(.vertical, 1)
        
        
        LazyVGrid(columns: columns){
            ForEach(mySearchVM.searchVM){item in
                BrowseRecomendations(item: item)
            }
        }
    }
}


// MARK: Main View
struct SearchView: View {
    var body: some View {
        ZStack{
            Color.backcolor.ignoresSafeArea()
            VStack{
                SearchHeaderView()
                ScrollView{
                    BrowseGrid()
                        .padding(.bottom, 40) // Add bottom padding to create space between the content and the tab view
                }
            }
        }
    }
}

#Preview {
    SearchView()
}

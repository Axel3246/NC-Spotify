//
//  HomeView.swift
//  NC1-Spotify
//
//  Created by Axel Amós Hernández Cárdenas on 16/11/23.
//

import SwiftUI

// MARK: FILTER CHIPS VIEW
struct HomeChipView: View {
    
    enum Filter: String, CaseIterable, Identifiable, CustomStringConvertible{
        var id: String { return self.rawValue }
        case All
        case Music
        case Podcasts
        
        var description: String {
            switch self{
            case .All: return "All"
            case .Music: return "Music"
            case .Podcasts: return "Podcasts & Shows"
            }
        }
    }
    
    @State private var isSelectedFilter: Filter = .All
    
    var body: some View {
        HStack{
            ForEach(Filter.allCases){filter in
                Button(action: {isSelectedFilter = filter}) {
                    Text(filter.description)
                        .font(.custom("ProductSans-Medium", size: 13, relativeTo: .body))
                        .foregroundStyle(isSelectedFilter == filter ? .black : .secondarytextcolor)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 15)
                        .background(
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(isSelectedFilter == filter ? .filtercolor : .secondarybgcolor)
                        )
                }
                .accessibilityLabel("Filter your songs by: \(filter.description)")
                .padding(.leading, 2)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: HEADER
struct HomeHeaderView: View {
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {}){
                    Image("profilepic")
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    
                }
                .accessibilityLabel("Your Profile Page")
                HomeChipView()
            }
        }
        .frame(maxWidth: .infinity,  alignment: .topLeading)
        .foregroundStyle(Color.secondarytextcolor)
        .padding()
        .padding(.bottom, -15)
    }
}

// MARK: LIKED CARD
struct CardLikedSongs: View {
    var body: some View {
        HStack{
            Button(action: {}){
                Image("lkdsns")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 58, height: 58)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(Color.gray, Color.addbackcolor)
                VStack{
                    Text("Liked Songs")
                        .font(.custom("ProductSans-Bold", size: 13, relativeTo: .body))
                        .foregroundStyle(Color.secondarytextcolor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                }
            }
        }
        .accessibilityLabel("Go to Liked Songs Playlist")
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 4).foregroundStyle(.addbackcolor))
        .padding(.bottom, -25)
        .padding()
    }
}

// MARK: TOP GRID CARDS
struct CardRecommendations: View {
    
    let recommendation: Artist
    
    var body: some View {
        HStack{
            Button(action: {}){
                Image(recommendation.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 58, height: 58)
                    .foregroundStyle(Color.gray, Color.addbackcolor)
                VStack{
                    Text(recommendation.name)
                        .font(.custom("ProductSans-Bold", size: 13, relativeTo: .body))
                        .foregroundStyle(Color.secondarytextcolor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                }
            }
        }
        .accessibilityLabel("Go to \(recommendation.name) \(recommendation.type)")
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 4).foregroundStyle(.addbackcolor))
        .padding(.bottom, -25)
        .padding()
    }
}

// MARK: 8 RECOMMENDATIONS
struct TopGrid: View {
    
    private var myHomeViewModel = HomeViewModel()
    
    let columns = [
        GridItem(.flexible(), spacing: -25),
        GridItem(.flexible(), spacing: -25)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 1){
            CardLikedSongs()
            ForEach(myHomeViewModel.homeModel){item in
                CardRecommendations(recommendation: item)
            }
        }
    }
}

// MARK: THIS IS WHAT THE INTERNET
struct BoxCards: View {
    var item: Artist
    
    var body: some View {
        VStack {
            Button(action: {}) {
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
            }

            
            VStack(alignment: .leading, spacing: 2) {
                let words = item.description.split(separator: " ")
                let firstLine = words.prefix(4).joined(separator: " ")
                let remainingWords = words.suffix(from: 4).joined(separator: " ")
                
                Text(firstLine)
                    .font(.custom("ProductSans-Medium", size: 12, relativeTo: .body))
                    .foregroundStyle(.subheadercolor)
                    .lineLimit(1)
                
                Text(remainingWords)
                    .font(.custom("ProductSans-Medium", size: 12, relativeTo: .body))
                    .foregroundStyle(.subheadercolor)
                    .lineLimit(1)
            }
            .frame(maxWidth: 140, alignment: .leading)
            .padding(.top, 1)
        }
        .accessibilityLabel("Go to \(item.type). Listen to \(item.description)")
    }
}

// MARK: BLEND
struct BoxBlend: View {
    
    var body: some View {
        VStack {
            Button(action: {}) {
                Image("blend")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
            }

            
            VStack(alignment: .leading, spacing: 2) {
                
                Text("Playlist • A blend of")
                    .font(.custom("ProductSans-Medium", size: 12, relativeTo: .body))
                    .foregroundStyle(.subheadercolor)
                    .lineLimit(1)
                
                Text("music for Axel and Karyme")
                    .font(.custom("ProductSans-Medium", size: 12, relativeTo: .body))
                    .foregroundStyle(.subheadercolor)
                    .lineLimit(1)
            }
            .frame(maxWidth: 140, alignment: .leading)
            .padding(.top, 1)
        }
        .accessibilityLabel("Go to Blend. Listen to a blend of music for you and one of your friends")
    }
}

// MARK: SCROLLABLE HSTACKS
struct ScrollableHS: View {
    
    private var internetVM = InternetVM()
    private var chartVM = ChartsVM()
    
    var body: some View {
        VStack{
            
            Text("this is what the internet sounds like")
                .font(.custom("ProductSans-Black", size: 23, relativeTo: .body))
                .foregroundStyle(Color.primarytextcolor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .kerning(-1)
                .padding()
                .padding(.bottom, -10)
            ScrollView(.horizontal){
                HStack(spacing: -16){
                    ForEach(internetVM.internetVM){item in
                        BoxCards(item: item)
                    }
                    .padding(.horizontal)
                }
            }
            
            Text("Charts")
                .font(.custom("ProductSans-Black", size: 24, relativeTo: .body))
                .foregroundStyle(Color.primarytextcolor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .kerning(-1)
                .padding()
                .padding(.top, 10)
                .padding(.bottom, -10)
            
            ScrollView(.horizontal){
                HStack(spacing: -16){
                    ForEach(chartVM.chartVM){item in
                        BoxCards(item: item)
                    }
                    .padding(.horizontal)
                }
            }
            
            Text("Made For Us")
                .font(.custom("ProductSans-Black", size: 24, relativeTo: .body))
                .foregroundStyle(Color.primarytextcolor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .kerning(-1)
                .padding()
                .padding(.top, 10)
                .padding(.bottom, -10)
            
                BoxBlend()
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical)
    }
}


struct HomeView: View {
    var body: some View {
        ZStack{
            Color.backcolor.ignoresSafeArea()
            VStack{
                HomeHeaderView()
                ScrollView{
                    TopGrid()
                    ScrollableHS()
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    HomeView()
}

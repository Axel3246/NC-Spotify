//
//  YourLibraryView.swift
//  NC1-Spotify
//
//  Created by Axel Amós Hernández Cárdenas on 15/11/23.
//

import SwiftUI

// MARK: CHIP FILTERS
struct ChipView: View {
    
    enum Filter: String, CaseIterable, Identifiable{
        var id: String { return self.rawValue }
        case Playlists
        case Albums
        case Artists
    }
    
    var body: some View {
        HStack{
            ForEach(Filter.allCases){filter in
                Button(action: {}) {
                    Text(filter.rawValue)
                        .font(.custom("ProductSans-Medium", size: 13, relativeTo: .body))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 17)
                        .background(
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(Color.secondarybgcolor)
                        )
                }
                .accessibilityLabel("Filter your library by: \(filter.rawValue)")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: TOP BAR
struct HeaderView: View {
    
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
                .accessibilityLabel("Go to profile page.")
                Text("Your Library")
                    .font(.custom("ProductSans-Bold", size: 25, relativeTo: .title2))
                    .kerning(-1.6)
                
                Spacer()
                
                Button(action:{}){
                    Text(Image(systemName: "magnifyingglass"))
                        .font(.title2)
                        .padding()
                }
                .accessibilityLabel("Search in your library.")
                
                Button(action: {}){
                    Text(Image(systemName: "plus"))
                        .font(.title2)
                }
                .accessibilityLabel("Add to your library.")
            }
            ChipView()
        }
        .frame(maxWidth: .infinity,  alignment: .topLeading)
        .foregroundStyle(Color.secondarytextcolor)
        .padding()
        .background(Rectangle().foregroundStyle(.backcolor).ignoresSafeArea().shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 4))
    }
}

// MARK: LIKED SONGS
struct LikedSongs: View {
    var body: some View {
        HStack{
            Button(action: {}){
                Image("lkdsns")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 65, height: 65)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(Color.gray, Color.addbackcolor)
                VStack(alignment: .leading){
                    Text("Liked Songs")
                        .font(.custom("ProductSans-Medium", size: 16, relativeTo: .body))
                        .foregroundStyle(Color.secondarytextcolor)
                        .padding(.bottom, 1)
                    
                    HStack{
                        Image(systemName: "pin.fill")
                            .rotationEffect(.degrees(45))
                            .font(.custom("ProductSans-Medium", size: 12, relativeTo: .body))
                            .foregroundStyle(Color.pincolo)
                        
                        Text("Playlist • 97 songs")
                            .font(.custom("ProductSans-Medium", size: 12, relativeTo: .body))
                            .bold()
                            .foregroundStyle(Color.subheadercolor)
                            .padding(.leading, -2)
                    }
                }
                .padding(.vertical, 4)
            }
        }
        .accessibilityLabel("Go to Liked songs Playlist. Number of songs: 97.")
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 5)
    }
}

// MARK: ADD ARTIST
struct AddArtist: View {
    var body: some View {
        HStack{
            Button(action: {}){
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 65, height: 65)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(Color.gray, Color.addbackcolor)
                
                Text("Add artists")
                    .font(.custom("ProductSans-Medium", size: 16, relativeTo: .body))
                    .foregroundStyle(Color.secondarytextcolor)
                    .padding(.leading, 2)
            }
        }
        .accessibilityLabel("Add artist")
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 5)
    }
}

// MARK: ADD PODCAST
struct AddPodcast: View {
    var body: some View {
        HStack{
            Button(action: {}){
                Image(systemName: "plus.app.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 65, height: 65)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(Color.gray, Color.addbackcolor)
                
                Text("Add podcasts & shows")
                    .font(.custom("ProductSans-Medium", size: 16, relativeTo: .body))
                    .foregroundStyle(Color.secondarytextcolor)
                    .padding(.leading, 2)
            }
        }
        .accessibilityLabel("Add podcast")
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 5)
        .padding(.bottom, 2)
    }
}

// MARK: ARTIST ROW
struct ArtistView: View {
    
    let artist: Artist
    
    var body: some View {
        Image(artist.image)
            .resizable()
            .clipShape(Circle())
            .aspectRatio(contentMode: .fit)
            .frame(width: 65, height: 65)
            .symbolRenderingMode(.palette)
            .foregroundStyle(Color.gray, Color.addbackcolor)
            .accessibilityLabel("Go to \(artist.name) page")
        
        VStack(alignment: .leading){
            Text(artist.name)
                .font(.custom("ProductSans-Medium", size: 16, relativeTo: .body))
                .foregroundStyle(Color.secondarytextcolor)
                .padding(.bottom, 1)
            HStack{
                if artist.isLiked{
                    Image(systemName: "pin.fill")
                        .rotationEffect(.degrees(45))
                        .font(.custom("ProductSans-Medium", size: 12, relativeTo: .body))
                        .foregroundStyle(Color.pincolo)
                    
                    Text(artist.type)
                        .font(.custom("ProductSans-Medium", size: 12, relativeTo: .body))
                        .bold()
                        .foregroundStyle(Color.subheadercolor)
                        .padding(.leading, -2)
                }
                else{
                    Text(artist.type)
                        .font(.custom("ProductSans-Medium", size: 12, relativeTo: .body))
                        .bold()
                        .foregroundStyle(Color.subheadercolor)
                }
            }
        }
        .accessibilityHidden(true)
        .padding(.vertical, 4)
    }
}

// MARK: ALBUM VIEW
struct AlbumView: View {
    let artist: Artist
    
    var body: some View {
        Image(artist.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 65, height: 65)
            .symbolRenderingMode(.palette)
            .foregroundStyle(Color.gray, Color.addbackcolor)
            .accessibilityLabel("Go to \(artist.name) album")
        
        VStack(alignment: .leading){
            Text(artist.name)
                .font(.custom("ProductSans-Medium", size: 16, relativeTo: .body))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(Color.secondarytextcolor)
                .padding(.bottom, 1)
                .lineLimit(1)
                .multilineTextAlignment(.leading)
            HStack{
                if artist.isLiked{
                    Image(systemName: "pin.fill")
                        .rotationEffect(.degrees(45))
                        .font(.custom("ProductSans-Medium", size: 12, relativeTo: .body))
                        .foregroundStyle(Color.pincolo)
                    
                    Text(artist.type)
                        .font(.custom("ProductSans-Medium", size: 12, relativeTo: .body))
                        .bold()
                        .foregroundStyle(Color.subheadercolor)
                        .padding(.leading, -2)
                }
                else{
                    Text(artist.type)
                        .font(.custom("ProductSans-Medium", size: 12, relativeTo: .body))
                        .bold()
                        .foregroundStyle(Color.subheadercolor)
                }
            }
        }
        .accessibilityHidden(true)
        .padding(.vertical, 4)
    }
}

// MARK: PLAYLIST VIEW
struct PlaylistView: View {
    let artist: Artist
    
    var body: some View {
        Image(artist.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 65, height: 65)
            .symbolRenderingMode(.palette)
            .foregroundStyle(Color.gray, Color.addbackcolor)
            .accessibilityLabel("Go to \(artist.name) playlist")
        
        VStack(alignment: .leading){
            Text(artist.name)
                .font(.custom("ProductSans-Medium", size: 16, relativeTo: .body))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(Color.secondarytextcolor)
                .padding(.bottom, 1)
                .lineLimit(1)
                .multilineTextAlignment(.leading)
            HStack{
                if artist.isLiked{
                    Image(systemName: "pin.fill")
                        .rotationEffect(.degrees(45))
                        .font(.custom("ProductSans-Medium", size: 12, relativeTo: .body))
                        .foregroundStyle(Color.pincolo)
                    
                    Text("\(artist.type) • \(artist.creator)")
                        .font(.custom("ProductSans-Medium", size: 12, relativeTo: .body))
                        .bold()
                        .foregroundStyle(Color.subheadercolor)
                        .padding(.leading, -2)
                }
                else{
                    Text("\(artist.type) • \(artist.creator)")
                        .font(.custom("ProductSans-Medium", size: 12, relativeTo: .body))
                        .bold()
                        .foregroundStyle(Color.subheadercolor)
                }
            }
        }
        .accessibilityHidden(true)
        .padding(.vertical, 4)
    }
}

// MARK: DISPLAY FORM BY VM
struct LikedStuff: View {
    
    private var myViewModel = ArtistViewModel()
    
    var body: some View {
        ForEach(myViewModel.artists){artist in
            HStack{
                Button(action: {}){
                    if artist.type == "Artist"{
                        ArtistView(artist: artist)
                    }
                    else if artist.type == "Album"{
                        AlbumView(artist: artist)
                    }
                    else{
                        PlaylistView(artist: artist)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 5)
        }
    }
}

// MARK: MAIN
struct LibraryListView: View {
    
    private var myViewModel = ArtistViewModel()
    
    var body: some View {
        ScrollView{
            HStack{
                Button(action: {}){
                    Text("\(Text(Image(systemName: "arrow.up.arrow.down")).bold())")
                        .font(.caption)
                }
                .accessibilityLabel("Sort library")
                Text("Recents")
                    .font(.custom("ProductSans-Medium", size: 13, relativeTo: .body))
                
                Spacer()
                
                Button(action: {}){
                    Text(Image(systemName: "square.grid.2x2"))
                        .font(.subheadline)
                        .bold()
                }
                .accessibilityLabel("Change Library to Grid View.")
            }
            .padding(.horizontal)
            .foregroundStyle(Color.secondarytextcolor)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                LikedSongs()
                if !myViewModel.artists.isEmpty{
                    LikedStuff()
                }
                AddArtist()
                AddPodcast()
            }
            .padding(.horizontal)
        }
    }
}

// MARK: MAIN VIEW
struct YourLibraryView: View {
    var body: some View {
        ZStack{
            Color.backcolor.ignoresSafeArea()
            VStack{
                HeaderView()
                LibraryListView()
            }
        }
    }
}

#Preview {
    YourLibraryView()
}

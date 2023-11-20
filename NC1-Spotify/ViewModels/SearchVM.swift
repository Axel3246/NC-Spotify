//
//  SearchVM.swift
//  NC1-Spotify
//
//  Created by Axel Amós Hernández Cárdenas on 17/11/23.
//

import Foundation

class SearchVM{
    
    var searchVM: [Artist] = []

    init() {

        let sampleSongs = [
            Song(name: "Song 1", image: "", isLiked: false),
            Song(name: "Song 2", image: "", isLiked: false),
            Song(name: "Song 3", image: "", isLiked: false)
        ]

        let browRec1 = Artist(name: "Podcasts", image: "science", type: "Playlist", color: .podcasts, isLiked: false, songs: sampleSongs)
        let browRec2 = Artist(name: "Live Events", image: "live", type: "Playlist", color: .liveevents, isLiked: false, songs: sampleSongs)
        let browRec3 = Artist(name: "Made For You", image: "made", type: "Playlist", color: .mfyou, isLiked: false, songs: sampleSongs)
        let browRec4 = Artist(name: "New Releases", image: "rele", type: "Playlist", color: .newre, isLiked: false, songs: sampleSongs)
        let browRec5 = Artist(name: "Mexicana", image: "mumex", type: "Playlist", color: .mexmu, isLiked: false, songs: sampleSongs)
        let browRec6 = Artist(name: "Latin", image: "lati", type: "Playlist", color: .latin, isLiked: false, songs: sampleSongs)
        let browRec7 = Artist(name: "Italiana", image: "ita", type: "Playlist", color: .itamu, isLiked: false, songs: sampleSongs)
        let browRec8 = Artist(name: "Hip Hop", image: "rap", type: "Playlist", color: .hiphop, isLiked: false, songs: sampleSongs)
        let browRec9 = Artist(name: "Charts", image: "tsg", type: "Playlist", color: .topglobal, isLiked: false, songs: sampleSongs)
        let browRec10 = Artist(name: "Pop", image: "tth", type: "Playlist", color: .pop, isLiked: false, songs: sampleSongs)
        let browRec11 = Artist(name: "In the car", image: "dd", type: "Playlist", color: .incar, isLiked: false, songs: sampleSongs)
        let browRec12 = Artist(name: "Electronic", image: "phonk", type: "Playlist", color: .electro, isLiked: false, songs: sampleSongs)
        let browRec13 = Artist(name: "Cumbia", image: "cumbia", type: "Playlist", color: .cumbia, isLiked: false, songs: sampleSongs)
        let browRec14 = Artist(name: "Rock", image: "rr", type: "Playlist", color: .rock, isLiked: false, songs: sampleSongs)

        // Add the artists to the chart array
        searchVM = [browRec1, browRec2, browRec3, browRec4, browRec5, browRec6, browRec7, browRec8, browRec9, browRec10, browRec11, browRec12, browRec13, browRec14]
    }
}

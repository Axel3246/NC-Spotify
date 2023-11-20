//
//  HomeViewModel.swift
//  NC1-Spotify
//
//  Created by Axel Amós Hernández Cárdenas on 16/11/23.
//

import Foundation

class HomeViewModel{
    
    var homeModel: [Artist] = []

    init() {

        let sampleSongs = [
            Song(name: "Song 1", image: "", isLiked: false),
            Song(name: "Song 2", image: "", isLiked: false),
            Song(name: "Song 3", image: "", isLiked: false)
        ]

        // ARTIST
        let purpleDisco = Artist(name: "Purple Disco Machine", image: "pdm", type: "Artist", isLiked: false, songs: sampleSongs)

        // PLAYLIST
        let joyas = Artist(name: "Joyas del Recuerdo", image: "cien", type: "Playlist", creator: "Axel Amós", isLiked: false, songs: sampleSongs)

        // ALBUM
        let cig = Artist(name: "Cig in the \nMorning", image: "cim", type: "Album", isLiked: false, songs: sampleSongs)
        let mid = Artist(name: "Midnights (3am\nEdition)", image: "mid", type: "Album", isLiked: false, songs: sampleSongs)
        let bhl = Artist(name: "Black Hole Love", image: "bhl", type: "Album", isLiked: false, songs: sampleSongs)
        let ooc = Artist(name: "Honkai Star Rail \n- Out of Control (Original Game Soundtrack)", image: "ooc", type: "Album", isLiked: false, songs: sampleSongs)
        let rising = Artist(name: "rising", image: "rising", type: "Album", isLiked: false, songs: sampleSongs)
        
        // Add the artists to the home array
        homeModel = [mid, purpleDisco, cig, joyas, bhl, ooc, rising]
    }
}

//
//  ArtistViewModel.swift
//  NC1-Spotify
//
//  Created by Axel Amós Hernández Cárdenas on 15/11/23.
//

import Foundation

class ArtistViewModel {
    
    var artists: [Artist] = []
    
    init() {
        let duaLipaSongs = [
            Song(name: "Houdini", image: "", isLiked: false),
            Song(name: "Levitating", image: "", isLiked: false),
            Song(name: "Don't Start Now", image: "", isLiked: false)
        ]
        let sampleSongs = [
            Song(name: "Song 1", image: "", isLiked: false),
            Song(name: "Song 2", image: "", isLiked: false),
            Song(name: "Song 3", image: "", isLiked: false)
        ]
        
        // ARTISTS
        let duaLipa = Artist(name: "Dua Lipa", image: "dua", type: "Artist", isLiked: true, songs: duaLipaSongs)
        let boochi = Artist(name: "結束バンド", image: "kesoku", type: "Artist", isLiked: false, songs: sampleSongs)
        let benee = Artist(name: "BENEE", image: "benee", type: "Artist", isLiked: true, songs: sampleSongs)
        let coastModren = Artist(name: "Coast Modern", image: "cm", type: "Artist", isLiked: false, songs: sampleSongs)
        let maxFrost = Artist(name: "Max Frost", image: "mf", type: "Artist", isLiked: false, songs: sampleSongs)
        let mxmToon = Artist(name: "mxmtoon", image: "mxm", type: "Artist", isLiked: false, songs: sampleSongs)
        let purpleDisco = Artist(name: "Purple Disco Machine", image: "pdm", type: "Artist", isLiked: false, songs: sampleSongs)
        
        // ALBUM
        let ooc = Artist(name: "Honkai Star Rail Out of Control (Original Game Soundtrack)", image: "ooc", type: "Album", isLiked: false, songs: sampleSongs)
        let mid = Artist(name: "Midnights (3am Edition)", image: "mid", type: "Album", isLiked: false, songs: sampleSongs)
        let rising = Artist(name: "rising", image: "rising", type: "Album", isLiked: false, songs: sampleSongs)
        
        // PLAYLIST
        let joyas = Artist(name: "Joyas del Recuerdo", image: "cien", type: "Playlist", creator: "Axel Amós", isLiked: true, songs: sampleSongs)

        // Add the artists to the artists array
        artists = [duaLipa, benee, joyas, boochi, maxFrost, ooc, mid, mxmToon, purpleDisco, coastModren, rising]
    }
}

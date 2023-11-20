//
//  InternetVM.swift
//  NC1-Spotify
//
//  Created by Axel Amós Hernández Cárdenas on 16/11/23.
//

import Foundation

class InternetVM{
    
    var internetVM: [Artist] = []

    init() {

        let sampleSongs = [
            Song(name: "Song 1", image: "", isLiked: false),
            Song(name: "Song 2", image: "", isLiked: false),
            Song(name: "Song 3", image: "", isLiked: false)
        ]

        let popup1 = Artist(name: "", image: "pop2", type: "Playlist", description: "Dua Lipa, Metro Boomin, Taylor Swift, The Weekend", isLiked: false, songs: sampleSongs)
        let popup2 = Artist(name: "", image: "rap", type: "Playlist", description: "Kendrick Lamar, 50 Cent, Lil Nas X, DJ Khaled, Future", isLiked: false, songs: sampleSongs)
        let popup3 = Artist(name: "", image: "rnb", type: "Playlist", description: "The playlist for RnB vibes lovers!", isLiked: false, songs: sampleSongs)
        let popup4 = Artist(name: "", image: "cpop", type: "Playlist", description: "Bad Bunny, KAROL G, Eminem, Peso Pluma", isLiked: false, songs: sampleSongs)

        // Add the artists to the internet array
        internetVM = [popup1, popup2, popup3, popup4]
    }
}

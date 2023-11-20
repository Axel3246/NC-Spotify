//
//  ChartsVM.swift
//  NC1-Spotify
//
//  Created by Axel Amós Hernández Cárdenas on 16/11/23.
//


import Foundation

class ChartsVM{
    
    var chartVM: [Artist] = []

    init() {

        let sampleSongs = [
            Song(name: "Song 1", image: "", isLiked: false),
            Song(name: "Song 2", image: "", isLiked: false),
            Song(name: "Song 3", image: "", isLiked: false)
        ]

        let chart1 = Artist(name: "", image: "t5g", type: "Chart", description: "Your Daily update of the most played tracks right now - Global.", isLiked: false, songs: sampleSongs)
        let chart2 = Artist(name: "", image: "t5m", type: "Chart", description: "Your Daily update of the most played tracks right now - Mexico.", isLiked: false, songs: sampleSongs)
        let chart3 = Artist(name: "", image: "t5u", type: "Chart", description: "Your Daily update of the most played tracks right now - USA.", isLiked: false, songs: sampleSongs)

        // Add the artists to the chart array
        chartVM = [chart1, chart2, chart3]
    }
}


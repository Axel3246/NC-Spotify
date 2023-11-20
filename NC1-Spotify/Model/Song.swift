//
//  Song.swift
//  NC1-Spotify
//
//  Created by Axel Amós Hernández Cárdenas on 15/11/23.
//

import Foundation

struct Song: Identifiable{
    
    var id: UUID = UUID()
    var name: String
    var image: String
    var isLiked: Bool
    var artist: Artist?
}

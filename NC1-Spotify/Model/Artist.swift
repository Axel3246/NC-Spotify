//
//  Artist.swift
//  NC1-Spotify
//
//  Created by Axel Amós Hernández Cárdenas on 15/11/23.
//

import Foundation
import SwiftUI

struct Artist: Identifiable {
    
    var id: UUID = UUID()
    var name: String
    var image: String
    var type: String
    var creator: String = ""
    var description: String = ""
    var color: Color = .accentColor
    var isLiked: Bool
    var songs: [Song]
}

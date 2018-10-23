//
//  Movie.swift
//  My Movie List
//
//  Created by Raiyan Rahman on 2018-10-23.
//  Copyright © 2018 Raiyan Rahman. All rights reserved.
//

import Foundation

class Movie {
    var id: String
    var title: String
    var year: String
    var imageURL: String
    var plot: String
    
    init(id: String, title: String, year: String, imageURL: String, plot: String = "")   {
        self.id = id
        self.title = title
        self.year = year
        self.imageURL = imageURL
        self.plot = plot
    }
}

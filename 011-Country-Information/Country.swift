//
//  Country.swift
//  011-Country-Information-with-UITableView
//
//  Created by Audrey Li on 4/4/15.
//  Copyright (c) 2015 UIColle. All rights reserved.
//

import Foundation

class Country {
    var countryCode: String!
    var countryName: String!
    var currencyCode: String!
    var population: Int!
    var flipsCode: String!
    var iosNumeric: String!
    var north: Float!
    var south: Float!
    var east: Float!
    var west: Float!
    var capital: String!
    var continentName: String!
    var continent: String!
    var areaInsqKm: Float!
    var language: String!
    var isoAlpha3: String!
    var geonameId: String!
    
    init(data: NSDictionary) {
        self.countryCode = data["countryCode"] as String
        self.countryName = data["countryName"] as String
        self.currencyCode = data["currencyCode"] as String
        self.population = (data["population"] as String).toInt()
        self.flipsCode = data["fipsCode"] as String
        self.iosNumeric = data["isoNumeric"] as String
        self.north = (data["north"] as String).toFloat()
        self.south = (data["south"] as String).toFloat()
        self.east = (data["east"] as String).toFloat()
        self.west = (data["west"] as String).toFloat()
        self.capital = data["capital"] as String
        self.continentName = data["continentName"] as String
        self.continent = data["continent"] as String
        self.areaInsqKm = (data["areaInSqKm"] as String).toFloat()
        self.language = data["languages"] as String
        self.isoAlpha3 = data["isoAlpha3"] as String
        self.geonameId = data["geonameId"] as String
    }
    

}

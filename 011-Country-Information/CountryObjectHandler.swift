//
//  CountryObjectHandler.swift
//  011-Country-Information-with-UITableView
//
//  Created by Audrey Li on 4/4/15.
//  Copyright (c) 2015 UIColle. All rights reserved.
//

import Foundation

class CountryObjectHandler {
    
    var countries:[Country]!
    
    init(jsonFileName: String){
        countries = [Country]()
        DataFetchService.getJSONFromFile(jsonFileName) { (jsonDict) -> Void in
            if let countriesData = jsonDict["countries"]!["country"] as? NSArray {
                for countryData in countriesData {
                    var country = Country(data: countryData as NSDictionary)
                    self.countries.append(country)
                }
            }
        }
    }
    
    
    func getCountryNamesArray() -> [String] {
        return countries.map{ $0.countryName }
    }
    func getCountryCodeArray() -> [String] {
        return countries.map{ $0.countryCode }
    }
    
    func getCountryByName(name: String) -> Country {
        var countryNameArray = getCountryNamesArray()
        if !countryNameArray.contains(name) {
           println("the country name is not correct")
        }
         return getCountriesDictionary()[name]!
    }
    
    func getCountriesDictionary() -> [String: Country]{
        var tempDict = [String : Country]()
        
        for country in countries {
            tempDict[country.countryName] = country
        }
        
        return tempDict
    }
    
    //create a dictonary where the key is the countinent name, and the value is a list of countries
    func getCountriesDictionaryWithContinent() -> [String: [Country]] {
        var tempDict = [String : [Country]]()
        for country in countries {
            if tempDict[country.continentName] != nil {
                var tempCountryArr = [Country]() //must intialize it. Otherwise it swift will show it's immutable
                tempCountryArr = tempDict[country.continentName]!
                tempCountryArr.append(country)
                tempDict[country.continentName] = tempCountryArr
            } else {
                tempDict[country.continentName] = [country]
            }
        }
        
        return tempDict
        
    }
    
    func getCountriesDIctionaryWithContinentAnyObject() -> [String: [AnyObject]] {
        var tempDict = [String : [AnyObject]]()
        
        for country in countries {
            if tempDict[country.continentName] != nil {
                
                var tempCountryArr = [AnyObject]() //must intialize it. Otherwise it swift will show it's immutable
                
                tempCountryArr = tempDict[country.continentName]!
                tempCountryArr.append(country)
                tempDict[country.continentName] = tempCountryArr
            } else {
                tempDict[country.continentName] = [country]
            }
        }
        
        return tempDict
    }
    
    func getCountriesAndContients() -> ([String], [[Country]]) {
        var dict = getCountriesDictionaryWithContinent()
        var continents = [String]()
        var countriesInCountinent: [[Country]] = [[Country]()]
        
        for (K,V) in dict {
            continents.append(K)
            countriesInCountinent.append(V)
        }
        countriesInCountinent.removeAtIndex(0)
        
        return (continents, countriesInCountinent)
    }

    //  var array = objHandler.getCountryCodeArray().sorted {$0 < $1}.map{$0.lowercaseString}
}
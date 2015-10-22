//
//  CuisineFactory.swift
//  RecipeViewer4519560
//
//  Created by user112596 on 10/19/15.
//  Copyright (c) 2015 Victoria University in Sydney. All rights reserved.
//

import Foundation

class CuisineFactory {

    var cuisines: [String: Cuisine] = [:]

    class var instance: CuisineFactory {
        struct Static {
            static let _instance: CuisineFactory = CuisineFactory()
        }
        return Static._instance
    }

    func addCuisine(cuisine: Cuisine) {
        var cuisineName: String? = cuisine.getName()
        if cuisineName != nil && !cuisineName!.isEmpty {
            cuisines[cuisineName!] = cuisine
        }
    }

    func getCuisine(cuisineName: String) -> Cuisine {
        return cuisines[cuisineName]!
    }

    func debug() -> String {
        var retString = "Cuisine List [\n"
        for (key, value) in cuisines {
            retString += "\t\(value.debug())\n"
        }
        retString += "]"
        return retString
    }
}

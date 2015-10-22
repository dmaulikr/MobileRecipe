//
//  Cuisine.swift
//  RecipeViewer4519560
//
//  Created by user112596 on 10/19/15.
//  Copyright (c) 2015 Victoria University in Sydney. All rights reserved.
//

import Foundation

class Cuisine: ElementInterface {

    var keys: [String] = []
    var dictionary: [String: Recipe] = [:]

    init(tag: String, dict: [NSObject: AnyObject]) {
        super.init(tagName: tag, attribute: dict)
    }

    func getName() -> String {
        //let name = getAttribute("name")
        //return name!
        return getAttribute("name")!
    }

    func addAll(array: [Recipe]) {
        for recipe in array {
            addElement(recipe)
        }
    }

    func addElement(recipe: Recipe) {
        dictionary[recipe.getName()] = recipe
    }

    func getElement(index: Int) -> Recipe {
        if keys.isEmpty {
            makeKeyIndex()
        }

        return dictionary[keys[index]]!
    }

    func getElement(key: String) -> Recipe {
        return dictionary[key]!
    }

    func makeKeyIndex() {
        keys = [String](dictionary.keys)
        keys.sort( { $0 < $1 } )
    }

    func getCount() -> Int {
        return dictionary.count
    }

    func debug() -> String {
        var retString = "Cuisine Name : \(getName()) [\n"
        for cuisineName in keys {
            var recipe: Recipe? = getElement(cuisineName)
            if recipe != nil {
                retString += "\(recipe!.debug())"
            }
        }
        retString += "\t]"
        return retString
    }
}

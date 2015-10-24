//
//  IngredientList.swift
//  RecipeViewer4519560
//
//  Created by user112596 on 10/19/15.
//  Copyright (c) 2015 Victoria University in Sydney. All rights reserved.
//

import Foundation

enum IngredientType: String {
    case Main = "main", Sub = "sub", Extra = "extra"
    static let allValues = [Main, Sub, Extra]
}

class IngredientList: ElementInterface {

    var list = [String: [String: IngredientItem]]()

    init(tag: String, dict: [NSObject: AnyObject]) {
        for value in IngredientType.allValues {
            (list[value.rawValue]) = [:]
        }
        super.init(tagName: tag, attribute: dict)
    }

    func addIngredient(ingredient: IngredientItem) {
        var typeKey: String? = ingredient.getAttribute("type")
        if typeKey != nil && !typeKey!.isEmpty {
            var key: String? = ingredient.getName()
            if key != nil && !key!.isEmpty {
                (list[typeKey!])?[key!] = ingredient
            }
        }
    }

    func getAllIngredient() -> String {
        var retString = "Ingredients:"
        var count: Int = 0
        for (typeKey, typeList) in list {
            if typeList.count > 0 {
                count += typeList.count
                retString += "\n[\(typeKey)] "
            }
            for (key, value) in typeList {
                retString += "\(value.getAllIngredient()), "
            }
        }
        retString = "\(count) " + retString
        return retString
    }

    func getTotalIngredientCount() -> Int {
        var count: Int = 0
        for (typeKey, typeList) in list {
            count += typeList.count
        }
        return count
    }

    func getMainIngredient() -> String {
        var retString: String = ""
        for (typeKey, typeList) in list {
            if typeKey == IngredientType.Main.rawValue {
                for (key, value) in typeList {
                    retString += "\(key) "
                }
            }
        }
        return retString
    }

    func debug() -> String {
        var retString = "Ingredient List ["
        for (typeKey, typeList) in list {
            retString += "\n\t\t\t\tType \(typeKey) : "
            for (key, value) in typeList {
                retString += "\n\t\t\t\t\t\(value.debug())"
            }
        }
        retString += "\n\t\t\t]"
        return retString
    }
}

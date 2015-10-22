//
//  Recipe.swift
//  RecipeViewer4519560
//
//  Created by user112596 on 10/19/15.
//  Copyright (c) 2015 Victoria University in Sydney. All rights reserved.
//

import Foundation

class Recipe: ElementInterface {

    var description: String?
    var rating: Int? // 1 to 5
    var requiredTime: Int? // seconds
    var timeUnit: String?
    var numberOfServed: Int?
    var pictureName: String?
    var ingredients: IngredientList?

    init(tag: String, dict: [NSObject: AnyObject]) {
        super.init(tagName: tag, attribute: dict)
    }

    func getName() -> String {
        return getContent()
    }

    func setDifficulty(difficulty: String) {
        // Code for Swift 1.x
        rating = difficulty.toInt()
        // Code for Swift 2.x
        //rating = Int(difficulty)
    }

    func getDifficulty() -> Int {
        return rating!
    }

    func setTime(time: String) {
        // Code for Swift 1.x
        requiredTime = time.toInt()
        // Code for Swift 2.x
        // requiredTime = Int(time)
    }

    func getTime() -> Int {
        return requiredTime!
    }

    func setServe(serve: String) {
        // Code for Swift 1.x
        numberOfServed = serve.toInt()
        // Code for Swift 2.x
        // numberOfServed = Int(serve)
    }
    
    func getServe() -> Int {
        return numberOfServed!
    }

    func setPicture(picture: String) {
        pictureName = picture
    }
    
    func getPicture() -> String {
        return pictureName!
    }

    func setDescription(desc: String) {
        description = desc
    }

    func getDescription() -> String {
        return description!
    }

    func setUnit(unit: String) {
        timeUnit = unit
    }

    func getUnit() -> String {
        return timeUnit!
    }

    func addIngredientList(list: IngredientList) {
        ingredients = list
    }

    func addIngredient(ingredient: IngredientItem) {
        ingredients!.addIngredient(ingredient)
    }

    func debug() -> String {
        let retString: String = "\t\tRecipe Name : \(getName()) [\n\t\t\tRating : \(getDifficulty()), Time : \(getTime()) (\(getUnit())), Serve : \(getServe()), Image : \(getPicture())\n\t\t\t\(ingredients!.debug())\n\t\t\tDescription : \(getDescription())\n\t\t]\n"

        return retString
    }
}

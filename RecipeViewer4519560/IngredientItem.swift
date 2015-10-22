//
//  IngredientItem.swift
//  RecipeViewer4519560
//
//  Created by user112596 on 10/20/15.
//  Copyright (c) 2015 Victoria University in Sydney. All rights reserved.
//

import Foundation

class IngredientItem: ElementInterface {

    var quantity: String?
    var unit: String?

    init(tag: String, dict: [NSObject: AnyObject]) {
        super.init(tagName: tag, attribute: dict)
    }

    func getName() -> String {
        return getContent()
    }

    func setQuantity(quantity: String) {
        self.quantity = quantity
    }

    func getQuantity() -> String {
        return quantity!
    }

    func setUnit(unit: String) {
    	self.unit = unit
    }

    func getUnit() -> String {
        return unit!
    }

    func debug() -> String {
        let retString = "Name(\(getName())) Quantity(\(quantity!)) Unit(\(unit!))"
        return retString
    }
}

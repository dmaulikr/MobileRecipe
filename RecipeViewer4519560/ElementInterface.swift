//
//  ElementInterface.swift
//  RecipeViewer4519560
//
//  Created by user112596 on 10/21/15.
//  Copyright (c) 2015 Victoria University in Sydney. All rights reserved.
//

import Foundation

class ElementInterface {
    var tagName: String
    var content: String?
    var attribute: [NSObject: AnyObject]

    init(tagName: String, attribute: [NSObject: AnyObject]) {
        self.tagName = tagName
        self.attribute = attribute
    }

    func getTagName() -> String {
        return tagName
    }

    func setContent(content: String) {
        self.content = content
    }

    func getContent() -> String {
        return content!
    }

    func getAttribute(key: String) -> String? {
        var value: String?
        var obj: AnyObject? = attribute[key]
        if (obj != nil) {
            value = (obj as! String)
        }
        return value!
    }
}

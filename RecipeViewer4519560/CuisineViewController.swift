//
//  CuisineViewController.swift
//  RecipeViewer4519560
//
//  Created by user112596 on 10/19/15.
//  Copyright (c) 2015 Victoria University in Sydney. All rights reserved.
//

import UIKit

class CuisineViewController: UIViewController, NSXMLParserDelegate {

    var currCuisine: Cuisine?
    var currRecipe: Recipe?
    var currIngredientList: IngredientList?
    var currIngredientItem: IngredientItem?
    var content: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        readData()
        print("End of Parsing\n")
        //print("\(CuisineFactory.instance.debug())")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let button = sender as! UIButton
        let destination: RecipeViewController = segue.destinationViewController as! RecipeViewController
        let cuisineFactory = CuisineFactory.instance
        let cuisine = cuisineFactory.getCuisine(button.currentTitle!)
        destination.setCuision(cuisine)
    }

    func readData() {
        let path = NSBundle.mainBundle().pathForResource("data", ofType: "xml")
        if path != nil {
            var parser = NSXMLParser(contentsOfURL: NSURL(fileURLWithPath: path!))
            if parser != nil {
                // Do stuff with the parser here.
                parser!.delegate = self
                parser!.parse()
            }
        } else {
            NSLog("Failed to find data.xml")
        }
    }

    enum TagName: String {
        case RootTag = "recipe_list"
        case CuisineTag = "cuisine"
        case RecipeTag = "recipe"
        case RecipeNameTag = "recipe_name"
        case DifficultyTag = "difficulty"
        case TimeTag = "time"
        case ServeTag = "serve"
        case DescriptionTag = "description"
        case PictureTag = "picture"
        case IngredientListTag = "ingredients"
        case IngredientTag = "ingredient"
        case IngredientNameTag = "name"
        case IngredientQuantityTag = "quantity"
    }

    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        switch elementName {
        case TagName.RootTag.rawValue:
            break;
        case TagName.CuisineTag.rawValue:
            currCuisine = Cuisine(tag: elementName, dict: attributeDict)
            CuisineFactory.instance.addCuisine(currCuisine!)
            break
        case TagName.RecipeTag.rawValue:
            currRecipe = Recipe(tag: elementName, dict: attributeDict)
            break
        case TagName.RecipeNameTag.rawValue:
            break;
        case TagName.DifficultyTag.rawValue:
            break;
        case TagName.TimeTag.rawValue:
            var unit = attributeDict["unit"]! as! String
            currRecipe!.setUnit(unit)
            break;
        case TagName.ServeTag.rawValue:
            break;
        case TagName.DescriptionTag.rawValue:
            break;
        case TagName.PictureTag.rawValue:
            break;
        case TagName.IngredientListTag.rawValue:
            currIngredientList = IngredientList(tag: elementName, dict: attributeDict)
            currRecipe!.addIngredientList(currIngredientList!)
            break;
        case TagName.IngredientTag.rawValue:
            currIngredientItem = IngredientItem(tag: elementName, dict: attributeDict)
            break;
        case TagName.IngredientNameTag.rawValue:
            break;
        case TagName.IngredientQuantityTag.rawValue:
            var unit: String = attributeDict["unit"] as! String
            currIngredientItem!.setUnit(unit)
            break;
        default:
            break
        }
    }

    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        switch elementName {
        case TagName.RootTag.rawValue:
            break;
        case TagName.CuisineTag.rawValue:
            currCuisine!.makeKeyIndex()
            break;
        case TagName.RecipeTag.rawValue:
            currCuisine!.addElement(currRecipe!)
            break;
        case TagName.RecipeNameTag.rawValue:
            currRecipe!.setContent(content)
            break;
        case TagName.DifficultyTag.rawValue:
            currRecipe!.setDifficulty(content)
            break;
        case TagName.TimeTag.rawValue:
            currRecipe!.setTime(content)
            break;
        case TagName.ServeTag.rawValue:
            currRecipe!.setServe(content)
            break;
        case TagName.DescriptionTag.rawValue:
            currRecipe!.setDescription(content)
            break;
        case TagName.PictureTag.rawValue:
            currRecipe!.setPicture(content)
            break;
        case TagName.IngredientListTag.rawValue:
            break;
        case TagName.IngredientTag.rawValue:
            break;
        case TagName.IngredientNameTag.rawValue:
            currIngredientItem!.setContent(content)
            currIngredientList!.addIngredient(currIngredientItem!)
            break;
        case TagName.IngredientQuantityTag.rawValue:
            currIngredientItem!.setQuantity(content)
            break;
        default:
            break;
        }
    }

    func parser(parser: NSXMLParser, foundCharacters string: String?) {
        let trimmedString = string?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        if trimmedString != nil && !trimmedString!.isEmpty {
            content = trimmedString!
        } else {
            content = ""
        }
    }

    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
    }
}

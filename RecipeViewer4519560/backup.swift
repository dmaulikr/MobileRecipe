//
//  RecipeFormulaViewController.swift
//  RecipeViewer4519560
//
//  Created by user112596 on 10/19/15.
//  Copyright (c) 2015 Victoria University in Sydney. All rights reserved.
//

import UIKit

class RecipeFormulaViewController: UIViewController {

    var recipe: Recipe?

    //@IBOutlet weak var ingredientText: UITextView!
    @IBOutlet weak var stepText: UITextView!
    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var serveLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    func setRecipe(redcipe: Recipe) {
        self.recipe = redcipe
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        recipeLabel.text = recipe!.getName()
        rateLabel.text = "Difficulty: \(recipe!.getDifficulty())"
        serveLabel.text = "Serve: \(recipe!.getServe())"
        var temp = recipe!.getStep().stringByReplacingOccurrencesOfString(". Step", withString: ".\n\nStep")
        print("\(temp)")
        //ingredientText.text = recipe!.getAllIngredient()
        stepText.text = recipe!.getAllIngredient() + "\n\n" + temp
        
        imageView.image = UIImage(named: recipe!.getPicture())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

//
//  PopUpViewController.swift
//  RecipeViewer4519560
//
//  Created by user112596 on 10/23/15.
//  Copyright (c) 2015 Victoria University in Sydney. All rights reserved.
//

import UIKit

protocol SavingViewControllerDelegate {
    func saveText(var strText: NSString)
}

class PopUpViewController: UIViewController {
    var delegate : SavingViewControllerDelegate?
    var recipe: Recipe!

    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var totalIngredientLabel: UILabel!
    @IBOutlet weak var serveLabel: UILabel!
    @IBOutlet weak var mainIngredientText: UITextView!

    @IBAction func btnCloseClicked(sender: UIButton) {
        if((self.delegate) != nil)
        {
            delegate?.saveText("Test");
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cell = sender as! UIButton
        let destination: RecipeFormulaViewController = segue.destinationViewController as! RecipeFormulaViewController
        destination.setRecipe(recipe)
    }

    func setViewData() {
        self.title = recipe.getName()
        descriptionText.text = "Description: \(recipe.getDescription())"
        difficultyLabel.text = "Difficulty: \(recipe.getDifficulty())"
        totalIngredientLabel.text = "Ingredients: 10"
        mainIngredientText.text = "Main: \(recipe.getMainIngredient())"
        serveLabel.text = "Served: \(recipe.getServe())"
        timeLabel.text = "Required Time: \(recipe.getTime()) (\(recipe.getUnit()))"
        recipeImage.image = UIImage(named: recipe.getPicture())
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setViewData()
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

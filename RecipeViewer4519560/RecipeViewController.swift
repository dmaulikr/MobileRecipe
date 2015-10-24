//
//  RecipeViewController.swift
//  RecipeViewer4519560
//
//  Created by user112596 on 10/19/15.
//  Copyright (c) 2015 Victoria University in Sydney. All rights reserved.
//

import UIKit

class RecipeViewController: UITableViewController, SavingViewControllerDelegate, UIPopoverPresentationControllerDelegate {

    var cuisine: Cuisine?

    func saveText(strText: NSString) {
        //labelText.text=strText
        print("Call Here\n")
    }

    // MARK: - UIPopoverPresentationControllerDelegate
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        //return .FullScreen
        return .Popover
    }

    func presentationController(controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        return UINavigationController(rootViewController: controller.presentedViewController)
    }

    @IBAction func btnClicked(sender: CustomButton) {
        //let alertController = UIAlertController(title: "Welcome", message: "HelloWorld", preferredStyle: UIAlertControllerStyle.Alert)
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        //self.presentViewController(alertController, animated: true, completion: nil)

        let destination = storyboard?.instantiateViewControllerWithIdentifier("PopUpController") as! PopUpViewController

        let recipe = cuisine!.getElement(sender.recipeName!)
        destination.delegate=self;
        destination.recipe = recipe

        destination.modalPresentationStyle = .Popover
        if let popoverController = destination.popoverPresentationController {
            popoverController.sourceView = sender
            popoverController.sourceRect = sender.bounds
            popoverController.permittedArrowDirections = .Any
            popoverController.delegate = self
        }
        presentViewController(destination, animated: true, completion: nil)
    }

    func setCuision(cuisine: Cuisine) {
        self.cuisine = cuisine
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.title = cuisine!.getName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return cuisine!.getCount()
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("recipeCell", forIndexPath: indexPath) as! RecipeCell
        // Configure the cell...
        let recipe = cuisine!.getElement(indexPath.row)
        //cell.textLabel?.text = recipe.getName()
        //cell.detailTextLabel?.text = "Total Ingredients: \(recipe.getTotalIngredientCount())"
        cell.titleLabel?.text = recipe.getName()
        //cell.difficultyLabel?.text = "\(recipe.getDifficulty())"
        //cell.timeLabel?.text = "\(recipe.getTime())"
        //cell.mainIngredientLabel?.text =
        //cell.numberOfIngredientLabel?.text = "\(recipe.getTotalIngredientCount())"
        //cell.briefDescriptionLabel?.text = recipe.getDescription()
        cell.clickButton.setBackgroundImage(UIImage(named: recipe.getPicture()), forState: .Normal)
        cell.clickButton.recipeName = recipe.getName()
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cell = sender as! RecipeCell
        let destination: RecipeFormulaViewController = segue.destinationViewController as! RecipeFormulaViewController
        //let recipe = cuisine!.getElement(cell.textLabel!.text!)
        let recipe = cuisine!.getElement(cell.titleLabel!.text!)
        destination.setRecipe(recipe)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
}

//
//  ViewController.swift
//  FetchRecipes
//
//  Created by John Nimis on 7/5/22.
//

import UIKit

class RecipeDetailViewController: UIViewController {

  var recipeId : String?
  var recipe : MealDetail?
  var ingredientsData : [Ingredient] = []
  
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!
  @IBOutlet var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "IngredientCell")
    if !HTTPUtil.shared().fetchMeal(mealId: recipeId ?? "", completion: { recipe, errorMessage in
      if let data = recipe {
        self.formatForRecipe(data)
      } else if let err = errorMessage {
        self.formatForError(err)
      }
    }) {
      formatForError("HTTP request failed to send")
    }
  }
  
  func formatForRecipe(_ data : MealDetail) {
    DispatchQueue.main.async {
      self.ingredientsData = data.ingredients
      self.titleLabel.text = data.strMeal
      self.descriptionLabel.text = data.strInstructions
      self.tableView.reloadData()
    }
  }
  
  func formatForError(_ error : String) {
    DispatchQueue.main.async {
      self.titleLabel.text = "Oops!"
      self.descriptionLabel.text = "There was an error, please try again!"
      print("ERROR: \(error)")
    }
  }

  override func viewWillDisappear(_ animated: Bool) {
    // super basic cache management, just to make sure the user doesn't see the last
    // viewed recipe if they have navigated back to the list and returned
    recipe = nil
    ingredientsData = []
  }

}

extension RecipeDetailViewController : UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return ingredientsData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell") else {
      print("unable to dequeue reusable cell for ingredient")
      return UITableViewCell()
    }
    
    let ingredient = ingredientsData[indexPath.row]
    cell.textLabel?.text = "• \(ingredient.name): \(ingredient.measure)"
    
    return cell
  }
  
}

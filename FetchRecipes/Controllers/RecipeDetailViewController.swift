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
  
  var backButton : UIButton = {
    let back = UIButton(type: .roundedRect)
    back.setTitle("< Back", for: .normal)
    back.addTarget(RecipeDetailViewController.self, action: #selector(backAction), for: .touchUpInside)
    return back
  }()
  
  var tableView = UITableView(frame: .zero)
  var titleLabel = UILabel(frame: .zero)
  var descriptionLabel = UILabel(frame: .zero)
  var scrollView = UIScrollView()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(titleLabel)
    view.addSubview(scrollView)
    view.addSubview(tableView)
    view.backgroundColor = .systemBackground

    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    tableView.translatesAutoresizingMaskIntoConstraints = false

    ConstraintUtil.pinToTop(titleLabel, inView: self.view, padding: 125)
    ConstraintUtil.pinToLeft(titleLabel, inView: self.view, padding: 8)
    ConstraintUtil.pinToRight(titleLabel, inView: self.view, padding: 8)
    titleLabel.font = UIFont.systemFont(ofSize: 28)
    titleLabel.numberOfLines = 0
    
    ConstraintUtil.pinBelow(scrollView, toView: titleLabel, inView: self.view, padding: 24)
    ConstraintUtil.pinToLeft(scrollView, inView: self.view, padding: 8)
    ConstraintUtil.pinToRight(scrollView, inView: self.view, padding: 8)
    ConstraintUtil.constrainHeight(scrollView, to: 200)
    ConstraintUtil.constrainWidth(scrollView, to: self.view.bounds.size.width)
    
    ConstraintUtil.placeView(descriptionLabel, inside: scrollView, padding: 8)
    
    descriptionLabel.numberOfLines = 0
    
    ConstraintUtil.pinBelow(tableView, toView: scrollView, inView: self.view, padding: 24)
    ConstraintUtil.pinToBottom(tableView, inView: self.view, padding: 24)
    ConstraintUtil.pinToLeft(tableView, inView: self.view, padding: 8)
    ConstraintUtil.pinToRight(tableView, inView: self.view, padding: 8)
    
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "IngredientCell")
    
    // show loading overlay
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
      ConstraintUtil.constrainWidth(self.descriptionLabel, to: self.scrollView.bounds.size.width * 0.95)

      self.tableView.reloadData()
      // dismiss loading overlay and show error
    }
  }
  
  func formatForError(_ error : String) {
    DispatchQueue.main.async {
      self.titleLabel.text = "Oops!"
      self.descriptionLabel.text = "There was an error, please try again!"
      print("ERROR: \(error)")
      // dismiss loading overlay and show error
    }
  }

  override func viewWillDisappear(_ animated: Bool) {
    // super basic cache management, just to make sure the user doesn't see the last
    // viewed recipe if they have navigated back to the list and returned
    recipe = nil
    ingredientsData = []
  }

  @objc func backAction() {
    self.navigationController?.popViewController(animated: true)
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

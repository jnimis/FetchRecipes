//
//  RecipeListViewController.swift
//  FetchRecipes
//
//  Created by John Nimis on 7/5/22.
//

import UIKit

class RecipeListViewController: UIViewController {

  var tableView = UITableView(frame: .zero)
  var recipeList : [MealItem] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.translatesAutoresizingMaskIntoConstraints = false
    ConstraintUtil.placeView(tableView, inside: self.view)
    tableView.register(RecipeListTableViewCell.self, forCellReuseIdentifier: "ListCell")
    tableView.dataSource = self
    tableView.delegate = self
    
    // show loading overlay
    
    if !HTTPUtil.shared().fetchDesserts(completion: { meals, errorMessage in
      if let result = meals {
        self.recipeList = result
        DispatchQueue.main.async {
          self.tableView.reloadData()
          // dismiss loading overlay
        }
      } else if let e = errorMessage {
        
        // dismiss loading overlay and show error (on main queue)
        print("show the user a generic message, but we know that the error is \(e)")
      }
    }) {
      // dismiss loading overlay and show error
      print("CODING ERROR: the request was never sent")
    }
  }
}

extension RecipeListViewController : UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let meal = recipeList[indexPath.row]
    let detailVc = RecipeDetailViewController()
    detailVc.recipeId = meal.idMeal
    
    self.navigationController?.pushViewController(detailVc, animated: true)
  }
}

extension RecipeListViewController : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return recipeList.count > 0 ? recipeList.count : 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as? RecipeListTableViewCell, recipeList.count > 0 {
      
      let meal = recipeList[indexPath.row]
      cell.format(for: meal)
      
      return cell
      
    } else {
      return UITableViewCell()
    }
  }
}

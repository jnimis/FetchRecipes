//
//  RecipeListTableViewCell.swift
//  FetchRecipes
//
//  Created by John Nimis on 7/5/22.
//

import UIKit
import Kingfisher

class RecipeListTableViewCell: UITableViewCell {
  
  @IBOutlet var thumbView : UIImageView!
  @IBOutlet var label : UILabel!

  public func format(for item: MealItem) {
    label.text = item.strMeal
    thumbView.kf.setImage(with: URL(string: item.strMealThumb))
  }
    
}

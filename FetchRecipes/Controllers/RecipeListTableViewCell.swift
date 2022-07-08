//
//  RecipeListTableViewCell.swift
//  FetchRecipes
//
//  Created by John Nimis on 7/5/22.
//

import UIKit
import Kingfisher

class RecipeListTableViewCell: UITableViewCell {
  
  var thumbView = UIImageView(frame: .zero)
  
  var label : UILabel = {
    let label = UILabel() // UILabel(frame: CGRect(x: 5, y: 5, width: 5, height: 5))
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    addSubview(label)
    addSubview(thumbView)

    label.translatesAutoresizingMaskIntoConstraints = false
    thumbView.translatesAutoresizingMaskIntoConstraints = false

    ConstraintUtil.pinToLeft(thumbView, inView: self, padding: 8.0)
    ConstraintUtil.centerY(thumbView, inView: self)
    ConstraintUtil.constrainWidth(thumbView, to: 32)
    ConstraintUtil.constrainHeight(thumbView, to: 32)

    ConstraintUtil.pinToRight(label, inView: self, padding: 8.0)
    ConstraintUtil.centerY(label, inView: self)
    
    let spaceBetweenConstraint = NSLayoutConstraint.init(item: label,
                                                         attribute: .leading,
                                                         relatedBy: .equal,
                                                         toItem: thumbView,
                                                         attribute: .trailing,
                                                         multiplier: 1.0,
                                                         constant: 24)
    self.addConstraint(spaceBetweenConstraint)
  }

  public func format(for item: MealItem) {
    label.text = item.strMeal
    thumbView.kf.setImage(with: URL(string: item.strMealThumb))
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
    
}

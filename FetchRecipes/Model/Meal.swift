//
//  Meal.swift
//  FetchRecipes
//
//  Created by John Nimis on 7/5/22.
//

import Foundation

struct MealItem : Codable {
  var strMeal : String
  var strMealThumb : String
  var idMeal : String
}

struct MealDetail : Codable {
  
  var strMeal : String
  var strInstructions : String
  var ingredients : [Ingredient]

  struct MealKeys: CodingKey {
    var stringValue: String
    var intValue: Int?
    
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    init?(intValue: Int) {
        self.stringValue = "\(intValue)";
        self.intValue = intValue
    }
  }
  
  init(from decoder: Decoder) throws {
    var ingredients : [Ingredient] = []
    var ingredientsMap : [Int:Ingredient] = [:]
    var mealName = ""
    var mealInstructions = ""
    
    let container = try decoder.container(keyedBy: MealKeys.self)
    for key in container.allKeys {
      guard let val = try container.decodeIfPresent(String.self, forKey: key) else {
        continue
      }
      let keyString = key.stringValue
      if key.stringValue.hasPrefix("strIngredient") && !StringUtil.isEmpty(val) {
        let index = keyString.index(keyString.startIndex, offsetBy: 13)
        let orderString = keyString[index...]
        guard let order = Int(orderString) else {
          print("\(orderString) could not be parsed as Int")
          continue
        }
        var ingredient = ingredientsMap[order]
        if ingredient == nil {
          ingredient = Ingredient(name: val, measure: "")
          ingredientsMap[order] = ingredient
        } else {
          ingredientsMap[order] = Ingredient(name: val, measure: ingredient!.measure)
        }
      } else if key.stringValue.hasPrefix("strMeasure") && !StringUtil.isEmpty(val) {
        let index = keyString.index(keyString.startIndex, offsetBy: 10)
        let orderString = keyString[index...]
        guard let order = Int(orderString) else {
          print("\(orderString) could not be parsed as Int")
          continue
        }
        var ingredient = ingredientsMap[order]
        if ingredient == nil {
          ingredient = Ingredient(name: "", measure: val)
          ingredientsMap[order] = ingredient
        } else {
          ingredientsMap[order] = Ingredient(name: ingredient!.name, measure: val)
        }
      } else if key.stringValue == "strMeal" {
        mealName = val
      } else if key.stringValue == "strInstructions" {
        mealInstructions = val
      }
    }
    for i in ingredientsMap.keys.sorted() {
      if let ingredient = ingredientsMap[i] {
        ingredients.append(ingredient)
      } else {
        print("unexpectedly found no value for key \(i)")
      }
    }
    strMeal = mealName
    strInstructions = mealInstructions
    self.ingredients = ingredients
  }
}

struct Ingredient : Codable {
  var name : String
  var measure : String
}

struct MealListResponse : Codable {
  var meals : [MealItem]
}

struct MealDetailResponse : Codable {
  var meals : [MealDetail]
}

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
  var strMealThumb : String
  
  var strInstructions : String
  
  var strIngredient1 : String
  var strIngredient2 : String
  var strIngredient3 : String
  var strIngredient4 : String
  var strIngredient5 : String
  var strIngredient6 : String
  var strIngredient7 : String
  var strIngredient8 : String
  var strIngredient9 : String
  var strIngredient10 : String
  var strIngredient11 : String
  var strIngredient12 : String
  var strIngredient13 : String
  var strIngredient14 : String
  var strIngredient15 : String
  var strIngredient16 : String
  var strIngredient17 : String
  var strIngredient18 : String
  var strIngredient19 : String
  var strIngredient20 : String

  var strMeasure1 : String
  var strMeasure2 : String
  var strMeasure3 : String
  var strMeasure4 : String
  var strMeasure5 : String
  var strMeasure6 : String
  var strMeasure7 : String
  var strMeasure8 : String
  var strMeasure9 : String
  var strMeasure10 : String
  var strMeasure11 : String
  var strMeasure12 : String
  var strMeasure13 : String
  var strMeasure14 : String
  var strMeasure15 : String
  var strMeasure16 : String
  var strMeasure17 : String
  var strMeasure18 : String
  var strMeasure19 : String
  var strMeasure20 : String
  
  var ingredients : [Ingredient] {
    get {
      var ingredientsArray : [Ingredient] = []
      
      // this is a bummer, I was looking for a way to use a custom decoder and reflection,
      // but I don't think this 
      
      if !StringUtil.isEmpty(strIngredient1) {
        let i = Ingredient(name: strIngredient1, measure: strMeasure1)
        ingredientsArray.append(i)
      }
      if !StringUtil.isEmpty(strIngredient2) {
        let i = Ingredient(name: strIngredient2, measure: strMeasure2)
        ingredientsArray.append(i)
      }
      if !StringUtil.isEmpty(strIngredient3) {
        let i = Ingredient(name: strIngredient3, measure: strMeasure3)
        ingredientsArray.append(i)
      }
      if !StringUtil.isEmpty(strIngredient4) {
        let i = Ingredient(name: strIngredient4, measure: strMeasure4)
        ingredientsArray.append(i)
      }
      if !StringUtil.isEmpty(strIngredient5) {
        let i = Ingredient(name: strIngredient5, measure: strMeasure5)
        ingredientsArray.append(i)
      }
      if !StringUtil.isEmpty(strIngredient6) {
        let i = Ingredient(name: strIngredient6, measure: strMeasure6)
        ingredientsArray.append(i)
      }
      if !StringUtil.isEmpty(strIngredient7) {
        let i = Ingredient(name: strIngredient7, measure: strMeasure7)
        ingredientsArray.append(i)
      }
      if !StringUtil.isEmpty(strIngredient8) {
        let i = Ingredient(name: strIngredient8, measure: strMeasure8)
        ingredientsArray.append(i)
      }
      if !StringUtil.isEmpty(strIngredient9) {
        let i = Ingredient(name: strIngredient9, measure: strMeasure9)
        ingredientsArray.append(i)
      }
      if !StringUtil.isEmpty(strIngredient10) {
        let i = Ingredient(name: strIngredient10, measure: strMeasure10)
        ingredientsArray.append(i)
      }
      if !StringUtil.isEmpty(strIngredient11) {
        let i = Ingredient(name: strIngredient11, measure: strMeasure11)
        ingredientsArray.append(i)
      }
      if !StringUtil.isEmpty(strIngredient12) {
        let i = Ingredient(name: strIngredient12, measure: strMeasure12)
        ingredientsArray.append(i)
      }
      if !StringUtil.isEmpty(strIngredient13) {
        let i = Ingredient(name: strIngredient13, measure: strMeasure13)
        ingredientsArray.append(i)
      }
      if !StringUtil.isEmpty(strIngredient14) {
        let i = Ingredient(name: strIngredient14, measure: strMeasure14)
        ingredientsArray.append(i)
      }
      if !StringUtil.isEmpty(strIngredient15) {
        let i = Ingredient(name: strIngredient15, measure: strMeasure15)
        ingredientsArray.append(i)
      }
      if !StringUtil.isEmpty(strIngredient16) {
        let i = Ingredient(name: strIngredient16, measure: strMeasure16)
        ingredientsArray.append(i)
      }
      if !StringUtil.isEmpty(strIngredient17) {
        let i = Ingredient(name: strIngredient17, measure: strMeasure17)
        ingredientsArray.append(i)
      }
      if !StringUtil.isEmpty(strIngredient18) {
        let i = Ingredient(name: strIngredient18, measure: strMeasure18)
        ingredientsArray.append(i)
      }
      if !StringUtil.isEmpty(strIngredient19) {
        let i = Ingredient(name: strIngredient19, measure: strMeasure19)
        ingredientsArray.append(i)
      }
      if !StringUtil.isEmpty(strIngredient20) {
        let i = Ingredient(name: strIngredient20, measure: strMeasure20)
        ingredientsArray.append(i)
      }
      
      return ingredientsArray
    }
  }
  
}

struct Ingredient {
  var name : String
  var measure : String
}

struct MealListResponse : Codable {
  var meals : [MealItem]
}

struct MealDetailResponse : Codable {
  var meals : [MealDetail]
}

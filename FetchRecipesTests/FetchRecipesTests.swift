//
//  FetchRecipesTests.swift
//  FetchRecipesTests
//
//  Created by John Nimis on 7/5/22.
//

import XCTest
@testable import FetchRecipes

class FetchRecipesTests: XCTestCase {

  let testJson = """
  {
    "meals": [{
      "idMeal": "53022",
      "strMeal": "Polskie Nale\u{015b}niki (Polish Pancakes)",
      "strDrinkAlternate": null,
      "strCategory": "Dessert",
      "strArea": "Polish",
      "strInstructions": "Add flour, eggs, milk, water, and salt in a large bowl then mix with a hand mixer until you have a smooth, lump-free batter.\\r\\nAt this point, mix in the butter or the vegetable oil. Alternatively, you can use them to grease the pan before frying each pancake.\\r\\nHeat a non-stick pan over medium heat, then pour in the batter, swirling the pan to help it spread.\\r\\nWhen the pancake starts pulling away a bit from the sides, and the top is no longer wet, flip it and cook shortly on the other side as well.\\r\\nTransfer to a plate. Cook the remaining batter until all used up.\\r\\nServe warm, with the filling of your choice.",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/58bkyo1593350017.jpg",
      "strTags": null,
      "strYoutube": "https://www.youtube.com/watch?v=EZS4ev2crHc",
      "strIngredient1": "Flour",
      "strIngredient2": "Eggs",
      "strIngredient3": "Milk",
      "strIngredient4": "Water",
      "strIngredient5": "Salt",
      "strIngredient6": "Sugar",
      "strIngredient7": "Butter",
      "strIngredient8": "",
      "strIngredient9": "",
      "strIngredient10": "",
      "strIngredient11": "",
      "strIngredient12": "",
      "strIngredient13": "",
      "strIngredient14": "",
      "strIngredient15": "",
      "strIngredient16": "",
      "strIngredient17": "",
      "strIngredient18": "",
      "strIngredient19": "",
      "strIngredient20": "",
      "strMeasure1": "1 cup ",
      "strMeasure2": "2",
      "strMeasure3": "1 cup ",
      "strMeasure4": "3/4 cup ",
      "strMeasure5": "Pinch",
      "strMeasure6": "1 tsp ",
      "strMeasure7": "3 tbs",
      "strMeasure8": " ",
      "strMeasure9": " ",
      "strMeasure10": " ",
      "strMeasure11": " ",
      "strMeasure12": " ",
      "strMeasure13": " ",
      "strMeasure14": " ",
      "strMeasure15": " ",
      "strMeasure16": " ",
      "strMeasure17": " ",
      "strMeasure18": " ",
      "strMeasure19": " ",
      "strMeasure20": " ",
      "strSource": "https://www.tasteatlas.com/nalesniki/recipe",
      "strImageSource": null,
      "strCreativeCommonsConfirmed": null,
      "dateModified": null
    }]
  }
  """
    
  func testCustomDecoder() throws {
    
    guard let data = testJson.data(using: .utf8) else {
      XCTFail("unparseable test data string")
      return
    }
    let detailResponse = try JSONDecoder().decode(MealDetailResponse.self, from: data)
    
    XCTAssert(detailResponse.meals.count == 1)
    XCTAssert(detailResponse.meals[0].ingredients.count == 7)
    
    let flour = detailResponse.meals[0].ingredients[0]
    XCTAssert(flour.name == "Flour")
    XCTAssert(flour.measure == "1 cup ")
    
  }

}

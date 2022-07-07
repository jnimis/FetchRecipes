//
//  HTTPUtil.swift
//  FetchRecipes
//
//  Created by John Nimis on 7/5/22.
//

import Foundation

class HTTPUtil {
  
  static var instance = HTTPUtil()
  public static func shared() -> HTTPUtil {
    return instance
  }
  
  var session = URLSession(configuration: URLSessionConfiguration.default)
  
  func fetchDesserts(completion : @escaping ([MealItem]?, String?) -> ()) -> Bool {
    
    guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
      print("CODING ERROR: can't form URL")
      return false
    }
    
    fetch(url, success: { data in
      do {
        let mealsResponse = try JSONDecoder().decode(MealListResponse.self, from: data)
        completion(mealsResponse.meals, nil)
      } catch {
        print("JSON DECODING ERROR: \(error.localizedDescription)")
        completion(nil, "DECODING ERROR")
      }
    }, failure: { errMessage in
      completion(nil, errMessage)
    })
    
    return true // this just signals that the request was sent successfully
  }
  
  
  func fetchMeal(mealId : String, completion : @escaping (MealDetail?, String?) -> ()) -> Bool {
    
    guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)") else {
      print("CODING ERROR: can't form URL")
      return false
    }
    
    fetch(url, success: { data in
      do {
        let mealsResponse = try JSONDecoder().decode(MealDetailResponse.self, from: data)
        completion(mealsResponse.meals[0], nil)
      } catch {
        print("JSON DECODING ERROR: \(error.localizedDescription)")
        completion(nil, "DECODING ERROR")
      }
    }, failure: { errMessage in
      completion(nil, errMessage)
    })
    
    return true // this just signals that the request was sent successfully
  }
  
  
  func fetch(_ url : URL, success : @escaping (Data) -> (), failure : @escaping (String) -> ()) {
    
    session.dataTask(with: url) { data, response, error in
      
      if let e = error {
        print("HTTP ERROR: \(e.localizedDescription)")
        failure("HTTP ERROR")
        return
      }
      
      guard let d = data else {
        print("NO DATA RETURNED")
        failure("NO DATA")
        return
      }
      
      success(d)
      
    }.resume()
    
  }
}

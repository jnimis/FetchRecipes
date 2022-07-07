//
//  StringUtil.swift
//  FetchRecipes
//
//  Created by John Nimis on 7/6/22.
//

import Foundation

class StringUtil {
  
  public static func isEmpty(_ value : String?) -> Bool {
    if let val = value {
      return val == "" || val == " "
    } else {
      // null string is empty
      return false
    }
  }
  
}

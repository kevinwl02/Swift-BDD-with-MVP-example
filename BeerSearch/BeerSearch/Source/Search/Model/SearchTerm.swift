//
//  SearchTerm.swift
//  BeerSearch
//
//  Created by Kevin on 6/17/17.
//  Copyright © 2017 Kevin. All rights reserved.
//

import Foundation

struct SearchTerm {
    let text: String
    
    func hasValidWordCount() -> Bool {
        let components = text.components(separatedBy: " ")
        if components.count < 4 {
            return true
        } else {
            return false
        }
    }
}

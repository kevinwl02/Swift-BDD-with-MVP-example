//
//  SearchService.swift
//  BeerSearch
//
//  Created by Kevin on 6/17/17.
//  Copyright © 2017 Kevin Wong. All rights reserved.
//

import Foundation

enum SearchError: Error {
    case genericError
}

protocol SearchService {
    
    func searchBeers(foodText: String, completion:([Beer], Error?) -> ())
    
}

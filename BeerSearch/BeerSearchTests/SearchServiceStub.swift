//
//  SearchServiceStub.swift
//  BeerSearch
//
//  Created by Kevin on 6/17/17.
//  Copyright © 2017 Kevin Wong. All rights reserved.
//

import Foundation
@testable import BeerSearch

class SearchServiceStub: SearchService {
    
    var returnBeerList: [Beer]?
    var returnBeerError: Error?
    
    func searchBeers(foodText: String, completion: ([Beer], Error?) -> ()) {
        if let returnBeerList = returnBeerList {
            completion(returnBeerList, nil)
        } else if let returnBeerError = returnBeerError {
            completion([], returnBeerError)
        }
    }
    
    func clearStub() {
        returnBeerList = nil
        returnBeerError = nil
    }
    
}

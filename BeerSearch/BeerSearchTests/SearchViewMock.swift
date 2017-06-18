//
//  SearchViewMock.swift
//  BeerSearch
//
//  Created by Kevin on 6/17/17.
//  Copyright © 2017 Kevin Wong. All rights reserved.
//

import Foundation
@testable import BeerSearch

class SearchViewMock: SearchContractView {
    
    var calledDisplayBeers: [String]?
    var calledDisplayMessage: String?
    var calledDisplayErrorMessage: String?
    
    func displayBeerImages(_ imageUrlList: [String]) {
        calledDisplayBeers = imageUrlList
    }
    
    func displayMessage(_ message: String) {
        calledDisplayMessage = message
    }
    
    func displayErrorMessage(_ message: String) {
        calledDisplayErrorMessage = message
    }
    
    func clearMock() {
        calledDisplayBeers = nil
        calledDisplayMessage = nil
        calledDisplayErrorMessage = nil
    }
}

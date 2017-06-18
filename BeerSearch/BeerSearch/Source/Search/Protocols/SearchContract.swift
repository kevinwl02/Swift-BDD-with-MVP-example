//
//  SearchContract.swift
//  BeerSearch
//
//  Created by Kevin on 6/17/17.
//  Copyright © 2017 Kevin Wong. All rights reserved.
//

import Foundation

protocol SearchContractView: class {
    
    func displayBeerImages(_ imageUrlList: [String])
    func displayMessage(_ message: String)
    func displayErrorMessage(_ message: String)
    
}

protocol SearchContractPresenter {
    
    func search(text: String)
    
}

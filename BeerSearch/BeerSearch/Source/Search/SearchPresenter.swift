//
//  SearchPresenter.swift
//  BeerSearch
//
//  Created by Kevin on 6/17/17.
//  Copyright © 2017 Kevin Wong. All rights reserved.
//

import Foundation

class SearchPresenter: SearchContractPresenter {
    
    weak var view: SearchContractView?
    let searchService: SearchService
    
    init(view: SearchContractView, searchService: SearchService) {
        self.view = view
        self.searchService = searchService
    }
    
    func search(text: String) {
        guard let view = view else { return }
        
        let searchTerm = SearchTerm(text: text)
        if searchTerm.hasValidWordCount() {
            searchService.searchBeers(foodText: text, completion: { (beerList, error) in
                if error != nil {
                    view.displayErrorMessage("There was a problem fetching your beers. Please try again later.")
                } else {
                    view.displayBeerImages(beerList.map({ beer -> String in
                        return beer.imageURL
                    }))
                }
            })
        } else {
            view.displayMessage("Don't go too crazy with the food!")
        }
    }
    
}

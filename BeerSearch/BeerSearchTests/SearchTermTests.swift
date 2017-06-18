//
//  SearchTermTests.swift
//  BeerSearch
//
//  Created by Kevin on 6/17/17.
//  Copyright © 2017 Kevin Wong. All rights reserved.
//

import Quick
import Nimble
@testable import BeerSearch

class SearchTermTests: QuickSpec {
    
    override func spec() {
        describe("search term") {
            describe("has valid word count") {
                context("given text that containts 3 or less words") {
                    it("should return true") {
                        let searchTerm = SearchTerm(text: "pizza")
                        let result = searchTerm.hasValidWordCount()
                        expect(result).to(beTruthy())
                    }
                }
                
                context("given text that containts more than 3 words") {
                    it ("should return false") {
                        let searchTerm = SearchTerm(text: "cheese hawaiian pepperoni pizza")
                        let result = searchTerm.hasValidWordCount()
                        expect(result).to(beFalsy())
                    }
                }
            }
        }
    }
    
}

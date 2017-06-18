//
//  BeerSearchTests.swift
//  BeerSearchTests
//
//  Created by Kevin on 6/15/17.
//  Copyright © 2017 Kevin Wong. All rights reserved.
//

import Quick
import Nimble
@testable import BeerSearch

class BeerSearchTests: QuickSpec {
    
    override func spec() {
        let searchService = SearchServiceStub()
        let view = SearchViewMock()
        let presenter = SearchPresenter(view: view, searchService: searchService)
        
        func validSearch() {
            presenter.search(text: "pizza")
        }
        
        func invalidSearch() {
            presenter.search(text: "very big veggie pizza")
        }
        
        describe("presenter") {
            beforeEach {
                view.clearMock()
                searchService.clearStub()
            }
            describe("search") {
                context("given search text containts 3 or less words") {
                    it("should display a list of beer images") {
                        // Given
                        searchService.returnBeerList = [
                            Beer(imageURL: "https://testurl1.com"),
                            Beer(imageURL: "https://testurl2.com")
                        ]
                        
                        // When
                        validSearch()
                        
                        // Then
                        let expectedImages = [
                            "https://testurl1.com",
                            "https://testurl2.com"
                        ]
                        expect(view.calledDisplayBeers).toEventually(equal(expectedImages))
                    }
                }
                
                context("given search text containts more than 3 words") {
                    it ("should display a message") {
                        // When
                        invalidSearch()
                        
                        // Then
                        let expectedMessage = "Don't go too crazy with the food!"
                        expect(view.calledDisplayMessage).toEventually(equal(expectedMessage))
                    }
                }
                
                context("given valid search error") {
                    it ("should display a error message") {
                        // Given
                        searchService.returnBeerError = SearchError.genericError
                        
                        // When
                        validSearch()
                        
                        // Then
                        let expectedMessage = "There was a problem fetching your beers. Please try again later."
                        expect(view.calledDisplayErrorMessage).toEventually(equal(expectedMessage))
                    }
                }
            }
            
            describe("start") {
                it("should disable the search action") {
                }
            }
            
            describe("set search text") {
                context("given only valid characters are entered") {
                    it("should enable the search action") {
                    }
                }
                
                context("given invalid characters are entered") {
                    it("should disable the search action") {
                    }
                }
            }
        }
    }
    
}

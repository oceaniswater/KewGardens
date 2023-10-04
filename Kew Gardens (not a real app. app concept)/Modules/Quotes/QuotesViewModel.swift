//
//  QuotesViewModel.swift
//  Kew Gardens (not a real app. app concept)
//
//  Created by Mark Golubev on 01/10/2023.
//

import Foundation

protocol QuotesViewProtocol: AnyObject {
    func success()
    func fetchQuotes()
}

protocol QuotesVMProtocol: AnyObject {
    init(view: QuotesViewProtocol, router: RouterProtocol)
    
    func fetchQuotes()
    
    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    
    
    
    var quotes: Quotes {get set}
    
    
}

final class QuotesViewModel: QuotesVMProtocol {
    weak var view: QuotesViewProtocol?
    var router: RouterProtocol?
    
    init(view: QuotesViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        2
    }
    
    var quotes: Quotes = []
    
    func fetchQuotes() {
        APIManager.shared.fetchData { response in
            switch response {
            case .success(let quotes):
                self.quotes = quotes
            case .failure(let error):
                switch error {
                    
                case .invalidData:
                    print("invalidData")
                case .invalidResponse:
                    print("invalidResponse")
                case .message(let message):
                    guard let message = message else { return }
                    print(message)
                }
            }
        }
    }
}

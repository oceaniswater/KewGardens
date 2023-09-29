//
//  TicketViewModel.swift
//  Kew Gardens (not a real app. app concept)
//
//  Created by Mark Golubev on 29/09/2023.
//

import Foundation

protocol TicketViewProtocol: AnyObject {
    func success()
}

protocol TicketViewModelProtocol: AnyObject {
    init(router: RouterProtocol)
    
    func numberOfSection() -> Int
    func numberOfItemsInSection(in section: Int) -> Int
    
//    func getTickets()
//    func tapToShop(shop: Shop)
//    func getFilteredShops(name: String)
//    
    var tickets: [TicketModel?] {get set}
    
    
}

class TicketViewModel: TicketViewModelProtocol {
    weak var view: TicketViewProtocol?
    var router: RouterProtocol?
    
    var tickets: [TicketModel?] = []
    
    required init(router: RouterProtocol) {
        self.router = router
        
        getTickets()
    }
    
    func numberOfSection() -> Int {
        1
    }
    
    func numberOfItemsInSection(in section: Int) -> Int {
        return self.tickets.count
    }
    
    func getTickets() {
        DispatchQueue.global(qos: .utility).async {
            self.tickets = MockData.shared.tickets
            self.view?.success()
        }
    }
    
    func getFilteredShops(name: String) {
//        self.shops = MockData.shared.shops
//        let tmpShop = self.shops.filter {$0!.name.contains(name)}
//        shops = tmpShop
        self.view?.success()
    }
    
//    func tapToShop(shop: Shop) {
//        router?.shopViewController(shop: shop)
//    }

}

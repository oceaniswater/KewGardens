//
//  MockData.swift
//  Kew Gardens (not a real app. app concept)
//
//  Created by Mark Golubev on 29/09/2023.
//

import Foundation

class MockData {
    private init () {}
    
    static var shared = MockData()
    
    var tickets: [TicketModel] = [TicketModel(info: "100310160100272757"), TicketModel(info: "100310160100272758"), TicketModel(info: "100310160100272757"), TicketModel(info: "100310160100272758"), TicketModel(info: "100310160100272757"), TicketModel(info: "100310160100272758")]
    
    var membership: String?
}

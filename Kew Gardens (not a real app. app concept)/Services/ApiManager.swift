//
//  ApiManager.swift
//  Kew Gardens (not a real app. app concept)
//
//  Created by Mark Golubev on 01/10/2023.
//

import Foundation

enum DataError: Error {
    case invalidData
    case invalidResponse
    case message(_ error: Error?)
}

class APIManager {
    static let shared = APIManager()
    private init() { }
    
    let url = URL(fileURLWithPath: "https://zenquotes.io/api/quotes")
    
// @escaping is used here, because this is a background task.
// If you write a print statemnet after the dataTask completes, i.e. after resume(), then it will execute beforehand.
// This happens because it is time consuming task and can not be implemented on main thread.
//@escaping captures data in memeory.

    func fetchData(completion: @escaping (Result<Quotes, DataError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse, (200..<300)  ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            // JSONDecoder() converts data to model of type Array
            do {
                let products = try JSONDecoder().decode(Quotes.self, from: data)
                completion(.success(products))
            }
            catch {
                completion(.failure(.message(error)))
            }
        }.resume()
    }
}

// MARK: - QuoteElement
struct Quote: Codable {
    let q, a, c, h: String
}

typealias Quotes = [Quote]

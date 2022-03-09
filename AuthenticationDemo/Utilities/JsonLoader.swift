//
//  JsonLoader.swift
//  AuthenticationDemo
//
//  Created by Siddharth Kumar on 10/03/22.
//

import Foundation

struct JSONLoader {
    private let bundle: Bundle
    private let jsonDecoder = JSONDecoder()
    
    init(_ bundle: Bundle = Bundle.main) {
        self.bundle = bundle
    }
    
    func loadJSON<T: Decodable>(_ fileName: String) -> T?  {
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            return nil
        }
        guard let data = try? Data(contentsOf: url, options: .alwaysMapped) else {
            return nil
        }
        return try? jsonDecoder.decode(T.self, from: data)
    }
}

//
//  NewsHelper.swift
//  MoEngageTest
//
//  Created by Rakshitha on 17/03/22.
//

import Foundation

class NewsHelper {
    
    static func fetchNewsData() -> Data? {
        if let path = Bundle.main.path(forResource: "newsResponse", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                sleep(10)
                return data
            } catch {
                print("Exception while fetching the data")
            }
        }
        return nil
    }
}

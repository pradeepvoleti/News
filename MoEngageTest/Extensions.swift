//
//  Extensions.swift
//  MoEngageTest
//
//  Created by Ram Voleti on 28/04/22.
//

import Foundation

extension String {
    
    func toDate() -> Date?  {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let date = formatter.date(from: self)
        return date
    }
}

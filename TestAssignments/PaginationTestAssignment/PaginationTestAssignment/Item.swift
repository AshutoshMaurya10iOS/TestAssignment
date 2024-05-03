//
//  Item.swift
//  PaginationTestAssignment
//
//  Created by Ashutosh Maurya on 02/05/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

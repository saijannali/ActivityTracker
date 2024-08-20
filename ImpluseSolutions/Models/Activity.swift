//
//  Acitivity.swift
//  ImpluseSolutions
//
//  Created by Sai Jannali on 8/19/24.
//

import Foundation
import SwiftData

@Model
class Activity {
    var id: String
    var type: ActivityType
    var duration: Int 
    var quantity: Double
    var date: Date
    
    init(id: String = UUID().uuidString, type: ActivityType, duration: Int, quantity: Double, date: Date = Date.now) {
        self.id = id
        self.type = type
        self.duration = duration
        self.quantity = quantity
        self.date = date
    }
}

//
//  ActivityLogginViewModel.swift
//  ImpluseSolutions
//
//  Created by Sai Jannali on 8/19/24.
//

import Foundation

enum ActivityType: Int, Codable, CaseIterable {
    case exercise = 0
    case meditation = 1
    case hydration = 2
    
    var displayName: String {
        switch self {
        case .exercise: 
            return "Exercise"
        case .meditation: 
            return "Meditation"
        case .hydration: 
            return "Hydration"
        }
    }
}


class ActivityLoggingViewModel: ObservableObject {
    @Published var selectedActivity: ActivityType = .exercise
    @Published var hours: Int = 0
    @Published var minutes: Int = 0
    @Published var quantity: String = ""
    @Published var showAlert: Bool = false
    @Published var alertMsg: String = ""
    
    private let dataSource: SwiftDataService
    
    init(dataSource: SwiftDataService) {
        self.dataSource = dataSource
    }
    
    func saveActivity() {
        if selectedActivity == .hydration {
            guard let quantityValue = Double(quantity), quantityValue > 0 else {
                self.alertMsg = "Invalid input"
                self.showAlert = true
                return
            }
        }
        let totalDuration = (hours * 60) + minutes
        let quantityValue = Double(quantity) ?? 0.0
        let activity = Activity(type: selectedActivity, duration: totalDuration, quantity: quantityValue, date: Date())
        dataSource.addActivity(activity)
        dataSource.fetchActivities()
        self.alertMsg = "Activity Added!"
        self.showAlert = true
    }
    
}

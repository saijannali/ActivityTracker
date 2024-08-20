//
//  ActivitySummaryViewModel.swift
//  ImpluseSolutions
//
//  Created by Sai Jannali on 8/19/24.
//

import Foundation

class ActivitySummaryViewModel: ObservableObject {
    @Published var activities: [Activity] = []
    
    private let dataSource: SwiftDataService
    
    init(dataSource: SwiftDataService) {
        self.dataSource = dataSource
        fetchActivities()
    }
    
    func fetchActivities() {
        activities = dataSource.fetchActivities()
    }
}

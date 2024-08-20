//
//  SwiftDataService.swift
//  ImpluseSolutions
//
//  Created by Sai Jannali on 8/19/24.
//
import SwiftData
import Foundation

class SwiftDataService {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = SwiftDataService()
    
    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: Activity.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        self.modelContext = modelContainer.mainContext
    }
    
    func fetchActivities() -> [Activity] {
        do {
            var activites = try modelContext.fetch(FetchDescriptor<Activity>())
            print("activiteis found \(activites.count)")
            return activites
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func addActivity(_ activity: Activity) {
        modelContext.insert(activity)
        do {
            try modelContext.save()
            print("Activity Saved")
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

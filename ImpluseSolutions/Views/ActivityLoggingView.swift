//
//  ActivityLoggingView.swift
//  ImpluseSolutions
//
//  Created by Sai Jannali on 8/19/24.
//

import SwiftUI

struct ActivityLoggingView: View {
    @StateObject private var viewModel = ActivityLoggingViewModel(dataSource: SwiftDataService.shared)
    
    init() {
        let appearance = UISegmentedControl.appearance()
        appearance.selectedSegmentTintColor = UIColor(
            red: 0.5, green: 0.0, blue: 0.0, alpha: 1.0) // Dark red
        appearance.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        appearance.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
    }
    
    var body: some View {
        ZStack {
            GradientBackgroundView()
            VStack {
                HStack {
                    Text("\(viewModel.selectedActivity)")
                        .headingTextStyle()
                    Spacer()
                }
                .padding()
                
                Spacer()
                
                VStack {
                    
                    Picker("Activity", selection: $viewModel.selectedActivity) {
                        ForEach(ActivityType.allCases, id: \.self) { activityType in
                            Text(activityType.displayName).tag(activityType)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    
                    
                    if viewModel.selectedActivity == .hydration {
                        TextField("Quantity (liters)", text: $viewModel.quantity)
                            .textFieldStyle(TransparentTextFieldStyle())
                    } else {
                        GeometryReader { geometry in
                            HStack(spacing: 0) {
                                Picker("Hours", selection: $viewModel.hours) {
                                    ForEach(0..<24) { hour in
                                        Text("\(hour) h").tag(hour)
                                    }
                                }
                                .pickerStyle(WheelPickerStyle())
                                .frame(width: geometry.size.width / 2, height: 150)
                                .clipped()
                                
                                Picker("Minutes", selection: $viewModel.minutes) {
                                    ForEach(0..<60) { minute in
                                        Text("\(minute) min").tag(minute)
                                    }
                                }
                                .pickerStyle(WheelPickerStyle())
                                .frame(width: geometry.size.width / 2, height: 150)
                                .clipped()
                            }
                        }
                        .frame(height: 150)
                    }
                    
                    Spacer()
                    
                }
            }
            .padding()
            
            
            Button("Save", action: viewModel.saveActivity)
                .customButtonStyle()
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(
                        title: Text("Alert"),
                        message: Text(viewModel.alertMsg),
                        dismissButton: .default(Text("OK"))
                    )
                }
            
            
            .navigationTitle("Log Activity")
            
        }
    }
}

#Preview {
    ActivityLoggingView()
}



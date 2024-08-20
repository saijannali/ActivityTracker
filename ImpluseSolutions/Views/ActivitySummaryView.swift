//
//  ActivitySummaryView.swift
//  ImpluseSolutions
//
//  Created by Sai Jannali on 8/19/24.
//

import SwiftUI

struct ActivitySummaryView: View {
    @StateObject private var viewModel = ActivitySummaryViewModel(dataSource: SwiftDataService.shared)
    
    var body: some View {
        ZStack {
            GradientBackgroundView()
            VStack {
                HStack {
                    Text("Activity Summary")
                        .headingTextStyle()
                    Spacer()
                }
                .padding()
                
                List(viewModel.activities) { activity in
                    VStack(alignment: .leading) {
                        Text(activity.type.displayName)
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("Duration: \(activity.duration) minutes")
                            .foregroundColor(.white)
                        Text("Quantity: \(activity.quantity)")
                            .foregroundColor(.white)
                        Text("Date: \(activity.date, formatter: dateFormatter)")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .listRowBackground(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(red: 0.5, green: 0, blue: 0), Color(red: 1, green: 0.5, blue: 0.5)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .cornerRadius(10)
                        .padding(.bottom, 5)
                    )
                }
                .listStyle(PlainListStyle())
                .scrollContentBackground(.hidden) 
                .listRowSeparator(.hidden)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Activity Summary")
        .onAppear {
            viewModel.fetchActivities()
        }
    }
                        private var dateFormatter: DateFormatter {
                            let formatter = DateFormatter()
                            formatter.dateStyle = .medium
                            formatter.timeStyle = .short
                            return formatter
                        }
                        }
                        
                        #Preview {
                            ActivitySummaryView()
                        }

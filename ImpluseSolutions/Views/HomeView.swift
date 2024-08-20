//
//  HomeView.swift
//  ImpluseSolutions
//
//  Created by Sai Jannali on 8/19/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                GradientBackgroundView()
                
                VStack {
                    HStack {
                        Text("Hello!")
                            .headingTextStyle()
                        Spacer()
                    }
                    .padding()
                    
                    Spacer()
                    
                    VStack {
                        Text("Today is \(Date.now.formatted(date: .abbreviated, time: .omitted))")
                            .normalTextStyle()
                            .padding()
                        Text("Click on the button below to Log a Activity!")
                            .normalTextStyle()
                    }
                    
                    Spacer()
                    
                    Image(systemName: "arrow.down")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(.bottom, 40)
                    
                    
                    NavigationLink("Log Activity", destination: ActivityLoggingView())
                        .customButtonStyle()
                        .padding(.bottom, 20)
                }
                .padding()
            }
        }
    }
}

#Preview {
    HomeView()
}

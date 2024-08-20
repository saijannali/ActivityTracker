//
//  Utils.swift
//  ImpluseSolutions
//
//  Created by Sai Jannali on 8/19/24.
//

import Foundation
import SwiftUI

import SwiftUI

struct GradientBackgroundView: View{
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.red, Color.orange, Color.yellow]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(
            LinearGradient(
                colors: colors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
        )
        .mask(self)
    }
}

struct HeadingTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 34, weight: .black, design: .serif))
            .foregroundColor(.black)
            .shadow(radius: 5)
    }
}
extension View {
    func headingTextStyle() -> some View {
        self.modifier(HeadingTextStyle())
    }
}

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18, weight: .bold, design: .default))
            .foregroundColor(.black)
            .padding()
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color(red: 0.5, green: 0, blue: 0), Color(red: 1, green: 0.5, blue: 0.5)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

extension View {
    func customButtonStyle() -> some View {
        self.modifier(ButtonStyle())
    }
}

struct NormalTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18, weight: .regular, design: .default))
            .foregroundColor(.black)
            .shadow(radius: 2)
    }
}

extension View {
    func normalTextStyle() -> some View {
        self.modifier(NormalTextStyle())
    }
}

struct TransparentTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(Color.clear)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray, lineWidth: 1)
            )
    }
}

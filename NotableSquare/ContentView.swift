//
//  ContentView.swift
//  NotableSquare
//
//  Created by Сергей Прокопьев on 11.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State var location = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
    
    var body: some View {
        ZStack {
            Group {
                VStack(spacing: 0) {
                    Rectangle()
                        .foregroundColor(.white)
                    Rectangle()
                        .foregroundColor(.pink)
                    Rectangle()
                        .foregroundColor(.yellow)
                    Rectangle()
                        .foregroundColor(.black)
                }
                .padding(0)
                .ignoresSafeArea()
            }
            RoundedRectangle(cornerRadius: 20.0)
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
                .blendMode(.difference)
                .overlay(.blendMode(.hue))
                .overlay(Color.white.blendMode(.overlay))
                .overlay(Color.black.blendMode(.overlay))
                .cornerRadius(20)
                .position(location)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            location = value.location
                        })
                )
        }
    }
}

#Preview {
    ContentView()
}

// MARK: - Extensions

extension View {
    func magenta() -> some View {
        return layerEffect(
            ShaderLibrary.default.contrastSubtract(.boundingRect),
            maxSampleOffset: .zero
        )
    }
}

extension UIColor {
    func contrastingColor() -> UIColor {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        let luminance = (0.299 * red + 0.587 * green + 0.114 * blue)
        return luminance > 0.5 ? .black : .white
    }
}

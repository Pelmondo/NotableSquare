//
//  WithShaders.swift
//  NotableSquare
//
//  Created by Сергей Прокопьев on 13.10.2023.
//

import SwiftUI

struct ShaderView: View {
    @State var location = CGPoint(
        x: UIScreen.main.bounds.midX,
        y: UIScreen.main.bounds.midY
    )

    var body: some View {
        ZStack {
            let background = VStack(spacing: 0) {
                Color(.white)
                Color(.pink)
                Color(.yellow)
                Color(.gray)
            }
            background
            ZStack {
                Rectangle()
                    .ignoresSafeArea()
                    .overlay {
                        background
                            .contrast()
                    }
                    .frame(
                        width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height
                    )
                    .position(CGPoint(
                        x: UIScreen.main.bounds.midX - location.x + 50,
                        y: UIScreen.main.bounds.midY - location.y + 50
                    ))
                    .frame(width: 100, height: 100)
                    .clipped()
            }
            .position(location)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        location = value.location
                    })
            )
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ShaderView()
}

extension View {
    func contrast() -> some View {
        let function = ShaderFunction(library: .default, name: "contrast")
        let shader = Shader(function: function, arguments: [])
        return colorEffect(shader)
    }
}

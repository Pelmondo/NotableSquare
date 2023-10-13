//
//  Shaders.metal
//  NotableSquare
//
//  Created by Сергей Прокопьев on 11.10.2023.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

[[stitchable]] half4 contrast(float2 position, half4 pColor) {
    if (pColor.r * 0.299 + pColor.g * 0.587 + pColor.b * 0.114 > (186.0 / 255.0)) {
        return half4(0, 0, 0, 1);
    } else {
        return  half4(1, 1, 1, 1);
    }
}

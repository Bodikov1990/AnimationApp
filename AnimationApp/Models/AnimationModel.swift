//
//  AnimationModel.swift
//  AnimationApp
//
//  Created by Kuat Bodikov on 12.01.2022.
//

import Spring

struct Animation {
    var randomForce: Double
    var randomDuration: Double

    static func getAnimation() -> Animation {
        Animation(randomForce: Double.random(in: 0.30...1.5), randomDuration: Double.random(in: 0.30...1.5))
    }
}

enum CurrentAnimation: String {
    case slideLeft = "slideLeft"
    case squeezeLeft = "squeezeLeft"
    case zoomOut = "zoomOut"
    case fall = "fall"
    case shake = "shake"
    case pop = "pop"
    case flipX = "flipX"
}

enum CurrentCurve: String {
    case easeInOut = "easeInOut"
    case easeInOutQuad = "easeInOutQuad"
    case easeOutQuart = "easeOutQuart"
    case easeInOutExpo = "easeInOutExpo"
    case easeInSine = "easeInSine"
    case easeInOutBack = "easeInOutBack"
    case easeInCubic = "easeInCubic"
}



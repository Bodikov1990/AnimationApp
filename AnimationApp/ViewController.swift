//
//  ViewController.swift
//  AnimationApp
//
//  Created by Kuat Bodikov on 11.01.2022.
//

import Spring

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


class ViewController: UIViewController {

    
    @IBOutlet weak var mainAnimationView: SpringView!
    
    @IBOutlet weak var presetLabel: UILabel!
    @IBOutlet weak var curveLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var runButton: SpringButton!
    
    private var currenAnimation = CurrentAnimation.fall
    private var currentCurve = CurrentCurve.easeInOutExpo
    private var randomForce = Double.random(in: 0.30...1.0)
    private var randomDuration = Double.random(in: 0.50...1.5)
    
    @IBAction func animationButton(_ sender: SpringButton) {
        
        sender.animation = "squeeze"
        sender.animate()
        
        switch currenAnimation {
            
        case .slideLeft:
            setAnimations(for: "slideLeft", for: "easeInOut")
            getCurrentStatusAnimtaions()
            
            currenAnimation = .squeezeLeft
            currentCurve = .easeInOutQuad
            
            runButton.setTitle("Run squeezeLeft", for: .normal)
        case .squeezeLeft:
            setAnimations(for: "squeezeLeft", for: "easeInOutQuad")
            getCurrentStatusAnimtaions()
            
            currenAnimation = .zoomOut
            currentCurve = .easeOutQuart
            
            runButton.setTitle("Run zoomOut", for: .normal)
        case .zoomOut:
            setAnimations(for: "zoomOut", for: "easeOutQuart")
            getCurrentStatusAnimtaions()
            
            currenAnimation = .fall
            currentCurve = .easeInOutExpo
            
            runButton.setTitle("Run fall", for: .normal)
        case .fall:
            setAnimations(for: "fall", for: "easeInOutExpo")
            getCurrentStatusAnimtaions()
            
            currenAnimation = .shake
            currentCurve = .easeInSine
            
            runButton.setTitle("Run shake", for: .normal)
        case .shake:
            setAnimations(for: "shake", for: "easeInSine")
            getCurrentStatusAnimtaions()
            
            currenAnimation = .pop
            currentCurve = .easeInOutBack
            
            runButton.setTitle("Run pop", for: .normal)
        case .pop:
            setAnimations(for: "pop", for: "easeInOutBack")
            getCurrentStatusAnimtaions()
            
            currenAnimation = .flipX
            currentCurve = .easeInCubic
            
            runButton.setTitle("Run flipX", for: .normal)
        case .flipX:
            setAnimations(for: "flipX", for: "easeInCubic")
            getCurrentStatusAnimtaions()
            
            currenAnimation = .slideLeft
            currentCurve = .easeInOut
            
            runButton.setTitle("Run slideLeft", for: .normal)
        }
    }
    
    private func setAnimations(for animation: String, for curve: String) {
        mainAnimationView.animation = animation
        mainAnimationView.curve = curve
        mainAnimationView.force = randomForce
        mainAnimationView.duration = randomDuration
        mainAnimationView.animate()
    }
    
    private func getCurrentStatusAnimtaions() {
        presetLabel.text = String("Preset: \(currenAnimation)")
        curveLabel.text = String("Curve: \(currentCurve)")
        forceLabel.text = String(format:"Force: %.2f", randomForce)
        durationLabel.text = String(format:"Duration: %.2f", randomDuration)
    }
}


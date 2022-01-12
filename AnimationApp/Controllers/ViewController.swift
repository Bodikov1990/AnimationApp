//
//  ViewController.swift
//  AnimationApp
//
//  Created by Kuat Bodikov on 11.01.2022.
//

import Spring

class ViewController: UIViewController {

    @IBOutlet weak var mainAnimationView: SpringView!
    
    @IBOutlet weak var presetLabel: UILabel!
    @IBOutlet weak var curveLabel: UILabel!
    @IBOutlet weak var forceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var runButton: SpringButton!
    
    private var currenAnimation = CurrentAnimation.fall
    private var currentCurve = CurrentCurve.easeInOutExpo
    
    var random = Animation.getAnimation()
    
    private var randomForce: Double {
        random.randomForce
    }
    private var randomDuration: Double {
        random.randomDuration
    }
    private var randomValues = Animation.getAnimation()
    
    @IBAction func animationButton(_ sender: SpringButton) {
        
        setRandomValues()
        sender.animation = "squeeze"
        sender.animate()
        
        switch currenAnimation {
            
        case .slideLeft:
            setAnimationsEnum(for: .slideLeft, for: .easeInOut)
            getCurrentStatusAnimtaions()
            
            currenAnimation = .squeezeLeft
            currentCurve = .easeInOutQuad
    
        case .squeezeLeft:
            setAnimationsEnum(for: .squeezeLeft, for: .easeInOutQuad)
            getCurrentStatusAnimtaions()
            
            currenAnimation = .zoomOut
            currentCurve = .easeOutQuart
        
        case .zoomOut:
            setAnimationsEnum(for: .zoomOut, for: .easeOutQuart)
            getCurrentStatusAnimtaions()
            
            currenAnimation = .fall
            currentCurve = .easeInOutExpo
            
        case .fall:
            setAnimationsEnum(for: .fall, for: .easeInOutExpo)
            getCurrentStatusAnimtaions()
            
            currenAnimation = .shake
            currentCurve = .easeInSine
            
        case .shake:
            setAnimationsEnum(for: .shake, for: .easeInSine)
            getCurrentStatusAnimtaions()
            
            currenAnimation = .pop
            currentCurve = .easeInOutBack
            
        case .pop:
            setAnimationsEnum(for: .pop, for: .easeInOutBack)
            getCurrentStatusAnimtaions()
            
            currenAnimation = .flipX
            currentCurve = .easeInCubic
            
        case .flipX:
            setAnimationsEnum(for: .flipX, for: .easeInCubic)
            getCurrentStatusAnimtaions()
            
            currenAnimation = .slideLeft
            currentCurve = .easeInOut
            

        }
        runButton.setTitle("Run \(currenAnimation)", for: .normal)
    }
    
    
    
    private func setAnimationsEnum(for amiation: CurrentAnimation, for curve: CurrentCurve) {
        mainAnimationView.animation = amiation.rawValue
        mainAnimationView.curve = curve.rawValue
        mainAnimationView.animate()
    }
    
    private func setRandomValues() {
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


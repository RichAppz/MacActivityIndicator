//
//  MacActivityIndicator.swift
//  RichAppz
//
//  Copyright © 2016-2017 RichAppz Limited. All rights reserved.
//  richappz.com - (rich@richappz.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Cocoa
import QuartzCore

class MacActivityIndicator: NSView {

    //================================================================================
    // MARK: Variables
    //================================================================================

    enum DirectionType {
        case clockwise, anticlockwise
    }

    lazy fileprivate var animationLayer: CALayer = { return CALayer() }()

    fileprivate var rotationValue: NSNumber {
        get {
            return NSNumber(value: (direction == .clockwise ? -3.14 : 3.14) * 2.0 as Float)
        }
    }

    fileprivate var isAnimating = false
    fileprivate let rotation = CABasicAnimation(keyPath:"transform.rotation.z")

    //================================================================================
    // MARK: Public Parameters
    //================================================================================

    public var hidesWhenStopped: Bool = true

    public var image: NSImage? {
        didSet { animationLayer.contents = image }
    }

    public var speed: CFTimeInterval = 1.0 {
        didSet { rotation.duration = speed }
    }

    public var direction: DirectionType = .clockwise {
        didSet { rotation.toValue = rotationValue }
    }

    //================================================================================
    // MARK: Initialization
    //================================================================================

    init(image: NSImage? = nil) {
        super.init(frame: .zero)

        addRotation(forLayer: animationLayer)
        isHidden = true
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillDraw() {
        super.viewWillDraw()
        animationLayer.contentsGravity = kCAGravityResizeAspect
        animationLayer.frame = CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height)
        animationLayer.contents = image
        animationLayer.masksToBounds = true

        wantsLayer = true
        layer?.addSublayer(animationLayer)

        addRotation(forLayer: animationLayer)
    }

    //================================================================================
    // MARK: Helpers
    //================================================================================

    fileprivate func addRotation(forLayer layer: CALayer) {
        rotation.duration = speed
        rotation.isRemovedOnCompletion = false
        rotation.repeatCount = HUGE
        rotation.fillMode = kCAFillModeForwards
        rotation.fromValue = NSNumber(value: 0.0 as Float)
        rotation.toValue = rotationValue

        layer.add(rotation, forKey: "rotate")
    }

    fileprivate func pause(_ layer: CALayer) {
        let pausedTime = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0.0
        layer.timeOffset = pausedTime

        isAnimating = false
    }

    fileprivate func resume(_ layer: CALayer) {
        let pausedTime: CFTimeInterval = layer.timeOffset

        layer.speed = 1.0
        layer.timeOffset = 0.0
        layer.beginTime = 0.0
        layer.beginTime = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime

        isAnimating = true
    }

    func startAnimating () {
        if isAnimating { return }
        if hidesWhenStopped { isHidden = false }
        resume(animationLayer)
    }

    func stopAnimating () {
        if hidesWhenStopped { isHidden = true }
        pause(animationLayer)
    }
    
}

//
//  SAKImageView.swift
//  ArtPortfolio
//
//  Created by Susan Kern on 5/15/18.
//  Copyright © 2018 SKern. All rights reserved.
//

import UIKit

class SAKImageView: UIImageView {
    
    // MARK: Public variables
    
    var imageNamesArray: Array<String>? {
        get {
            return _imageNamesArray
        }
        set {
            _imageNamesArray = newValue
            if let _imageNamesArray = _imageNamesArray,
                _imageNamesArray.count > 0 {
                image = UIImage(named: _imageNamesArray[0])
            }
        }
    }
    
    var imageTime = 2.5
    
    
    // MARK: IBInspectable variables
   
    @IBInspectable var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    
    // MARK: Private variables
    
    private var _imageNamesArray: Array<String>? 
    private var _imageIndex = 0
    private var _timer: Timer!
    
    
    // MARK: Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)        
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
        commonInit()
    }
    
    deinit {
        _timer.invalidate()
    }
    
    func commonInit() {
        setTimer()
        
        // Capture when user taps image
        isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tappedImage))
        addGestureRecognizer(tapRecognizer)
    }
    
    
    // MARK: Private methods
    
    private func setTimer() {
        _timer = Timer.scheduledTimer(timeInterval: imageTime, target: self, selector: #selector(transitionImage), userInfo: nil, repeats: true)
    }
        
    @objc private func transitionImage() {
        guard let _imageNamesArray = _imageNamesArray else { return }
        
        _imageIndex = _imageIndex + 1 
        _imageIndex = _imageIndex == _imageNamesArray.count ? 0 : _imageIndex
        
        let toImage = UIImage(named: _imageNamesArray[_imageIndex])
        UIView.transition(with: self,
                          duration: 0.5,
                          options: .transitionFlipFromRight,
                          animations: { self.image = toImage },
                          completion: nil)
    }
    
    @objc private func tappedImage() {
        _timer.invalidate()
        self.transitionImage()
        setTimer()
    }
}

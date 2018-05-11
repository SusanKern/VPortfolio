//
//  ArtworkFullScreenViewController.swift
//  ArtPortfolio
//
//  Created by Susan Kern on 5/11/18.
//  Copyright © 2018 SKern. All rights reserved.
//

import UIKit

class ArtworkFullScreenViewController: UIViewController {

    // MARK: Public variables

    var imageName: String?
    
    
    // MARK: IBOutlets

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    // MARK: ViewController life-cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.minimumZoomScale = 0.7
        scrollView.maximumZoomScale = 10.0
        scrollView.contentSize = self.imageView.frame.size;
        scrollView.delegate = self;  
        
        // Capture when user taps anywhere on screen
        let tapRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tappedView))
        view.addGestureRecognizer(tapRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let imageName = self.imageName {
            imageView.image = UIImage(named: imageName)
            
            log.info("Present Artwork Full screen for \(imageName)")
        }
    }
    
    
    // MARK: Navigation

    @objc func tappedView() {
        dismiss(animated: true, completion: nil)
    }
}


// MARK: UIScrollViewDelegate

extension ArtworkFullScreenViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}

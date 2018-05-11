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

        self.scrollView.minimumZoomScale = 0.7
        self.scrollView.maximumZoomScale = 10.0
        self.scrollView.contentSize = self.imageView.frame.size;
        self.scrollView.delegate = self;  
        
        // Capture when user taps anywhere on screen
        let tapRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tappedView))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let imageName = self.imageName {
            self.imageView.image = UIImage(named: imageName)
            
            log.info("Present Artwork Full screen for \(imageName)")
        }
    }
    
    
    // MARK: Navigation

    @objc func tappedView() {
        self.dismiss(animated: true, completion: nil)
    }
}


// MARK: UIScrollViewDelegate

extension ArtworkFullScreenViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}

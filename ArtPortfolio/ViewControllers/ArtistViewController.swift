//
//  ArtistViewController.swift
//  ArtPortfolio
//
//  Created by Susan Kern on 4/30/18.
//  Copyright © 2018 SKern. All rights reserved.
//

import UIKit

class ArtistViewController: UIViewController {
    
    // MARK: Private variables
    
    private var workaroundScrollBug = true
    private var imageIndex = 0
    private let artist =  DataController.sharedInstance.artist


    // MARK: IBOutlets
    
    @IBOutlet weak var artistImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    
    
    // MARK: ViewController life-cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        artistImageView.layer.borderColor = UIColor.app_whiteColor().cgColor
        artistImageView.layer.borderWidth = 2

        guard let firstName = artist.firstName,
            let lastName = artist.lastName else { return }
        artistImageView.image = UIImage(named: artist.imageName[0])
        nameLabel.text = "\(firstName) \(lastName)"
        emailLabel.text = artist.email
        
        if let bioText = artist.bio {
            bioTextView.text = bioText
        } else {
            bioTextView.text = ""
        }

        // Capture when user taps anywhere on screen
        let tapRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tappedView))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bioTextView.textContainerInset = UIEdgeInsets(top: 6, left: 10, bottom: 6, right: 10);

        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        log.info("Present Info screen")

        bioTextView.flashScrollIndicators()
    }
    
    
    // MARK: Presentation
    
    override func viewDidLayoutSubviews() {
        if self.workaroundScrollBug {
            // UITextView will not start at top, and other suggested workarounds
            //   cause flashing once view appears. 
            DispatchQueue.main.async {
                self.bioTextView.setContentOffset(CGPoint.zero, animated: false)
            }
            self.workaroundScrollBug = false
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc func tappedView() {
        imageIndex = imageIndex + 1 
        imageIndex = imageIndex == artist.imageName.count ? 0 : imageIndex
        
        let toImage = UIImage(named:artist.imageName[imageIndex])
        UIView.transition(with: self.artistImageView,
                          duration: 0.5,
                          options: .transitionFlipFromRight,
                          animations: { self.artistImageView.image = toImage },
                          completion: nil)
    }

    
    // MARK: IBActions
    
    @IBAction func tappedDoneButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

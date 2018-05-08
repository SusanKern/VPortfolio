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
    

    // MARK: IBOutlets
    
    @IBOutlet weak var artistImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    
    
    // MARK: ViewController life-cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let artist =  DataController.sharedInstance.artist
        guard let firstName = artist.firstName,
            let lastName = artist.lastName else { return }
        if let imageName = artist.imageName {
            artistImageView.image = UIImage(named: imageName)
        }
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
        
        bioTextView.flashScrollIndicators()
        
        log.info("Present Info screen")
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
        log.info("tapped image")
    }

    
    // MARK: IBActions
    
    @IBAction func tappedDoneButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

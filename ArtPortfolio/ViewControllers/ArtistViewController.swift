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
    
    private var _workaroundScrollBug = true
    private let _artist =  DataController.sharedInstance.artist


    // MARK: IBOutlets
    
    @IBOutlet weak var artistImageView: SAKImageView!
    @IBOutlet weak var artistNavigationBar: UINavigationBar!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    // MARK: ViewController life-cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        artistNavigationBar.shadowImage = UIImage.imageWithColor(color: .white)

        guard let firstName = _artist.firstName,
            let lastName = _artist.lastName else { return }
        nameLabel.text = "\(firstName) \(lastName)"
        emailLabel.text = _artist.email
        
        if let bioText = _artist.bio {
            bioTextView.text = bioText
        } else {
            bioTextView.text = ""
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        log.info("Present Artist screen")

        bioTextView.textContainerInset = UIEdgeInsets(top: 6, left: 10, bottom: 6, right: 10);
        
        artistImageView.borderColor = UIColor.white
        artistImageView.borderWidth = 2
        artistImageView.imageNamesArray = _artist.imageNames
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        bioTextView.flashScrollIndicators()
        
    }
    
    
    // MARK: Presentation
    
    override func viewDidLayoutSubviews() {
        if _workaroundScrollBug {
            // UITextView will not start at top, and other suggested workarounds
            //   cause flashing once view appears. 
            DispatchQueue.main.async {
                self.bioTextView.setContentOffset(CGPoint.zero, animated: false)
            }
            _workaroundScrollBug = false
        }
    }

    
    // MARK: IBActions
    
    @IBAction func tappedDoneButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

//
//  ArtworkDetailViewController.swift
//  ArtPortfolio
//
//  Created by Susan Kern on 4/30/18.
//  Copyright © 2018 SKern. All rights reserved.
//

import UIKit

class ArtworkDetailViewController: UIViewController {
    
    // MARK: Public variables
    
    var heading: String?
    var text: String?


    // MARK: IBOutlets
    
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    
    // MARK: ViewController life-cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Capture when user taps anywhere on screen
        let tapRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tappedView))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let heading = heading {
            headingLabel.text = heading
            
            log.info("Present Artwork Detail screen for \(heading)")
        }
        if let text = text {
            textLabel.text = text
        }
    }
    
    
    // MARK: Navigation
    
    @objc func tappedView() {
        self.dismiss(animated: true, completion: nil)
    }

    
    // MARK: IBActions
    
    @IBAction func tappedDoneButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

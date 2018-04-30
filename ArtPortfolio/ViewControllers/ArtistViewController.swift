//
//  ArtistViewController.swift
//  ArtPortfolio
//
//  Created by Susan Kern on 4/30/18.
//  Copyright © 2018 SKern. All rights reserved.
//

import UIKit

class ArtistViewController: UIViewController {

    // MARK: IBOutlets
    
    @IBOutlet weak var artistImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
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
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    
    // MARK: IBActions
    
    @IBAction func tappedDoneButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

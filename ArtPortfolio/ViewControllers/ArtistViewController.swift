//
//  ArtistViewController.swift
//  ArtPortfolio
//
//  Created by Susan Kern on 4/30/18.
//  Copyright © 2018 SKern. All rights reserved.
//

import UIKit
import MessageUI

class ArtistViewController: UIViewController {
    
    // MARK: Private variables
    
    private var _workaroundScrollBug = true
    private let _artist =  DataController.sharedInstance.artist


    // MARK: IBOutlets
    
    @IBOutlet weak var artistImageView: SAKImageView!
    @IBOutlet weak var artistNavigationBar: UINavigationBar!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var instagramButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    
    
    // MARK: ViewController life-cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        artistNavigationBar.shadowImage = UIImage.imageWithColor(color: .white)
        
        if let bioText = _artist.bio {
            bioTextView.text = bioText
        } else {
            bioTextView.text = ""
        }
        
        emailButton.isHidden = !MFMailComposeViewController.canSendMail()
        instagramButton.isHidden = (_artist.instagramUsername == nil)
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
    
    @IBAction func tappedEmailButton(_ sender: Any) {
        guard let mailComposeViewController = configuredMailComposeViewController(),
            MFMailComposeViewController.canSendMail() else { return }
        
        self.present(mailComposeViewController, animated: true, completion: nil)
    }
    
    @IBAction func tappedInstagramButton(_ sender: Any) {
        guard let username = _artist.instagramUsername else { return }
        
        SAKSocialLinks().openInstagram(username: username)
    }
    
    @IBAction func tappedDoneButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: Private functions
    
    private func configuredMailComposeViewController() -> MFMailComposeViewController? {
        guard let emailAddress = _artist.email else { return nil }

        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self         
        mailComposerVC.setToRecipients([emailAddress])
        mailComposerVC.setSubject("Contact from V Portfolio app")
        
        return mailComposerVC
    }
}


// MARK: MFMailComposeViewControllerDelegate

extension ArtistViewController : MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

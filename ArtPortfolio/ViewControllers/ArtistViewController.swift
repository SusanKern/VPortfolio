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
    private var timer: Timer!


    // MARK: IBOutlets
    
    @IBOutlet weak var artistImageView: UIImageView!
    @IBOutlet weak var artistNavigationBar: UINavigationBar!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    // MARK: ViewController life-cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        artistImageView.layer.borderColor = UIColor.app_whiteColor().cgColor
        artistImageView.layer.borderWidth = 2
        artistNavigationBar.shadowImage = UIImage.imageWithColor(color: .white)

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
        view.addGestureRecognizer(tapRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.bioTextView.textContainerInset = UIEdgeInsets(top: 6, left: 10, bottom: 6, right: 10);

        log.info("Present Artist screen")

        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        bioTextView.flashScrollIndicators()
        
        setTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        timer.invalidate()
    }
    
    
    // MARK: Presentation
    
    override func viewDidLayoutSubviews() {
        if workaroundScrollBug {
            // UITextView will not start at top, and other suggested workarounds
            //   cause flashing once view appears. 
            DispatchQueue.main.async {
                self.bioTextView.setContentOffset(CGPoint.zero, animated: false)
            }
            workaroundScrollBug = false
        }
    }
    
    @objc func tappedView() {
        timer.invalidate()
        self.transitionImage()
        setTimer()
    }
    
    
    // MARK: Private functions
    
    @objc private func transitionImage() {
        imageIndex = imageIndex + 1 
        imageIndex = imageIndex == artist.imageName.count ? 0 : imageIndex
        
        let toImage = UIImage(named:artist.imageName[imageIndex])
        UIView.transition(with: artistImageView,
                          duration: 0.5,
                          options: .transitionFlipFromRight,
                          animations: { self.artistImageView.image = toImage },
                          completion: nil)
    }
    
    private func setTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(transitionImage), userInfo: nil, repeats: true)
    }

    
    // MARK: IBActions
    
    @IBAction func tappedDoneButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

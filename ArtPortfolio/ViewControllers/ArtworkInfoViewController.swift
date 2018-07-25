//
//  ArtworkInfoViewController.swift
//  ArtPortfolio
//
//  Created by Susan Kern on 5/9/18.
//  Copyright © 2018 SKern. All rights reserved.
//

import UIKit

class ArtworkInfoViewController: UIViewController {

    // MARK: Private variables
    
    private var _workaroundScrollBug = true   
    
    
    // MARK: Public variables
    
    var artwork: PortfolioEntry?
    
    
    // MARK: IBOutlets

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var sizeButton: UIButton!
    @IBOutlet weak var materialsButton: UIButton!
    @IBOutlet weak var awardsButton: UIButton!
    @IBOutlet weak var navItem: UINavigationItem!
    
    
    // MARK: ViewController life-cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 2
        
        // Capture when user taps on artwork image
        let tapRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tappedImage))
        imageView.addGestureRecognizer(tapRecognizer)
        
        // Capture when user swipes down on screen
        let swipeRecognizer = UISwipeGestureRecognizer.init(target: self, action: #selector(swipedDownView))
        swipeRecognizer.direction = .down
        view.addGestureRecognizer(swipeRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        descriptionTextView.textContainerInset = UIEdgeInsets(top: 6, left: 10, bottom: 6, right: 10);
        
        if let artwork = artwork, let title = artwork.title {
            log.info("Present Artwork Info screen for \(title)")
            navItem.title = title
        }
        
        updateUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        descriptionTextView.flashScrollIndicators()
    }
    
    
    // MARK: Presentation
    
    override func viewDidLayoutSubviews() {
        if _workaroundScrollBug {
            // UITextView will not start at top, and other suggested workarounds
            //   cause flashing once view appears. 
            DispatchQueue.main.async {
                self.descriptionTextView.setContentOffset(CGPoint.zero, animated: false)
            }
            _workaroundScrollBug = false
        }
    }
    
    
    // MARK: IBActions
    
    @IBAction func tappedDoneButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsViewController = segue.destination as? ArtworkDetailViewController,
            let artwork = artwork {
            switch segue.identifier {
            case "ArtworkSizeSegue":
                detailsViewController.heading = "Size"
                detailsViewController.text = artwork.size
            case "ArtworkMaterialsSegue":
                detailsViewController.heading = "Materials"
                detailsViewController.text = artwork.materials            
            case "ArtworkAwardsSegue":
                detailsViewController.heading = "Awards"
                detailsViewController.text = artwork.awards    
            case "ArtworkFullScreenSegue":
                detailsViewController.heading = "Awards"
                detailsViewController.text = artwork.awards   
            default:
                return
            }
        } else if let fullScreenViewController = segue.destination as? ArtworkFullScreenViewController,
            let artwork = artwork {
            fullScreenViewController.imageName = artwork.imageName
        }
    }
    
    
    // MARK: Navigation

    @objc func tappedImage() {
        SAKAnalytics.logContentView(name: artwork!.title, fullScreen: true)

        performSegue(withIdentifier: "ArtworkFullScreenSegue", sender: self)
    }
        
    @objc func swipedDownView() {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: Private functions
    
    private func updateUI() {
        guard let artwork = artwork else { return }
        
        navigationItem.title = artwork.title
        title = artwork.title

        imageView.image = UIImage(named: artwork.imageName)
        descriptionTextView.text = artwork.description
        
        awardsButton.isHidden = (artwork.awards == nil)
        sizeButton.isHidden = (artwork.size == nil)
        materialsButton.isHidden = (artwork.materials == nil)
    }
}

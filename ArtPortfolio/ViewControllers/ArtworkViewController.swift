//
//  ArtworkViewController.swift
//  ArtPortfolio
//
//  Created by Susan Kern on 5/9/18.
//  Copyright © 2018 SKern. All rights reserved.
//

import UIKit

class ArtworkViewController: UIViewController {

    // MARK: Private variables
    
    private var workaroundScrollBug = true   
    
    
    // MARK: Public variables
    
    var artwork: PortfolioEntry?
    
    
    // MARK: IBOutlets

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var sizeButton: UIButton!
    @IBOutlet weak var materialsButton: UIButton!
    @IBOutlet weak var awardsButton: UIButton!
    
    
    // MARK: ViewController life-cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.layer.borderColor = UIColor.app_whiteColor().cgColor
        imageView.layer.borderWidth = 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        descriptionTextView.textContainerInset = UIEdgeInsets(top: 6, left: 10, bottom: 6, right: 10);
        
        updateUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        log.info("Present Artwork screen")
        
        descriptionTextView.flashScrollIndicators()
    }
    
    
    // MARK: Presentation
    
    override func viewDidLayoutSubviews() {
        if self.workaroundScrollBug {
            // UITextView will not start at top, and other suggested workarounds
            //   cause flashing once view appears. 
            DispatchQueue.main.async {
                self.descriptionTextView.setContentOffset(CGPoint.zero, animated: false)
            }
            self.workaroundScrollBug = false
        }
    }
    
    // MARK: IBActions
    
    @IBAction func tappedBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? ArtworkDetailViewController,
            let artwork = artwork else { return }
        
        switch segue.identifier {
        case "ArtworkSizeSegue":
            viewController.heading = "Size"
            viewController.text = artwork.size
        case "ArtworkMaterialsSegue":
            viewController.heading = "Materials"
            viewController.text = artwork.materials            
        case "ArtworkAwardsSegue":
            viewController.heading = "Awards"
            viewController.text = artwork.awards       
        default:
            return
        }
    }
    
    
    // MARK: Private functions
    
    private func updateUI() {
        guard let artwork = artwork else { return }
        
        self.navigationItem.title = artwork.title
        self.title = artwork.title

        imageView.image = UIImage(named: artwork.imageName)
        descriptionTextView.text = artwork.description
        
        awardsButton.isHidden = (artwork.awards == nil)
        sizeButton.isHidden = (artwork.size == nil)
        materialsButton.isHidden = (artwork.materials == nil)
    }
}

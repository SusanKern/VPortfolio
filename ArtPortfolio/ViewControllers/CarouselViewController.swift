//
//  CarouselViewController.swift
//  ArtPortfolio
//
//  Created by Susan Kern on 1/7/18.
//  Copyright © 2018 SKern. All rights reserved.
//

import UIKit
import ScalingCarousel

class CarouselViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: IBOutlets
    
    @IBOutlet weak var collectionView: ScalingCarouselView!
    
    
    // MARK: Private variables
    
    private var items = [PortfolioEntry]()
    private let superSizeForRolloverScrolling = 10000000

    
    // MARK: ViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.items = DataController.sharedInstance.portfolioContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        collectionView.isHidden = false

        // Start in the middle of the super-large list of images, so scrolling will be "infinite" in either direction
        let midIndexPath = IndexPath(row: superSizeForRolloverScrolling / 2, section: 0)
        collectionView.scrollToItem(at: midIndexPath, at: .left, animated: false)
    }

    
    // MARK: Card Collection DataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Set up super large list of images, to allow scrolling to roll over and be "infinite" in either direction
        return superSizeForRolloverScrolling
    }
    
    
    // MARK: - Card Collection DataSource
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCollectionViewCell.identifier, for: indexPath) as! CarouselCollectionViewCell
        let entry = items[((indexPath as NSIndexPath).row) % items.count]  // "% items.count" allows scrolling to roll over
        cell.image.image = UIImage(named: entry.imageName)
        cell.titleLabel.text = entry.title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let entry = items[((indexPath as NSIndexPath).row) % items.count]
        let alert = UIAlertController(title: entry.title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView.didScroll()
    }
}


//
//  PortfolioViewController.swift
//  ArtPortfolio
//
//  Created by Susan Kern on 1/7/18.
//  Copyright © 2018 SKern. All rights reserved.
//

import UIKit
import ScalingCarousel

class PortfolioViewController: UIViewController  {

    // MARK: IBOutlets
    
    @IBOutlet weak var collectionView: ScalingCarouselView!
    
    
    // MARK: Private variables
    
    private var _items = [PortfolioEntry]()
    private let _superSizeForRolloverScrolling = 10000000
    private var _firstPass = true

    
    // MARK: ViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _items = DataController.sharedInstance.portfolioContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if (_firstPass) {
            // Start in the middle of the super-large list of images, so scrolling will be "infinite" in either direction
            let midIndexPath = IndexPath(row: _items.count * 100, section: 0)
            collectionView.scrollToItem(at: midIndexPath, at: .left, animated: false)
            _firstPass = false
        }
    }
}


// MARK: UICollectionViewDataSource

extension PortfolioViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Set up super large list of images, to allow scrolling to roll over and be "infinite" in either direction
        return _superSizeForRolloverScrolling
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PortfolioCollectionViewCell.identifier, for: indexPath) as! PortfolioCollectionViewCell
        let entry = _items[((indexPath as NSIndexPath).row) % _items.count]  // "% _items.count" allows scrolling to roll over
        cell.imageView.image = UIImage(named: entry.imageName)
        cell.titleLabel.text = entry.title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let entry = _items[((indexPath as NSIndexPath).row) % _items.count]
        
        let viewController : ArtworkInfoViewController = storyboard!.instantiateViewController(withIdentifier: "ArtworkInfoViewController") as! ArtworkInfoViewController
        viewController.artwork = entry
        navigationController?.pushViewController(viewController, animated: true)
    }
}
    

// MARK: UIScrollViewDelegate

extension PortfolioViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView.didScroll()
    }
}

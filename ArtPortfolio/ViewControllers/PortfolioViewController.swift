//
//  PortfolioViewController.swift
//  ArtPortfolio
//
//  Created by Susan Kern on 1/7/18.
//  Copyright © 2018 SKern. All rights reserved.
//

import UIKit
import ScalingCarousel
import Crashlytics


class PortfolioViewController: UIViewController  {

    // MARK: IBOutlets
    
    @IBOutlet weak var collectionView: ScalingCarouselView!
    
    
    // MARK: Private variables
    
    private var _items = [PortfolioEntry]()
    private let _superSizeForRolloverScrolling = 10000000
    private var _firstPass = true
    private var _timer = Timer()

    
    // MARK: ViewController life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        _items = DataController.sharedInstance.portfolioContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard _items.count > 0 else { 
            _timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(refreshContent), userInfo: nil, repeats: true)
            return
        }
        
        if (_firstPass) {
            // Start in the middle of the super-large list of images, so scrolling will be "infinite" in either direction
            let midIndexPath = IndexPath(row: _items.count * 100, section: 0)
            collectionView.scrollToItem(at: midIndexPath, at: .left, animated: false)
            _firstPass = false
        }
    }
    
    @objc func refreshContent() {
        _items = DataController.sharedInstance.portfolioContent

        if _items.count > 0 {
            _timer.invalidate()
            
            collectionView.reloadData()
        }
    }
}


// MARK: UICollectionViewDataSource

extension PortfolioViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard _items.count > 0 else { return 0 }

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
        
        SAKAnalytics.logContentView(name: entry.title, fullScreen: false)
        
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

//
//  CarouselCollectionViewCell.swift
//  ArtPortfolio
//
//  Created by Susan Kern on 1/10/18.
//  Copyright © 2018 SKern. All rights reserved.
//

import UIKit
import ScalingCarousel

class PortfolioCollectionViewCell: ScalingCarouselCell {
    
    static let identifier = "PortfolioCollectionViewCell"

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 2
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.app_lightGrayColor().cgColor
    }
}

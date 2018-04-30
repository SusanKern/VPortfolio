//
//  DataController.swift
//  ArtPortfolio
//
//  Created by Susan Kern on 1/7/18.
//  Copyright © 2018 SKern. All rights reserved.
//

import Foundation

final class DataController {
    
    // MARK: Public variables

    let portfolioContent = [
                            PortfolioEntry(title: "Candy", imageName: "Candy", description: "description", dateCreated: Date(), materials: "materials"),
                            PortfolioEntry(title: "Reflection", imageName: "Reflection", description: "description", dateCreated: Date(), materials: "materials"),
                            PortfolioEntry(title: "Natural Amphora", imageName: "NaturalAmphora", description: "description", dateCreated: Date(), materials: "materials"),
                            PortfolioEntry(title: "Picking Flowers", imageName: "PickingFlowers", description: "description", dateCreated: Date(), materials: "materials"),
                            PortfolioEntry(title: "Legs", imageName: "Legs", description: "description", dateCreated: Date(), materials: "materials"),
                            PortfolioEntry(title: "NY Apartments", imageName: "NYApartments", description: "description", dateCreated: Date(), materials: "materials"),
                            PortfolioEntry(title: "Light Bulb", imageName: "LightBulb", description: "description", dateCreated: Date(), materials: "materials"),
                            PortfolioEntry(title: "Imagination", imageName: "Imagination", description: "description", dateCreated: Date(), materials: "materials"),
                            PortfolioEntry(title: "Silverware", imageName: "Silverware", description: "description", dateCreated: Date(), materials: "materials"),
                            PortfolioEntry(title: "Water", imageName: "Water", description: "description", dateCreated: Date(), materials: "materials"),
                            PortfolioEntry(title: "Floral Furniture", imageName: "FloralFurniture", description: "description", dateCreated: Date(), materials: "materials"),
                            ]
    
    let artist = Artist(firstName: "Victoria", lastName: "Kern", email: "vkern@artist.com", imageName: "VImage")
}
     
    

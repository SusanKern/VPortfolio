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
    
    let artist = Artist(firstName: "V", 
                        lastName: " ", 
                        email: "vikkernart@gmail.com", 
                        instagramUsername: "vik_kern_art",
                        imageNames: ["VImage0", "VImage1", "VImage2"],
                        bio: "V is an award-winning artist, poet and actress (shown above in the lead role in 'Hello Dolly'). Creating beauty from the ordinary is her passion, as evident in the subjects she chooses for her art.\nIn addition to being creative, she loves interacting with and helping children, and she spends her summers doing that as a counselor at a children's camp.\nV attends the Design School at North Carolina State University.")

    let portfolioContent = [
        PortfolioEntry(title: "Lightbulb", 
                       imageName: "LightBulb", 
                       description: "'Lightbulb' was a challenge because of the minute details in both the lightbulb itself and the candelabra inside of it. The silver of the candelabra presented the greatest challenge due to the unusual highlights and shadows. To create this piece, I started by popping in the basic outline and shapes using a simple, graphite pencil. Then I began adding color and shadows. For the bright highlights on the base of the bulb, the silver of the candelabra, and the glass top, I used a thin paintbrush and white acrylic paint. The background of the piece was created by rubbing multiple colors of chalk dust onto the paper.", 
                       dateCreated: "Fall 2017", 
                       materials: "Mixed media", 
                       size: "14” x 20”", 
                       awards: "Scholastic Art & Writing National Awards: American Visions Medal, Gold Medal\nOn national tour 2018-19"),
        
        PortfolioEntry(title: "Imagination", 
                       imageName: "Imagination", 
                       description: "'Imagination' is a collage created from an eclectic mix of paper and magazine pages. The challenge was to take various styles and patterns of paper and put them together in a way that was cohesive and not distracting from the piece overall. With the use of a home-made light table I was able to trace the precise shapes necessary to create this image.", 
                       dateCreated: "Spring 2018", 
                       materials: "Paper collage", 
                       size: "~ 24” x 36”", 
                       awards: nil),
        
        PortfolioEntry(title: "Natural Amphora", 
                       imageName: "NaturalAmphora", 
                       description: "'Natural Amphora' was inspired by the Neck Amphora, an ancient vase on display in the NC Museum of Art.  The curvature of this vase resembled the shape of a woman, so my goal in painting my piece was to capture the similarities between the female figure and a traditional amphora, all in a modern style. The pose of the subject and the high contrast of the black and white lend themselves more to the modern artistic style, while the patterns on the subject’s neck and torso come straight from ancient times. To create Natural Amphora, I started by penciling in the basic shapes on a piece of wood, and then I used black and white acrylic paint to bring depth to the piece.", 
                       dateCreated: "Fall 2016", 
                       materials: "Acrylic on wood", 
                       size: "23” x 31”", 
                       awards: "Selected by Teens Inspired competition for display at NC Museum of Art, Summer 2017\nOn semi-permanent public art display at North Hills, Raleigh, NC\nTrinity Academy Art Competition - Best in Show - 2017"),
        
        PortfolioEntry(title: "NY Apartments", 
                       imageName: "NYApartments", 
                       description: "'NY Apartments' started out as a picture taken of buildings while walking through New York City. There is so much beauty around us, even along dirty, city streets. By painting this picture, I hoped to be able to reveal the beauty within a familiar sight that people often pass by without appreciating. The process of making this piece was intimidating at first because I had never used oil paint prior to this project, but I was able to learn new techniques as I painted. The medium enabled me to achieve vibrant colors through the process of layering shades of paint. The end result was a bright, cohesive piece full of life and color.", 
                       dateCreated: "Spring 2016", 
                       materials: "Oil paint on canvas", 
                       size: "18” x 24”", 
                       awards: nil),

                            
        PortfolioEntry(title: "Silverware", 
                       imageName: "Silverware", 
                       description: "My goal in creating 'Silverware' was to present silverware in a way that was both realistic and creative. To accomplish this goal, I painted the silverware itself just as it appeared in real life, but I did so on a piece of distressed cardboard and used dripping paint to add interest. The cardboard was not distressed before I began, so I took an xacto knife and cut away the surface in some areas to reveal the texture underneath.", 
                       dateCreated: "Winter 2016", 
                       materials: "Gesso and Acrylic on cardboard", 
                       size: "32” x 40”", 
                       awards: nil),
        
        PortfolioEntry(title: "Floral Furniture", 
                       imageName: "FloralFurniture", 
                       description: "'Ladder' was a challenge to create simply because of the incredible detail. It took months to complete because of both the complicated flowers and all the tiny spaces that needed to be shaded one at a time. My goal with this piece was to combine the hard structure of the chairs and ladder with the whimsical flower designs in order to make an every-day subject more interesting.", 
                       dateCreated: "Fall 2016", 
                       materials: "Colored pencil and ink", 
                       size: "~ 20” x 30”", 
                       awards: "On semi-permanent public art display at North Hills, Raleigh, NC"),
        
        PortfolioEntry(title: "Candy", 
                       imageName: "Candy", 
                       description: "The goal I hoped to accomplish with 'Candy' was to capture the vibrant colors of the different types of candy. Some candies were slightly transparent, so to show their coloring accurately in my drawing, I layered and blended several similar shades. For the brightest highlights on the plastic wrappers, I used white gesso. The wrappers were tricky because they did not have any real color, but cool shades of blue and purple helped show the outlines. ", 
                       dateCreated: "Spring 2016", 
                       materials: "Colored pencil", 
                       size: "17” x 11”", 
                       awards: nil),
        
        PortfolioEntry(title: "Reflection", 
                       imageName: "Reflection", 
                       description: "'Reflection' was very different from any pieces I had previously created. The many shadows forced me to carefully consider the different shapes in a human face as I worked, since only certain features were illuminated. To make this piece, I first cut tape into the shapes of the cracks in the mirror, and I placed those on the paper. Then I drew in the face and hands before adding the black around them. Once the drawing itself was complete, I peeled off the tape, which had left clean, white lines behind. One difficulty I encountered while drawing this piece was the idea of having the picture make sense. There were a lot of interesting shapes and reflections, and if someone looking at the drawing could not tell there was a mirror, then the elements of the piece would not seem cohesive.", 
                       dateCreated: "Winter 2016", 
                       materials: "Charcoal", 
                       size: "24” x 36”", 
                       awards: "Trinity Academy Art Competition - Best in Show - 2016"),
        
        PortfolioEntry(title: "Picking Flowers", 
                       imageName: "PickingFlowers", 
                       description: "This piece taught me the skill of layering colors to create depth, both in skin-tones and in shadows. At first, I was hesitant to use any blues or purples in the skin areas, but as I worked, I became more comfortable with adding opposite colors in order to make some sections darker than others. I also noticed many slight variations in the coloring of the model’s skin as I studied the photograph I was drawing. Even just on her face, some areas had red undertones, while others had hints of olive. Through the process of making this specific piece, I learned a lot about color and how it can be utilized in subtle ways.", 
                       dateCreated: "Fall 2017", 
                       materials: "Chalk pastel", 
                       size: "~ 18” x 24”", 
                       awards: "Trinity Academy Art Competition - 1st place - High School Division - 2018"),
        
        PortfolioEntry(title: "Legs", 
                       imageName: "Legs", 
                       description: "Legs is a piece that focuses on the shapes of the human body. The style of hatching used in the painting serves to draw extra attention to the shadows, creating depth in the picture. To begin this piece, I drew the basic shapes with pencil, then proceeded to fill in different values using black sharpie. Once the shading was complete, I popped in some color on the fabrics and the floor to brighten the piece.", 
                       dateCreated: "Fall 2015", 
                       materials: "Watercolor and ink", 
                       size: "18” x 24”", 
                       awards: "NC State Fair - Special Award - 2015\nOn semi-permanent public art display at North Hills, Raleigh, NC"),
        
        PortfolioEntry(title: "Treefrog", 
                       imageName: "TreeFrog", 
                       description: "This was a one day project created using Sharpies.  It demonstrates the technique of pointillism,  which places dots of different colors next to each other to creating the illusion of a completely separate color.", 
                       dateCreated: "Fall 2015", 
                       materials: "Ink", 
                       size: "~ 12” x 12”", 
                       awards: nil),
        ]
}

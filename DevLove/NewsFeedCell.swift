//
//  NewsFeedCell.swift
//  DevLove
//
//  Created by Daniel Ny on 2017-07-05.
//  Copyright © 2017 Daniel Ny. All rights reserved.
//

import UIKit

class NewsFeedCell: UITableViewCell {

    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDescription: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        layer.shadowColor = UIColor(red: 0, green: 255, blue: 255, alpha: 1.0).cgColor
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowRadius = 2.0
        layer.cornerRadius = 2.0
    }
    
    func configureCell(newsFeed: NewsFeed) {
        self.newsTitle.text = newsFeed.title
        self.newsDescription.text = newsFeed.description
        
        //Remove the extra Timestamp on published key returned on JSON before setting the value on lbl
        var publ = newsFeed.published
        if let rng = publ.range(of: "T") {
            publ.removeSubrange(rng.lowerBound..<publ.endIndex)
        }
        self.newsDate.text = publ
        
        //Set image
        self.newsImage.image = newsFeed.newsImage
    }

}

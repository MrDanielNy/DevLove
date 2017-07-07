//
//  NewsFeed.swift
//  DevLove
//
//  Created by Daniel Ny on 2017-07-05.
//  Copyright © 2017 Daniel Ny. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage


class NewsFeed {
    private var _title: String!
    private var _description: String!
    private var _published: String!
    private var _webUrl: String!
    private var _imageUrl: String!
    private var _newsImage: UIImage!
    
    var title: String {
        if _title == nil {
            _title = ""
        }
        return _title
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        
        return _description
    }
    
    var published: String {
        if _published == nil {
            _published = ""
        }
        return _published
    }
    
    var webUrl: String {
        if _webUrl == nil {
            _webUrl = ""
        }
        return _webUrl
    }
    
    var imageUrl: String {
        if _imageUrl == nil {
            _imageUrl = ""
        }
        return _imageUrl
    }
    
    var newsImage: UIImage {
        get {
            if _newsImage == nil {
                _newsImage = UIImage(named: "No-Image-Avail")
            }
            return _newsImage
        } set {
            _newsImage = newValue
        }
    }
    
    init(newsDict: Dictionary<String, AnyObject>) {
        if let newsTitle = newsDict["title"] {
            self._title = newsTitle.capitalized
            
        }
        if let newsDescription = newsDict["description"] {
            self._description = newsDescription.capitalized
            
        }
        if let published = newsDict["publishedAt"] {
            self._published = published as? String
        }
        
        if let webUrl = newsDict["url"] {
            self._webUrl = webUrl as? String
        }
        
        if let imageUrl = newsDict["urlToImage"] {
            self._imageUrl = imageUrl as? String
        }
        
    }
}


//
//  NewsFeed.swift
//  DevLove
//
//  Created by Daniel Ny on 2017-07-05.
//  Copyright © 2017 Daniel Ny. All rights reserved.
//

import Foundation
import Alamofire

class NewsFeed {
    private var _title: String!
    private var _description: String!
    private var _published: String!
    
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
    
    init(newsDict: Dictionary<String, AnyObject>) {
        //        _title = title
        //        _description = description
        //        _published = published
        
        
                if let newsTitle = newsDict["title"] {
                    self._title = newsTitle.capitalized
                    //   print(newsTitle)
                    
                }
                if let newsDescription = newsDict["description"] {
                    self._description = newsDescription.capitalized
                    //   print(newsDescription)
                    
                }
                if let published = newsDict["publishedAt"] {
                    self._published = published as? String
                    //    print(published)
                }
        }
    }


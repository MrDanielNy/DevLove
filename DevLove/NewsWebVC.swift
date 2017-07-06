//
//  NewsWebVC.swift
//  DevLove
//
//  Created by Daniel Ny on 2017-07-06.
//  Copyright © 2017 Daniel Ny. All rights reserved.
//

import UIKit

class NewsWebVC: UIViewController {

    @IBOutlet weak var newsWebView: UIWebView!
    
    private var _newsFeedObject: NewsFeed!
    
    var newsFeedObject: NewsFeed {
        get {
            return _newsFeedObject
        } set {
            _newsFeedObject = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(newsFeedObject.webUrl)
        // Do any additional setup after loading the view.
        let url = NSURL(string: newsFeedObject.webUrl)
        let request = NSURLRequest(url: url! as URL)
        newsWebView.loadRequest(request as URLRequest)
    }

    @IBAction func backBtnTapped(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }


}

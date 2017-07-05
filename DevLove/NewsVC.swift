//
//  NewsVC.swift
//  DevLove
//
//  Created by Daniel Ny on 2017-07-05.
//  Copyright © 2017 Daniel Ny. All rights reserved.
//

/*News feed json data from newsapi. 
 Get request link: https://newsapi.org/v1/articles?source=recode&sortBy=top&apiKey=81457607b989422ea14c5bf7a5acc24b
 */

import UIKit
import Alamofire
import Firebase
import SwiftKeychainWrapper


class NewsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    
    var downloadedNewsFeed = [NewsFeed]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.downloadNews {
            print(self.downloadedNewsFeed.count)
            self.tableView.reloadData()
        }
    }

    func downloadNews(completed: @escaping DownloadComplete) {
        Alamofire.request("https://newsapi.org/v1/articles?source=recode&sortBy=top&apiKey=81457607b989422ea14c5bf7a5acc24b").responseJSON {response in
            print("Alamofire NewsFeed returned: \(response.result)")
            
            // if let newsJSON = response.result.value {
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                
                if let articles = dict["articles"] as? [Dictionary<String, AnyObject>], articles.count > 0 {
                    
                    for obj in articles {
                        let newsObject = NewsFeed(newsDict: obj)
                        self.downloadedNewsFeed.append(newsObject)
                    }
                    
                }
                completed()
            }
            
        }
    }
    
    @IBAction func signoutBtn(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            let removeKeySuccessfull: Bool = KeychainWrapper.standard.removeAllKeys()
            print("Signout and the removal of keys was \(removeKeySuccessfull)")
            performSegue(withIdentifier: "goToSignin", sender: nil)
        } catch let signoutError as NSError {
            print("Error signingout user with errorcode \(signoutError)")
        }
    }
    
    //TableView functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsFeedCell {
            let newsObject = downloadedNewsFeed[indexPath.row]
            cell.configureCell(newsFeed: newsObject)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return downloadedNewsFeed.count
    }
    
}

//
//  FancyLabel
//  DevLove
//
//  Created by Daniel Ny on 2017-07-05.
//  Copyright © 2017 Daniel Ny. All rights reserved.
//

import UIKit

class FancyLabel: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: 1.2/255.0, green: 1.2/255.0, blue: 1.2/255.0, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.6
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.shadowRadius = 5.0
        layer.cornerRadius = 5.0
    }
    
    

}

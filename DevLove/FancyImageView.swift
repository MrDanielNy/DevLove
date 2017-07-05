//
//  FancyImageView.swift
//  DevLove
//
//  Created by Daniel Ny on 2017-07-05.
//  Copyright © 2017 Daniel Ny. All rights reserved.
//

import UIKit

//@IBDesignable
class FancyImageView: UIImageView {

    override func layoutSubviews() {
        layer.cornerRadius = frame.width / 2
    }

}

//
//  CircleImage.swift
//  chatroom
//
//  Created by Nikita Koniukh on 23/04/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//

import UIKit
@IBDesignable
class CircleImage: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        
    }
 
    func setupView(){
        self.layer.cornerRadius = layer.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }

}

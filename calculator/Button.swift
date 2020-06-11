//
//  Button.swift
//  calculator
//
//  Created by Alvin Tseng on 2020/6/10.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//
import Foundation
import UIKit

protocol ButtonTitleReciver  {
    func reviceButtonTitle(_ title: String)
}

class Button:UIButton {
    
    var revicer: ButtonTitleReciver?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        //TODO: Code for our button
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height / 2
    }
    @objc func buttonAction(sender: UIButton!) {
        //       infix.input(self.currentTitle!)
        let title = sender.currentTitle ?? ""
        revicer?.reviceButtonTitle(title)
    }
}




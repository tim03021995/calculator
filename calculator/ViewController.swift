//
//  ViewController.swift
//  calculator
//
//  Created by Alvin Tseng on 2020/6/8.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//
import UIKit
let fullScreenSize = UIScreen.main.bounds.size
var infix = Infix()
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        textNum.text = "0"
        number0Button.revicer = self
    }
    
    @IBOutlet weak var number0Button: Button!
    
    // MARK: - IBAction
    
    @IBOutlet weak var textNum: UILabel!
    @IBAction func inputNum(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            infix.allClear()
            textNum.text = "0"
        //AC
        case 2:
            infix.input("/")
            textNum.text = infix.viewDisplay()
        case 3:
            infix.input("*")
            textNum.text = infix.viewDisplay()
        default:
            infix.input(sender.currentTitle!)
            textNum.text = infix.viewDisplay()
        }
        
    }
}

extension ViewController: ButtonTitleReciver {
    
    func reviceButtonTitle(_ title: String) {
        print(title)
    }
}

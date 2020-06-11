//
//  ViewController.swift
//  calculator
//
//  Created by Alvin Tseng on 2020/6/8.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//
import UIKit
let fullScreenSize = UIScreen.main.bounds.size
//private var infix = Infix()
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        textNum.text = "0"
        
        
    }
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
    // MARK: - Meth
    //    func imageSizeSet(_ image: Button){
    //
    //    }
}


//
//  Button.swift
//  calculator
//
//  Created by Alvin Tseng on 2020/6/10.
//  Copyright © 2020 Alvin Tseng. All rights reserved.
//
import Foundation
import UIKit
class Button:UIButton {
    override func awakeFromNib() {
           super.awakeFromNib()
        var infix = Infix()
        self.addTarget(self, action: infix.input(self.currentTitle!), for: .touchUpInside)

           //TODO: Code for our button
       }
    override func layoutSubviews() {
        super.layoutSubviews()
         self.layer.cornerRadius = self.frame.height / 2
    }

}


struct Infix {
    var postfix = [String]()
    var stack = [String]()
    var op:String?
    var isTypingNum:Bool?
    var epWasPush:String?
    
    //    init(op: String = "1", isTypingNum: Bool = true, postfix: [String] = ["hi"], stack: [String] = ["hi"]) {
    //        self.postfix = postfix //Infix.postfix = parameter(Postfix)
    //        self.stack = stack
    //        self.isTypingNum = isTypingNum
    //        self.op = op
    //    }
    mutating func allClear() {
        postfix.removeAll()
        stack.removeAll()
        op = nil
        isTypingNum = nil
    }
    
    
    mutating func input(_ input:String){
        switch input {
        case "+","-","*","/":
            if(stack.isEmpty && postfix.isEmpty){
                stack.append(input)
            }else if(stack.isEmpty && postfix.isEmpty == false){
                stack.append(input)
            }else if(stack.isEmpty==false && postfix.isEmpty){
                let ind=stack.endIndex
                stack[ind] = input
            }else if(stack.isEmpty == false && postfix.isEmpty == false && epWasPush == nil){
                if(input == stack[stack.count-1]&&isTypingNum==false ){
                    print("重複輸入")
                    break
                }
                let R = postfix.popLast()
                let op = stack.popLast()
                let anwser:Double?
                if(postfix.isEmpty){
                    let L = "0"
                    anwser=bornOp(op!,L,R!)
                    postfix.append(dtos(anwser!))
                }else {
                    let L = postfix.popLast()
                    anwser=bornOp(op!,L!,R!)
                    postfix.append(dtos(anwser!))
                }
                stack.append(input)
            }else{
                let L = postfix.popLast()
                postfix.removeAll()
                stack.removeAll()
                postfix.append(L!)
                stack.append(input)
            }
            isTypingNum = false
            epWasPush = nil
            
            
        case "1","2","3","4","5","6","7","8","9","0":
            if (postfix.isEmpty || isTypingNum == false){
                postfix.append(input)
            }else if(postfix.isEmpty==false){
                let buffer = postfix.popLast()
                let num = buffer! + input
                postfix.append(num)
            }else{
                postfix.append(input)
            }
            isTypingNum = true
            epWasPush = nil
        case "=":
            if(stack.isEmpty == false && postfix.isEmpty == false){
                if(epWasPush == nil){
                    let R = postfix.popLast()
                    let op = stack.popLast()
                    let anwser:Double?
                    if(postfix.isEmpty){
                        let L = "0"
                        anwser=bornOp(op!,L,R!)
                        postfix.append(R!)
                        postfix.append(dtos(anwser!))
                    }else{
                        let L = postfix.popLast()
                        anwser=bornOp(op!,L!,R!)
                        postfix.append(R!)
                        postfix.append(dtos(anwser!))
                    }
                    isTypingNum = false
                    stack.append(op!)
                    epWasPush = R
                }else{
                    let L = postfix.popLast()
                    let op = stack.popLast()
                    let anwser:Double?
                    let R = epWasPush
                    anwser=bornOp(op!,L!,R!)
                    postfix.append(R!)
                    postfix.append(dtos(anwser!))
                    isTypingNum = false
                    stack.append(op!)
                }
            }
        default:
            print("input Error Type")
            break
        }
    }
    func viewDisplay()->String{
        if(postfix.isEmpty){
            return"null"
        }else{
            return postfix[postfix.count - 1]
        }
    }
    
}
func dtos (_ d:Double) -> String {
    if(d == Double.infinity){
        return "無窮"
    }else if(Double(Int(d)) == d){
        return String(Int(d))
    }else{
        return String(d)
    }
}
func bornOp (_ op:String,_ l:String,_ r:String) -> Double{
    var anwser:Double = 0
    let L:Double = Double(l)!
    let R:Double = Double(r)!
    switch  op{
    case "+":
        anwser = L + R
    case "-":
        anwser = L - R
    case "*":
        anwser = L * R
    case "/":
        anwser = L / R
    default:
        anwser = 0
    }
    return anwser
}

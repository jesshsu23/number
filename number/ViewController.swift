//
//  ViewController.swift
//  number
//
//  Created by Jess Hsu on 2021/9/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hint: UILabel!
    @IBOutlet weak var guessTime: UILabel!
    @IBOutlet weak var inputNumber: UITextField!
    
    var answer =  Int.random(in: 0...100) //答案
    var chance = 8 //生命初始值
    var upperBound = 100 //最大範圍提示
    var lowerBound = 0  //最小範圍提示
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //按鈕go
    @IBAction func gobtn(_ sender: UIButton) {
        inputNumber.resignFirstResponder()
        
        
        if inputNumber.text == "" {
            
            hint.text="猜猜我幾歲？" //使用者沒輸入
            
            
        }else if Int(inputNumber.text!) == nil {
            
            hint.text="只能輸入數字！"  //使用者輸入的不是數字
            
            
        }else if chance > 0{
            
            
            let i = Int(inputNumber.text!)!
            check(test: i)
            
        }else{
            hint.text = "你的機會用完了！"
        }
        
    }
    
   
   
   //驗證
   func check(test:Int){
       
       
       if test > 100{
           
           hint.text = "數字超過範圍了"
           
           chance -= 1
           
           guessTime.text = String(chance)
           
           
       }else if test > answer {
           upperBound = test - 1
           
           hint.text = "欠扁？我看起來有這麼老？"
           
           chance -= 1
           
           guessTime.text = String(chance)
           
       }else if test < answer {
           lowerBound = test + 1
           
           hint.text = "嘴真甜！我沒這麼年輕拉！"
           
           chance -= 1
           
           guessTime.text = String(chance)
           
       }else {
           
           hint.text = "答對了!想不到吧！"
           
           
       }
   }
    
    //按鈕playagain
    @IBAction func playagain(_ sender: UIButton) {
        hint.text = "猜猜我幾歲？"
        inputNumber.text = "0"
        chance = 8
        upperBound = 100
        lowerBound = 0
        answer = Int(arc4random_uniform(100))
        guessTime.text = String(chance)
       
    }
    

    
}


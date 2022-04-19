//
//  GuessNumverViewController.swift
//  guessnumber
//
//  Created by Caren on 2022/4/10.
//

import UIKit

class GuessNumverViewController: UIViewController {

    @IBOutlet weak var guessTextField: UITextField!
  
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var messageLabel2: UILabel!
    
    @IBOutlet weak var guessBtn: UIButton!
    var a = 0
    var count = 0
    var num_temp = 0
    var range_max = 99
    var range_min = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
         view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func guessNumber(_ sender: Any) {
    }
    @IBAction func guessBtn(_ sender: Any) {
        if count == 0 {
            generateNumber()
        }
        num_temp = Int(guessTextField.text!) ?? 0
        if a == num_temp {
           success()
        }
        if a != num_temp {
                failed()
        }
        
    }
    
    @IBAction func tryAgainBtn(_ sender: Any) {
        count = 0
        range_max = 99
        range_min = 0
        guessTextField.placeholder = "0~99"
        guessTextField.text = ""
        guessTextField.isEnabled = true
        guessTextField.textColor = UIColor (red: 1, green: 1, blue: 1, alpha: 1)
        guessTextField.backgroundColor = UIColor (red: 125/255, green: 200/255, blue: 225/255, alpha: 0.5)
        guessBtn.isEnabled = true
        messageLabel.text = ""
        messageLabel2.text = "可以猜5次"
    }
    func generateNumber() {
        a = Int.random(in: 0...99)
        
        
    }
    
    func success(){
        guessTextField.text = "PENGU"
        guessTextField.isEnabled = false
        guessBtn.isEnabled = false
        messageLabel2.text = "恭喜你猜對了！"
        messageLabel.text = "今天有\(a)隻企鵝\n在南極曬太陽☀️"
    }
    
    
    
    
    
    func failed() {
        
        count=count+1
        guessTextField.text = ""
        if count < 5 {
            messageLabel2.text = "哎呀！還剩下\(5-count)次機會"
            if ((a > num_temp) && (num_temp >= 0)) {
                
                range_min = num_temp+1
                messageLabel.text = "範圍:\(range_min)~\(range_max)"
                
                guessTextField.placeholder = "\(range_min)~\(range_max)"
            }
            if ((a < num_temp) && (num_temp < 100)) {
                range_max = num_temp-1
                messageLabel.text = "範圍:\(range_min)~\(range_max)"
                guessTextField.placeholder = "\(range_min)~\(range_max)"
            }
            else {
                messageLabel.text = "範圍:\(range_min)~\(range_max)"
                
                guessTextField.placeholder = "\(range_min)~\(range_max)"
            }
        }
        else {
            guessTextField.isEnabled = false
            guessTextField.text = "加油！再玩一次"
            guessBtn.isEnabled = false
            messageLabel.text = ""
            messageLabel2.text = "今天有\(a)隻企鵝\n在南極曬太陽☀️"
        }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

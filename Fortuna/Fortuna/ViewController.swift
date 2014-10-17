//
//  ViewController.swift
//  Fortuna
//
//  Created by 朱里达 on 14/10/17.
//  Copyright (c) 2014年 zld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quotationTextView: UITextView!
    
    var delegate = UIApplication.sharedApplication().delegate as AppDelegate
    
    @IBAction func rootViewTapped(sender: UITapGestureRecognizer) {
        displayRandomQuote()
    }
    
    func displayRandomQuote() {
        var randomInt = arc4random() % 2
        var quote : String = "Hello"
        var positiveQuotes = delegate.positiveQuotes
        var negativeQuotes = delegate.negativeQutoes
        quote = (randomInt == 0) ? positiveQuotes[Int(arc4random_uniform(UInt32(positiveQuotes.count)))] :
                negativeQuotes[Int(arc4random_uniform(UInt32(negativeQuotes.count)))]
//        if randomInt == 0 {
//            quote = positiveQuotes[Int(arc4random_uniform(UInt32(positiveQuotes.count)))]
//        } else {
//            quote = negativeQuotes[Int(arc4random_uniform(UInt32(negativeQuotes.count)))]
//        }
        quotationTextView.text = quote
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println("Controller: \(self)")
        println("View: \(self.view)")
        println("View's Name: \(self.view.frame)")
        
        let positiveQuotesPath = NSBundle.mainBundle().pathForResource("positiveQuotes", ofType: "json")
        println("positive quotes path: \(positiveQuotesPath)")
        
        quotationTextView.editable = false
        quotationTextView.selectable = false
        
        displayRandomQuote()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


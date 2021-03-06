//
//  ViewController.swift
//  Flashcards
//
//  Created by iD Student on 8/1/17.
//  Copyright © 2017 iD Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet weak var answerPickerView: UIPickerView!
    
    @IBOutlet weak var questionalLabel: UILabel!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        answerPickerView.dataSource = self;
        answerPickerView.delegate = self;
        setupCardUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupCardUI() {
        questionTextView.text = cardCollection.instance.currentCard.question
        
        questionalLabel.text = "Question \(cardCollection.instance.currentIndex + 1)/\(cardCollection.instance.cards.count)"
        
        answerPickerView.reloadAllComponents()
    }
    
    // Pickerview Data Source
    // returns the number of 'columns' to display.
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    
    // returns the # of rows in each component..
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cardCollection.instance.currentCard.options.count
    }
    
    // Pickerview delegates
    // returns text of option at a given row.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cardCollection.instance.currentCard.options[row];
    }
   
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        var alert: UIAlertController
        
        if cardCollection.instance.checkAnswer(_selectedAnswer: answerPickerView.selectedRow(inComponent: 0)) {
            alert = UIAlertController(title: "Correct", message: "Correct answer!", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Yay!", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true)
        }
        else {
            alert = UIAlertController(title: "Wrong", message: "Wrong answer...", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Try again.", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true)
            
        }
        
        cardCollection.instance.nextQuestion()
        
        setupCardUI()
    }
    
}




//
//  ViewController.swift
//  devPage
//
//  Created by Kayla Hoang on 2/13/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var birthday: UITextField!
    @IBOutlet weak var showData: UITextView!
    
    let datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createDatePicker()
        //assign delegate
        name.delegate = self
        height.delegate = self
        weight.delegate = self
        birthday.delegate = self
    }
    
    func createDatePicker(){
        //toolbar
        let tb = UIToolbar()
        tb.sizeToFit()
        
        //done button
        let doneB = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneTapped))
        tb.setItems([doneB], animated: true)
        //assign toolbar to keyboard
        birthday.inputAccessoryView = tb
        //assign date picker to text field
        birthday.inputView = datePicker
        //exclude everything else but date
        datePicker.datePickerMode = .date
    }
    
    @objc func doneTapped(){
        //formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none // don't need it
        //assign to text field and close
        //birthday.text = "\(datePicker.date)"
        //need string
        birthday.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    /*override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        birthday.resignFirstResponder()
    }*/
    
    @IBAction func showTapped(_ sender: Any) {
        showData.text = "Name: \(name.text!)\nHeight: \(height.text!)\nWeight: \(weight.text!)\nBirthday: \(birthday.text!)"
    }
}

// set up text field via UI delegates
extension ViewController: UITextFieldDelegate{
    //override field delegate; dismisses the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

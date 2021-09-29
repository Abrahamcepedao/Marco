//
//  ReservaViewController.swift
//  MuseoDeTodos
//
//  Created by Abraham Cepeda Oseguera on 28/09/21.
//

import UIKit

class ReservaViewController: UIViewController {

    //  type of reservation
    @IBOutlet weak var titleLbl: UILabel!
    var name: String?
    
    //variables
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var hourTF: UITextField!
    @IBOutlet weak var personsStepper: UIStepper!
    @IBOutlet weak var personsNum: UILabel!
    
    //date
    let datePicker = UIDatePicker()
    
    //hour
    let hourPicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let title = name {
            titleLbl.text = "Reserva: \(title)"
        }
        setupDatePicker()
        setupHourPicker()
    }
    
    //<--------date functions--------->
    func setupDatePicker(){
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //done btn
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(dateDonePressed))
        toolbar.setItems([doneBtn], animated: true)
        dateTF.inputAccessoryView = toolbar
        
        
        
        dateTF.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.addTarget(self, action: #selector(dateChanged), for: UIControl.Event.valueChanged)
        datePicker.preferredDatePickerStyle = .wheels
        
    }
    
    @objc func dateChanged(sender: UIDatePicker){
        //formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        dateTF.text = formatter.string(from: sender.date)
        print(sender.date)
        dateTF.text = formatter.string(from: sender.date)
        //self.view.endEditing(true)
    }
    
    @objc func dateDonePressed(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        dateTF.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    //<--------hour functions--------->
    func setupHourPicker(){
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //done btn
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(dateHourPressed))
        toolbar.setItems([doneBtn], animated: true)
        hourTF.inputAccessoryView = toolbar
        
        
        
        hourTF.inputView = hourPicker
        hourPicker.datePickerMode = .time
        hourPicker.frame.size = CGSize(width: 0, height: 300)
        hourPicker.addTarget(self, action: #selector(hourChanged), for: UIControl.Event.valueChanged)
        hourPicker.preferredDatePickerStyle = .wheels
        
    }
    
    @objc func hourChanged(sender: UIDatePicker){
        //formatter
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "HH:mm"
        
        print(sender.date)
        
        hourTF.text = formatter.string(from: sender.date)
        print(sender.date)
        hourTF.text = formatter.string(from: sender.date)
        //self.view.endEditing(true)
    }
    
    @objc func dateHourPressed(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        hourTF.text = formatter.string(from: hourPicker.date)
        self.view.endEditing(true)
    }
    
    //<--------stepper functions--------->
    @IBAction func stepperPressed(_ sender: UIStepper) {
        personsNum.text = String(Int(sender.value))
    }
    
}

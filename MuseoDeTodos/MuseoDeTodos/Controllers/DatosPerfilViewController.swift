//
//  DatosPerfilViewController.swift
//  MuseoDeTodos
//
//  Created by Abraham Cepeda Oseguera on 08/09/21.
//

import UIKit

class DatosPerfilViewController: UIViewController {
    
    @IBOutlet weak var firstnameTF: UITextField!
    @IBOutlet weak var secondnameTF: UITextField!
    @IBOutlet weak var lastnameTF: UITextField!
    @IBOutlet weak var sexTF: UITextField!
    @IBOutlet weak var birthdateTF: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    //gender pickerView
    let gender = ["Hombre", "Mujer", "Otro"]
    let genderPickerView = UIPickerView()
    
    //datepciker
    let datePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()

        // setup pickers
        setupPicker()
        setupDatePicker()
    }
    
    func setupPicker(){
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        sexTF.inputView = genderPickerView
        sexTF.text = gender[0]
        
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //done btn
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed2))
        toolbar.setItems([doneBtn], animated: true)
        sexTF.inputAccessoryView = toolbar
    }
    
    func setupDatePicker(){
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //done btn
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        birthdateTF.inputAccessoryView = toolbar
        
        
        
        birthdateTF.inputView = datePicker
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
        
        birthdateTF.text = formatter.string(from: sender.date)
        print(sender.date)
        birthdateTF.text = formatter.string(from: sender.date)
        //self.view.endEditing(true)
    }
    
    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        birthdateTF.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func donePressed2(){
    
        self.view.endEditing(true)
    }
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        print(firstnameTF.text ?? "")
        print(secondnameTF.text ?? "")
        print(lastnameTF.text ?? "")
        print(sexTF.text ?? "")
        print(birthdateTF.text ?? "")
    }
    

}


extension DatosPerfilViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        gender.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        gender[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sexTF.text = gender[row]
//        sexTF.resignFirstResponder()
    }

}

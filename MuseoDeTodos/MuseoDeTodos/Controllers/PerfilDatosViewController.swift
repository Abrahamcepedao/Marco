//
//  PerfilDatosViewController.swift
//  MuseoDeTodos
//
//  Created by Ezequiel Lozano Guerrero on 10/6/21.
//

import UIKit

class PerfilDatosViewController: UIViewController{
    
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var sexoTxt: UITextField!
    @IBOutlet weak var primerNombreTxt: UITextField!
    @IBOutlet weak var fechaNacimientoTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var apellidosTxt: UITextField!
    @IBOutlet weak var segundoNombreTxt: UITextField!
    var nombre: String?
    var email: String?
    var pass: String?
    var apellidos: String?
    var segundoNombre: String?
    
    //gender pickerView
    let gender = ["Hombre", "Mujer", "Otro"]
    let genderPickerView = UIPickerView()
    
    //datepciker
    let datePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(nombre ?? "_")
        desactivaCampo()
        // setup pickers
        setupPicker()
        setupDatePicker()
        sexoTxt.text = gender[0]
        
        emailTxt.text = email
        primerNombreTxt.text = nombre
        passTxt.text = pass
        apellidosTxt.text = apellidos
        segundoNombreTxt.text = segundoNombre
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        if let date = formatter.date(from: "Aug 7, 2001") {
            fechaNacimientoTxt.text = formatter.string(from: date)
        }
        
    }
    
    func setupPicker(){
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        sexoTxt.inputView = genderPickerView
        sexoTxt.text = gender[0]
        
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //done btn
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed2))
        toolbar.setItems([doneBtn], animated: true)
        sexoTxt.inputAccessoryView = toolbar
    }
    
    func setupDatePicker(){
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //done btn
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        fechaNacimientoTxt.inputAccessoryView = toolbar
        
        
        
        fechaNacimientoTxt.inputView = datePicker
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
        
        fechaNacimientoTxt.text = formatter.string(from: sender.date)
        print(formatter.string(from: sender.date))
        print(sender.date)
        fechaNacimientoTxt.text = formatter.string(from: sender.date)
        //self.view.endEditing(true)
    }
    
    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        fechaNacimientoTxt.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func donePressed2(){
        self.view.endEditing(true)
    }
    
    func desactivaCampo(){
        
        emailTxt.isEnabled = false
        sexoTxt.isEnabled = false
        primerNombreTxt.isEnabled = false
        fechaNacimientoTxt.isEnabled = false
        passTxt.isEnabled = false
        apellidosTxt.isEnabled = false
        segundoNombreTxt.isEnabled = false
        
    }

    @IBAction func modificarPress(_ sender: Any) {
        
        emailTxt.isEnabled = true
        sexoTxt.isEnabled = true
        primerNombreTxt.isEnabled = true
        fechaNacimientoTxt.isEnabled = true
        passTxt.isEnabled = true
        apellidosTxt.isEnabled = true
        segundoNombreTxt.isEnabled = true
        
    }
    
    @IBAction func guardarPress(_ sender: Any) {
        desactivaCampo()
        let alert = UIAlertController(title: "Guardar", message: "Cambios guardados exitosamente", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
        self.present(alert, animated: true, completion: nil)
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

extension PerfilDatosViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
        sexoTxt.text = gender[row]
//        sexoTxt.resignFirstResponder()
    }

}
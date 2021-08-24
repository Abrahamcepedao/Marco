//
//  ViewController.swift
//  MuseoDeTodos
//
//  Created by Abraham Cepeda Oseguera on 22/08/21.
//

import UIKit

class PerfilViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var optionsTV: UITableView!
    
    let options: [Option] = [
        Option(title: "Terminos y condiciones", image: "info.circle"),
        Option(title: "Acerca del museo", image: "info.circle"),
        Option(title: "Contáctanos", image: "info.circle"),
        Option(title: "Cerrar sesión", image: "info.circle")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        optionsTV.delegate = self
        optionsTV.dataSource = self
        let nib = UINib(nibName: "OptionsTableViewCell", bundle: nil)
        optionsTV.register(nib, forCellReuseIdentifier: "optionCell")
       

        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "optionCell")  as!  OptionsTableViewCell
        
        let option = options[indexPath.row]
        cell.optionLbl.text = option.title
        cell.optionImg.image = UIImage(systemName: option.image)
        return  cell
    }

}

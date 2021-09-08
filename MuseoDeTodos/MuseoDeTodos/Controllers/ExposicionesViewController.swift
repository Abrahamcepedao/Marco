//
//  ExposicionesViewController.swift
//  MuseoDeTodos
//
//  Created by Abraham Cepeda Oseguera on 08/09/21.
//

import UIKit

class ExposicionesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var exposicionesTV: UITableView!
    
    let exposiciones: [Exposicion] = [
        Exposicion(title: "titulo 1", subtitle: "subtitulo 1", firstDate: "16 OCT 2020", lastDate: "11 ABR 2021", image: ""),
        Exposicion(title: "titulo 2", subtitle: "subtitulo 2", firstDate: "19 AUG 2021", lastDate: "19 NOV 2021", image: ""),
        Exposicion(title: "titulo 3", subtitle: "subtitulo 3", firstDate: "08 SEP 2021", lastDate: "19 OCT 2021", image: "")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // set up table view
        exposicionesTV.delegate = self
        exposicionesTV.dataSource = self
        let nib = UINib(nibName: "ExposicionTableViewCell", bundle: nil)
        exposicionesTV.register(nib, forCellReuseIdentifier: "exposicionCell")
        
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exposiciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //create cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "exposicionCell") as! ExposicionTableViewCell
        
        //setup cell
        let exposicion = exposiciones[indexPath.row]
        cell.tituloLbl.text = exposicion.title
        cell.subtituloLbl.text = exposicion.subtitle
        cell.fechaLbl.text = exposicion.firstDate + " - " + exposicion.lastDate
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//          let exposicion = exposiciones[indexPath.row]
        
    }

}

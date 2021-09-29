//
//  ReservasViewController.swift
//  MuseoDeTodos
//
//  Created by Abraham Cepeda Oseguera on 09/09/21.
//

import UIKit

class ReservasViewController: UIViewController {

    @IBOutlet weak var reservasTV: UITableView!
    
    var reservas: [Reserva] = [
        Reserva(title: "Restaurante", subtitle: "Menu contemporáneo", dias: "Martes a domingo", horas: "11am a 3pm", image: "img"),
        Reserva(title: "Visita guiada", subtitle: "Menu contemporáneo", dias: "Martes a domingo", horas: "11am a 3pm", image: "img"),
        Reserva(title: "Visita guiada para niños ", subtitle: "Menu contemporáneo", dias: "Martes a domingo", horas: "11am a 3pm", image: "img")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTable()
    }
    
    func setupTable() {
        reservasTV.delegate = self
        reservasTV.dataSource = self
        let nib = UINib(nibName: "RerservasTableViewCell", bundle: nil)
        reservasTV.register(nib, forCellReuseIdentifier: "reservaCell")
    }

}

extension ReservasViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reservas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reservaCell") as! RerservasTableViewCell
        
        let reserva = reservas[indexPath.row]
        cell.titulo.text = reserva.title
        cell.subtitulo.text = reserva.subtitle
        cell.dias.text = reserva.dias
        cell.horas.text = reserva.horas
        cell.imagen.image = UIImage(named: reserva.image ?? "img")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc  = storyboard?.instantiateViewController(identifier: "ReservaViewController") as? ReservaViewController{
            vc.name = reservas[indexPath.row].title
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

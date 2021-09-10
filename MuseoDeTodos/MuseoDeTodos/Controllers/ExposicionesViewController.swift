//
//  ExposicionesViewController.swift
//  MuseoDeTodos
//
//  Created by Abraham Cepeda Oseguera on 08/09/21.
//

import UIKit
import FirebaseFirestore

class ExposicionesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //var exposiciones: [Exposicion] = [Exposicion(title: "titulo 1", subtitle: "subtitulo 1", firstDate: "16 OCT 2020", lastDate: "11 ABR 2021", image: ""), Exposicion(title: "titulo 2", subtitle: "subtitulo 2", firstDate: "19 AUG 2021", lastDate: "19 NOV 2021", image: "")]
        
    
    @IBOutlet weak var exposicionesTV: UITableView!
    
    var exposiciones = [Exposicion]()
    
    private var db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //getData()
        
        // set up }table view
        exposicionesTV.delegate = self
        exposicionesTV.dataSource = self
        let nib = UINib(nibName: "ExposicionTableViewCell", bundle: nil)
        exposicionesTV.register(nib, forCellReuseIdentifier: "exposicionCell")
        
        fetchData()
    }
    
    func fetchData() {
        db.collection("exposicion").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.exposiciones = documents.compactMap { (queryDocumentSnapshot) -> Exposicion in
                let data = queryDocumentSnapshot.data()
                
                let title = data["titulo"] as? String ?? ""
                let subtitle = data["subtitulo"] as? String ?? ""
                let firstDate = data["fechaInicial"] as? String ?? ""
                let lastDate = data["fechaFinal"] as? String ?? ""
                let image = ""
                
                print(title)
                return Exposicion(title: title, subtitle: subtitle, firstDate: firstDate, lastDate: lastDate, image: image)
                
            }
            self.exposicionesTV.reloadData()
        }
    }
    
    //func getData(){
    //    var exposicionesTemp: [Exposicion] = []
    //    db.collection("exposicion").getDocuments() { (querySnapshot, err) in
    //        if let err = err {
    //            print("Error getting documents: \(err)")
    //        } else {
    //            for document in querySnapshot!.documents {
    //                let tituloTemp : String = document.get("titulo") as! String
    //               exposicionesTemp.append(Exposicion(title: tituloTemp, subtitle: "subtitulo 1", firstDate: "16 OCT 2020", lastDate: "11 ABR 2021", image: ""))
    //            }
    //            dump(exposicionesTemp)
    //        }
    //    }
    //}
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exposiciones.count
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

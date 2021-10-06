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
                
                let id = data["id"] as? String ?? ""
                let title = data["title"] as? String ?? ""
                let startDate = data["startDate"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let cerraduria = data["cerraduria"] as? String ?? ""
                let museografia = data["museografia"] as? String ?? ""
                let salas = data["salas"] as? String ?? ""
                let tecnica = data["tecnica"] as? String ?? ""
                let obras = data["obras"] as? String ?? ""
                let recorridoVirtual = data["recorridoVirtual"] as? String ?? ""
                let videoUrl = data["videoUrl"] as? String ?? "https://www.youtube.com/watch?v=fv1Q0SPWonk"
                
                print(title)
                return Exposicion(id: id, title: title, startDate: startDate, description: description, cerraduria: cerraduria, museografia: museografia, salas: salas, tecnica: tecnica, obras: obras, recorridoVirtual: recorridoVirtual, videoUrl: videoUrl)
                
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
        cell.fechaLbl.text = exposicion.startDate
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
<<<<<<< Updated upstream
//          let exposicion = exposiciones[indexPath.row]
        
=======
        if let vc = storyboard?.instantiateViewController(identifier: "Exposiciones2ViewController") as?
            Exposiciones2ViewController{
            vc.data = exposiciones[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
>>>>>>> Stashed changes
    }

}

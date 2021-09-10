//
//  ExposicionTableViewModel.swift
//  MuseoDeTodos
//
//  Created by user193339 on 9/9/21.
//

import Foundation
import FirebaseFirestore

class ExposicionTableViewModel: ObservableObject {
    
    var exposiciones = [Exposicion]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("exposicion").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.exposiciones = documents.compactMap { (queryDocumentSnapshot) -> Exposicion in
                let data = queryDocumentSnapshot.data()
                
                let title = data["titulo"] as? String ?? ""
                let subtitle = "Subtitulo"
                let firstDate = "16 OCT 2020"
                let lastDate = "18 OCT 2020"
                let image = ""
                
                print(title)
                return Exposicion(title: title, subtitle: subtitle, firstDate: firstDate, lastDate: lastDate, image: image)
            }
        }
    }
}

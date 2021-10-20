//
//  PagosViewController.swift
//  MuseoDeTodos
//
//  Created by Abraham Cepeda Oseguera on 20/10/21.
//

import UIKit

class PagosViewController: UIViewController {

    @IBOutlet weak var pagosTV: UITableView!
    
    var cards = [Card(image: "mastercard-logo", number: "4242424242424242", expiration: "08/24", cvc: 999),Card(image: "visa-logo", number: "4000002500003155", expiration: "06/28", cvc: 278),Card(image: "mastercard-logo", number: "4000000000009995", expiration: "12/23", cvc: 119),]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTV()
    }
    
    func setupTV(){
        pagosTV.delegate = self
        pagosTV.dataSource = self
        let nib = UINib(nibName: "PagoTableViewCell", bundle: nil)
        pagosTV.register(nib, forCellReuseIdentifier: "PagoCell")
    }
    
    @IBAction func addBtnTapped(_ sender: UIButton) {
        let vc = AgregarPagoViewController(nibName: "AgregarPagoViewController", bundle: nil)
        
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
    }
    
}

extension PagosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pagosTV.dequeueReusableCell(withIdentifier: "PagoCell", for: indexPath) as! PagoTableViewCell
        
        cell.delegate = self
        cell.cardNum = cards[indexPath.row].number

        cell.cardLbl.text = "**** \(String(cards[indexPath.row].number.suffix(4)))"
        cell.cardImg.image = UIImage(named: cards[indexPath.row].image)
        return cell
    }
    
    
}

extension PagosViewController: PagoCellDelegate {
    func deleteBtnTapped(with card: String) {
        print("deleting")
        var index = 0
        for i in 0..<cards.count {
            if cards[i].number == card {
                index = i
            }
        }
        cards.remove(at: index)
        pagosTV.reloadData()
    }
}

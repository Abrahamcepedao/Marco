//
//  ExposicionTableViewCell.swift
//  MuseoDeTodos
//
//  Created by Abraham Cepeda Oseguera on 08/09/21.
//

import UIKit

class ExposicionTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var tituloLbl: UILabel!
    @IBOutlet weak var fechaLbl: UITextView!
    @IBOutlet weak var subtituloLbl: UILabel!
    @IBOutlet weak var overlayView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupStyles()
    }
    
    func setupStyles(){
        backgroundImage.layer.cornerRadius = 10
        overlayView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
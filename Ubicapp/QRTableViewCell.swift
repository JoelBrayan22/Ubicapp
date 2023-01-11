//
//  QRTableViewCell.swift
//  Ubicapp
//
//  Created by MacBook  on 11/01/23.
//

import UIKit

class QRTableViewCell: UITableViewCell {
    
    @IBOutlet weak var qrImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // vamos a cargar la imagen que se va a mostrar en qrImageView
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let qrImage = generarCodigoQR(from: "esto es solo una prueba")
        qrImageView.image = qrImage
    }

}

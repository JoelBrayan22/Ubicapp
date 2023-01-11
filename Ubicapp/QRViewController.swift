//
//  QRViewController.swift
//  Ubicapp
//
//  Created by MacBook  on 11/01/23.
//

import UIKit

class QRViewController: UIViewController {
    
    @IBOutlet weak var qrImageView: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        let qrImage = generarCodigoQR(from: "este es solo una prueba ok")
        qrImageView.image = qrImage
    }
    
}

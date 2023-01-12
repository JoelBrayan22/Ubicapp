//
//  QRViewController.swift
//  Ubicapp
//
//  Created by MacBook  on 12/01/23.
//

import UIKit

class QRViewController: UIViewController {
    
    var locacionSelecionada: LocacionEntity?
    var qrViewModel: QRViewModel = QRViewModel()
    
    @IBOutlet weak var qrImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Vamos a configurar que nosotros vamos a implementar las funciones que faltan en QRViewModel
        qrViewModel.view = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let qrImage = generarCodigoQR(from: "\(locacionSelecionada.lat), \(locacionSelecionada.lon)")
        qrImageView.image = qrImage
    }

}

extension QRViewController: QRView {
    func locacion(locacionSelecionada: LocacionEntity) {
        self.locacionSelecionada = locacionSelecionada
    }
}

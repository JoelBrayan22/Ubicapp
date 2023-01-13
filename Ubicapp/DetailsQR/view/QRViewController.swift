//
//   Proyecto: Ubicapp
//
// Autores:
// Joel Brayan Navor Jimenez
// Jonathan
// Heber Eduardo Jimenez Rodriguez
//
// Creado el 12 de enero del 2023 por jonothan Amador
// Modificaciones:
// Modificado por: Jonathan Amador el 13/01/2023
//
//

import UIKit

class QRViewController: UIViewController {
    // IBOutlets
    @IBOutlet weak var ubicacionImageView: UIImageView!
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var latitudLabel: UILabel!
    @IBOutlet weak var longitudLabel: UILabel!
    @IBOutlet weak var qrImageView: UIImageView!
    
    // generamos una variable de tipo Protocolo obpcional
    var ubicacionSelecionada: UbicacionEntity?
    // generamos un objeto del
    var qrViewModel: QRViewModel?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*if let qrViewModel = qrViewModel{
            qrViewModel.view = self
        }
        
        
        // Vamos a configurar que nosotros vamos a implementar las funciones que faltan en QRViewModel
        qrViewModel?.view = self*/
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Cuándo aparece esta vista solicita la última ubicación seleccionada
        self.qrViewModel?.requestUbicacionSeleccionada()
        
        /*if let ubicacionSelecionada = ubicacionSelecionada {
            // set la imagen del ubicacion
            if let imagenData = ubicacionSelecionada.imagen {
                let ubicacionImagen = UIImage(data: imagenData)
                ubicacionImageView.image = ubicacionImagen
                
            }
            // set el nombre la ubicacion
            nombreTextField.text = ubicacionSelecionada.nombre
            // set el lat la ubicacion
            latitudLabel.text = String(ubicacionSelecionada.latitud)
            // set el lon la ubicacion
            longitudLabel.text = String(ubicacionSelecionada.longitud)
            // set la imagen del qr
            let qrImage = generarCodigoQR(from: "\(ubicacionSelecionada.latitud), \(ubicacionSelecionada.longitud)")
            qrImageView.image = qrImage
        }*/
    }

    @IBAction func agregarImagenTapped(_ sender: UIButton) {
    }
    
    @IBAction func compartirTapped(_ sender: UIButton) {
    }
    
}

extension QRViewController: QRView {
    
    // La vista recibe la última ubicación seleccionada
    // ya sea la que pidió al aparecer o la que viene
    // automáticamente de la suscripción
    func ubicacion(ubicacionSelecionada: UbicacionEntity?) {
        self.ubicacionSelecionada = ubicacionSelecionada
        
        // Si hay una ubicación seleccionada refrescamos la vista
        // es decir, actualizamos los controles (labels y demás)
        if let ubicacionSelecionada = ubicacionSelecionada {
            // set la imagen del ubicacion
            if let imagenData = ubicacionSelecionada.imagen {
                let ubicacionImagen = UIImage(data: imagenData)
                ubicacionImageView.image = ubicacionImagen
                
            }
            // set el nombre la ubicacion
            nombreTextField.text = ubicacionSelecionada.nombre
            // set el lat la ubicacion
            latitudLabel.text = String(ubicacionSelecionada.latitud)
            // set el lon la ubicacion
            longitudLabel.text = String(ubicacionSelecionada.longitud)
            // set la imagen del qr
            let qrImage = generarCodigoQR(from: "\(ubicacionSelecionada.latitud), \(ubicacionSelecionada.longitud)")
            qrImageView.image = qrImage
        }
    }
    
    func ubicacion(ubicacionActualizada ubicacion: UbicacionEntity?) {
        //self.ubicacionSelecionada.actualizarUbicacion(
    }
    
    
}

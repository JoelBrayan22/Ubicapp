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
    var qrViewModel: QRViewModel = QRViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Vamos a configurar que nosotros vamos a implementar las funciones que faltan en QRViewModel
        qrViewModel.view = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        qrViewModel.recargarProductoSelecionado()
    }
    
    func recargarDatos() {
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
    
    func mostrarImagenSeleccionada(imagenSeleccionada: UIImagePickerController.SourceType){
        guard UIImagePickerController.isSourceTypeAvailable(imagenSeleccionada) else {
            print("Data Source no disponible")
            return
        }

        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = imagenSeleccionada
        imagePickerController.allowsEditing = false
        self.present(imagePickerController, animated: true,completion: nil)
        
    }

    @IBAction func agregarImagenTapped(_ sender: UIButton) {
        // Genera un alert que vamos a mostrar para solicitar el acceso a las imagenes o la camara
        let alert = UIAlertController(
            title: "Selcciona una imagen",
            message: "¿Desde donde quieres seleccionar imagen?",
            preferredStyle: .alert
        )
        
        // Agragar la accion que nos va a permitir acceder a la camara
        let camaraBoton = UIAlertAction(
            title: "Camara",
            style: .destructive
        ) { _ in
            self.mostrarImagenSeleccionada(imagenSeleccionada: .camera)
        }
        
        // Agragar la accion que nos va a permitir acceder a la biblioteca de images
        let bibliotecaBoton = UIAlertAction(title: "Biblioteca", style: .default) { _ in
            self.mostrarImagenSeleccionada(imagenSeleccionada: .photoLibrary)
        }
        
        // Agragar la accion que nos va a permitir cancelar la operacion
        let cancelBotton = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alert.addAction(camaraBoton)
        alert.addAction(bibliotecaBoton)
        alert.addAction(cancelBotton)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func compartirTapped(_ sender: UIButton) {
    }
    
}

extension QRViewController: QRView {
    func ubicacion(ubicacionSelecionada: UbicacionEntity?) {
        print(ubicacionSelecionada)
        self.ubicacionSelecionada = ubicacionSelecionada
        self.recargarDatos()
    }
}


extension QRViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image =  info[.originalImage] as? UIImage {
//            ubicacionImageView.image = image
            qrViewModel.actualizarLaImagenDeLaUbicacionSelecionada(imageData: image.pngData())
        } else {
            print("Imagen no encontrada")
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

extension QRViewController: UINavigationControllerDelegate {
    
}

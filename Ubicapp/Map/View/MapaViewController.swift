//
// Proyecto: Ubicapp
//
// Autores:
// Joel Brayan Navor Jimenez
// Jonathan
// Heber Eduardo Jimenez Rodriguez
//
// Creado el 12 de enero del 2023
//

import UIKit
import MapKit

class MapaViewController: UIViewController {
    
    // Pasamos modelo vista
    weak var mapaViewModel: MapaViewModel?
    
    // Mapa
    @IBOutlet weak var myMapKit: MKMapView!
    
    @IBOutlet weak var detallesUbicacionView: UIView!
    
    @IBOutlet weak var latitudLabel: UILabel!
    
    @IBOutlet weak var longitudLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapaViewModel?.view = self
        // Ubicacion por defecto
        let ubicacionDefault = CLLocation(latitude: 21.127052, longitude: -101.688952)
        self.myMapKit.centerToLocation(ubicacionDefault)
        
        self.myMapKit.delegate = self
        
        self.configuracionDelGesto()
        
        let mark = MKPointAnnotation()
        mark.title = "Hola"
        mark.coordinate = CLLocationCoordinate2D(latitude: 21.127052, longitude: -101.688952)
        self.myMapKit.addAnnotation(mark)
    }

    override func viewDidAppear(_ animated: Bool) {
        
        // Actualiza las ubicaciones
        self.mapaViewModel?.refreshUbicaciones()
    }
    
    func configuracionDelGesto() {
        let gestureLongPress = UILongPressGestureRecognizer(target: self, action:#selector(self.handleLongPress))
        gestureLongPress.minimumPressDuration = 1
        gestureLongPress.delaysTouchesBegan = true
        gestureLongPress.delegate = self
        self.myMapKit.addGestureRecognizer(gestureLongPress)
    }
    
    @objc func handleLongPress(gestureRecognizer: UILongPressGestureRecognizer) {
        
        // Para no hacer doble generacion de punto
        if gestureRecognizer.state == UIGestureRecognizer.State.ended {
                    return
        }
        
        else if gestureRecognizer.state == UIGestureRecognizer.State.began {
            
            let touchPoint = gestureRecognizer.location(in: self.myMapKit)
            
            let touchMapCoordinate =  self.myMapKit.convert(touchPoint, toCoordinateFrom: self.myMapKit)
            
            print("Generando puntooooo")
            
            // Agregar la nueva ubicacion
            self.mapaViewModel?.agregarUbicacion(latitud: Double(touchMapCoordinate.latitude), longitud: Double(touchMapCoordinate.longitude))
        }
    }
    
    @IBAction func verDetallesUbicacion(_ sender: Any) {
        
        // Pasar a vista de detalles
        self.navigationController?.pushViewController(QRViewController(), animated: false)
    }
    
    /*
    func setupView() {
        self.detallesUbicacionView.layer.cornerRadius = detallesUbicacionView.bounds.size.width / 30
    }
     */
    /*
    @IBAction func agregarButton(_ sender: Any) {
    }*/
}

extension MapaViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive press: UIPress) -> Bool {
        return false
    }
}

class MapaAnnotation: MKPointAnnotation {
    
    var ubicacion: UbicacionEntity?
    
}

extension MapaViewController: MapaView {
    
    func ubicacion(ubicaciones: [UbicacionEntity]) {
        
        ubicaciones.forEach { [weak self] ubicacion in
            
            let mark = MapaAnnotation()
            
            mark.title = ubicacion.nombre
            mark.ubicacion = ubicacion
            
            let latitud = ubicacion.latitud
            let longitud = ubicacion.longitud
            
            print("Ubicacion: (\(latitud), \(longitud))")
            
            mark.coordinate = CLLocationCoordinate2D(latitude: latitud, longitude: longitud)
 
            self?.myMapKit.addAnnotation(mark)
        }
        
        myMapKit.reloadInputViews()
    }
    
    func ubicacion(ubicacionSeleccionada ubicacion: UbicacionEntity) {
        
        self.latitudLabel.text = "\(ubicacion.latitud)"
        self.longitudLabel.text = "\(ubicacion.longitud)"
    }
}

extension MapaViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        
        if let mapaUbicacion = annotation as? MapaAnnotation {
            
            if let ubicacion = mapaUbicacion.ubicacion {
                self.mapaViewModel?.seleccionarUbicacion(id: Int(ubicacion.id))
            }
        }
    }
}

private extension MKMapView {
  func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
    let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}

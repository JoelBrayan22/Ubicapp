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
import Combine

class MapaViewModel {
    
    weak var model: UbicappModel?
    weak var view: MapaView?
    var ubicacionesSubscriber: AnyCancellable?
    
    init(model: UbicappModel) {
        
        self.model = model
        
        self.ubicacionesSubscriber = model.$ubicaciones.sink {
            [weak self] ubicaciones in
            
            self?.view?.ubicaciones(ubicaciones: ubicaciones)
        }
        
        self.ubicacionesSubscriber = model.$ubicacionSeleccionada.sink {
            [weak self] ubicacion in
            
            self?.view?.ubicaciones(UbicacionSeleccionada: ubicacion!)
        }
    }
    
    func seleccionarUbicacion(id: Int) {
        self.model?.seleccionarUbicacion(id: id)
    }
    
}



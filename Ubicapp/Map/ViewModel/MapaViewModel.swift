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
    
    // Modelo
    weak var model: UbicappModel?
    // Protocolo para notificarle a la vista de algun evento
    weak var view: MapaView?
    // Escucha alguna actualizacion de las ubicaciones desde el modelo
    var ubicacionesSubscriber: AnyCancellable?
    var ubicacionSeleccionadaSubscriber: AnyCancellable?
    
    // Subscripciones a los cambios que ocupamos
    init(model: UbicappModel) {
        
        self.model = model
        
        // MARK: Funciones para escuchar actualizaciones desde el modelo
        
        // Escucha cuando todo el arreglo de ubicaciones
        self.ubicacionesSubscriber = model.$ubicaciones.sink(receiveValue: {
            [weak self] ubicaciones in
            
            print("Actualizando ubicaciones")
            self?.view?.ubicacion(ubicaciones: ubicaciones)
        })
        
        // Escucha cual es la ubicacion seleccionada
        self.ubicacionSeleccionadaSubscriber = model.$ubicacionSeleccionada.sink(receiveValue: {
            [weak self] ubicacion in
            
            // Desempaquetamos ubicacion seleccionada (ubicacion)
            if let ubicacion = ubicacion {
                self?.view?.ubicacion(ubicacionSeleccionada: ubicacion)
                
            }
        })
    }
    
    // MARK: Funcion que consume la vista.
    
    func agregarUbicacion(latitud: Double, longitud: Double) {
        self.model?.agregarUbicacion(latitud: latitud, longitud: longitud)
    }
    
    func seleccionarUbicacion(id: Int) {
        self.model?.seleccionarUbicacion(id: id)
    }
    
    func refreshUbicaciones() {
        guard let model = self.model else { return }
        
        self.view?.ubicacion(ubicaciones: model.ubicaciones)
    }
    
}


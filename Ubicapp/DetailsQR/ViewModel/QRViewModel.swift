//
//  Proyecto: Ubicapp
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

import Foundation
import Combine

///
///protocolo
///
///
class QRViewModel {
    
    
    ///intancia del protocolo
    ///
    var view: QRView?
    var ubicappModel: UbicappModel?
    
    // CurrentValueSubject es una fuente de datos que retiene el ultimo valor
    // por lo tanto cuando nos subscribimos obtemos ese valor
    
    var subscriber: AnyCancellable?
    
    /*var ubicacionSeleccionadaSubject = CurrentValueSubject<UbicacionEntity?, Never>(nil)*/
    
    ///
    ///hacemos dos variables de anyCanc
    ///
    /*var subscriber: AnyCancellable?
     var subscriber2: AnyCancellable?*/
    
    
    
    init(model: UbicappModel) {
        /* subscriber = UbicappModel.shared.$ubicacionSeleccionada.sink { [weak self] ubicacion in
         self?.ubicacionSeleccionadaSubject.send(ubicacion)
         }
         subscriber2 = ubicacionSeleccionadaSubject.sink(receiveValue: { [weak self] ubicacion in
         self?.view?.ubicacion(ubicacionSelecionada: ubicacion)
         })*/
        
        self.ubicappModel = model
        
        // Nos suscribimos al modelo para que cada que cambie la ubicación
        // seleccionada se la mande a la vista
        self.subscriber = ubicappModel?.$ubicacionSeleccionada.sink{
            [weak self] ubicacionSeleccionada in
            
            // Envía la ubicación seleccionada (actualizada desde el modelo)
            // a la vista
            self?.view?.ubicacion(ubicacionSelecionada: ubicacionSeleccionada)
            
            // otrsos posibles subcriptores
        }
    }
    
    // Si se pide la última ubicación seleccionada se envia a la vista
    func requestUbicacionSeleccionada() {
        // Mandamos la última ubicación seleccionada
        self.view?.ubicacion(ubicacionSelecionada: self.ubicappModel?.ubicacionSeleccionada)
    }
        
    
    /*func getProductoSelecionado() {
        ubicappModel?.$ubicacionSeleccionada
        //ubicacionSeleccionadaSubject.send(UbicappModel.shared.ubicacionSeleccionada)
    }*/
    
    /*func actualizarLaImagenDeLaUbicacionSelecionada(imageData: Data?) {
        //UbicappModel.shared.actualizarUbicacion(nombre: nil, latitud: nil, longitud: nil, imagen: imageData)
    }*/

    
}

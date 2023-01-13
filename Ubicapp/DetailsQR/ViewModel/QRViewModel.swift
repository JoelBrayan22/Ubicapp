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

protocol QRView: AnyObject {
    
    func ubicacion(ubicacionSelecionada: UbicacionEntity?)
}

class QRViewModel {
    
    ///
    ///intancia del protocolo
    ///
    weak var view: QRView?
    
    // CurrentValueSubject es una fuente de datos que retiene el ultimo valor
    // por lo tanto cuando nos subscribimos obtemos ese valor
    var ubicacionSeleccionadaSubject = CurrentValueSubject<UbicacionEntity?, Never>(UbicappModel.shared.ubicacionSeleccionada)
    ///
    ///hacemos dos variables de anyCanc
    ///
    var subscriber: AnyCancellable?
    var subscriber2: AnyCancellable?

    init() {
        subscriber = UbicappModel.shared.$ubicacionSeleccionada.sink { [weak self] ubicacion in
            self?.ubicacionSeleccionadaSubject.send(ubicacion)
        }
        subscriber2 = ubicacionSeleccionadaSubject.sink(receiveValue: { [weak self] ubicacion in
            self?.view?.ubicacion(ubicacionSelecionada: ubicacion)
        })
    }

    func recargarProductoSelecionado() {
        ubicacionSeleccionadaSubject.send(UbicappModel.shared.ubicacionSeleccionada)
    }
    
    func actualizarLaImagenDeLaUbicacionSelecionada(imageData: Data?) {
        UbicappModel.shared.actualizarUbicacion(nombre: nil, latitud: nil, longitud: nil, imagen: imageData)
    }

    deinit {
        subscriber?.cancel()
        subscriber2?.cancel()
    }
}

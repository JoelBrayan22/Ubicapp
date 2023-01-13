//
//  MapaView.swift
//  Ubicapp
//
//  Created by Heber  on 12/01/23.
//

import Foundation

protocol MapaView: NSObject {

    func ubicaciones(ubicaciones: [UbicacionEntity])
    func ubicaciones(UbicacionSeleccionada ubicacion: UbicacionEntity)
    func ubicaciones(ubicacionAgregada ubicacion: UbicacionEntity)

}

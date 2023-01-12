//
//  QRViewModel.swift
//  Ubicapp
//
//  Created by MacBook  on 12/01/23.
//

import Foundation
import Combine

protocol QRView: AnyObject {
    func locacion(locacionSelecionada: LocacionEntity)
}

class QRViewModel {
    weak var view: QRView?
    init() {
        
    }
    deinit {}
}

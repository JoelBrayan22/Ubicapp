//
// Proyecto: Ubicapp
//
// Autores:
// Joel Brayan Navor Jimenez
// Jonathan
// Heber Eduardo Jimenez Rodriguez
//
// Creado el 11 de enero del 2023
//

import Foundation
import CoreData
import Combine

class UbicappModel {
    
    // Singleton
    static let shared = UbicappModel()
    
    // Creamos el contenedor
    var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "UbicappModel")
        
        // Carga todas las ubicaciones existentes en nuestro CoreData(UbicappModel)
        container.loadPersistentStores { _, error in
            if let error = error {
                // Si ocurre algun error al cargar las ubicaciones imprime este error
                fatalError("No se pudo cargar el contenedor UbicappModel")
            }
        }
        
        // Si logra cargar todas las ubicaciones, nos devuelve el contenedor
        return container
    }()
    
    // MARK: Published (Publicadores de cambios)
    // Publicador de todas las ubicaciones
    @Published var ubicaciones: [UbicacionEntity] = []
    // Index seleccionado
    @Published var indexSeleccionado: Int?
    // Ubicacion seleccionada
    @Published var ubicacionSeleccionada: UbicacionEntity?
    
    init() {
        self.loadUbicaciones()
    }
    
    deinit {
        self.ubicaciones.removeAll()
    }
    
    // MARK: Funciones que podemos aplicar a nuestro modelo
    // Cargar las ubicaciones desde nuestro contenedor
    func loadUbicaciones() {
        let context = self.container.viewContext
        
        let request = UbicacionEntity.fetchRequest()
        
        if let ubicaciones = try? context.fetch(request) {
            self.ubicaciones = ubicaciones.reversed()
        }
    }
    
    // Seleccionar una ubicacion
    func seleccionarUbicacion(index: Int) {
        
        guard index >= 0 && index < self.ubicaciones.count else { return }
        
        self.indexSeleccionado = index
        self.ubicacionSeleccionada = self.ubicaciones[index]
        
    }
    
    // Agregar una ubicacion
    func agregarUbicacion(nombre: String, latitud: Double, longitud: Double) {
        
        let context = self.container.viewContext
        
        let ubicacion = UbicacionEntity(context: context)
        
        ubicacion.nombre = nombre
        ubicacion.latitud = latitud
        ubicacion.longitud = longitud
        //ubicacion.imagen = imagen
        
        do {
            try context.save()
            self.loadUbicaciones()
        } catch {
            context.rollback()
        }
    }
    
    // Actualizar una ubicacion.
    func actualizarUbicacion(nombre: String?, latitud: Double?, longitud: Double?) {
        
        if let ubicacionSeleccionada = self.ubicacionSeleccionada {
            
            if let nombre = nombre {
                ubicacionSeleccionada.nombre = nombre
            }
            
            if let latitud = latitud {
                ubicacionSeleccionada.latitud = latitud
            }
            
            if let longitud = longitud {
                ubicacionSeleccionada.longitud = longitud
            }
            
            let context = container.viewContext
            
            do {
                try context.save()
                self.loadUbicaciones()
            } catch {
                context.rollback()
            }
        }
        
    }
    
    // Elimina una ubicacion seleccionada.
    func eliminarUbicacion() {
        
        if let indexSeleccionado = indexSeleccionado {
            
            self.ubicaciones.remove(at: indexSeleccionado)
            self.indexSeleccionado = nil
            self.ubicacionSeleccionada = nil
            self.loadUbicaciones()
        }
    }
}
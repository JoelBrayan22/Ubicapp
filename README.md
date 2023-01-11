# Proyecto Ubicapp

## Proyecto Realizado por:
### Joel Brayan Navor Jimenez
### Heber Eduardo Jimenez Rodriguez
### Marco Antonio Jonathan Amador Hernandez

# Ubicapp Models

> Locación
```swift
struct LocacionEntity {
let id: Int
let latitud: Double
let longitud: Double
let nombre: String
let image: Binary Data
}


```swift
class UbicacionMarcadaModel { 
/// TODO:
///       1.- importacion CoreData, Combine
///       2.- Creación del singleton para el acceso global
///       3.- Instanciar a el Contenedor Persistente
///       4.- Creación de la función para cargar la(s) ubicación(es) marcada(s).
///       5.- Creación de la función para añadir una nueva marca.
///       6.- Creación de la función para mandar una ubicación seleccionada.
///       7.- Creación de la función para actualizar ubicaciòn selecionada
///       8.- Creaciòn de los publishers a utilizar
          
     static let shared UbicacionMarcadaModel ()
     
     var container: NSPersistentContainer = {
     ///
     }
     
      @Published var ubicacionesmarcadas: [LocacionEntity] = []
      @Published var ubicacionmarcadaseleccionada: LocacionEntity?
      
      func cargarUbicacionesMarcadas() 
      
      func añadirMarcadorUbicacion(latitud: Double, longitud: Double, nombre: String?)

      func ubicacionSeleccionada(id: Int) 
      
      func actualizarUbicacionMarcada(nombre: String?)
      
}
```

# Ubicapp ViewModels
>Clase MapaViewModel
```swift
class MapaViewModel { 
// TODO: cargar la ubicación de la persona 
// Publicadores
// Suscriptores

init() {  
//TODO: Subscribirse 
}

deinit() { 
//TODO: Desubscribirse
}

}

```
>Clase DetallesUbicacionMarcadaViewModel
```swift
class UbicacionMarcadaViewModel { 
// TODO: cargar todas las ubicaciones
// Publicadores
// Suscriptores

init() {  
//TODO: Subscribirse 
}

deinit() { 
//TODO: Desubscribirse
}

}

```
# Ubicapp Views

>Clase MapaViewController

>Clase DetallesMarcadorViewController

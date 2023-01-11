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
}
```
> Usuario
```swift
struct UsuarioEntity {
let id: Int
let nombre: String
}
```
> UbicacionMarcada
```swift
struct UbicacionMarcadaEntity {
let id: Int
let nombre: String
let image: Binary Data
}
```

```swift
class UbicacionMarcadaModel { 
/// TODO: 1.- Creación del singleton para el acceso global
///       2.- Instanciar a el Contenedor Persistente
///       3.- Creación del singleton para el acceso global
///       4.- Creación de la función para cargar la(s) ubicación(es) marcada(s).
///       5.- Creación de la función para añadir una nueva marca.
///       6.- Creación de la función para mandar una ubicación seleccionada.
          
     func cargarUbicacionesMarcadas() { 
      /// TODO:
      }
      
      func añadirMarcadorUbicacion(latitud: Double, longitud: Double, nombre: String) { 
      /// TODO:
      }
      
      func ubicacionSeleccionada(id: Int) { 
      ///TODO:
      
      }
}
```

```swift
class UbicacionPersonaModel { 
/// TODO: 1.- Creación del singleton para el acceso global
///       2.- Instanciar a el Contenedor Persistente
///       3.- Creacón del singleton para el acceso Global
///       4.- Creación de la función para cargar la ubicación de la persona

      func cargarUbicacionPersona() { 
      /// TODO:
      }

}
```


# Ubicapp ViewModels
>Clase UbicacionPersonaViewModel
```swift
class UbicacionPersonaViewModel { 
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
>Clase UbicacionMarcadaViewModel
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


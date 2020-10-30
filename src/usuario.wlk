import localidad.*
import medioDeTransporte.*
import viaje.*
import destinos.*
import barrileteCosmico.*

class Usuario{
	
	var historial 
	var listaUsuarios 
	var dineroEnCuenta 
	var localidadDeOrigen
	var perfil
	
	method historial() = historial
		
	method dineroEnCuenta() = dineroEnCuenta
	
	method localidadDeOrigen() = localidadDeOrigen
	
	method perfil() = perfil
	
	method kilometrosRecorridos() {
		return historial.sum({unViaje => unViaje.distanciaEntreLocalidades()})
	}
		
	method seguirA(unUsuario) {
		self.agregarSeguido(unUsuario)
		unUsuario.agregarSeguido(self)
	}
	
	method agregarSeguido(unUsuario) {
		listaUsuarios.add(unUsuario)
	}
	
	method viajar(unViaje){
		if (self.puedeViajar(unViaje)){
			historial.add(unViaje)
			dineroEnCuenta -= unViaje.precioDelViaje()
			localidadDeOrigen = unViaje.destino()
		}
	}
	
	method transporteElegido(destino){
		var transportesCosteables = barrileteCosmico.transportes().filter({transporte => transporte.costeAlDestino(localidadDeOrigen,destino) < dineroEnCuenta})
		return perfil.transporteElegido(transportesCosteables)
	}
	
	method puedeViajar(unViaje) {
		return dineroEnCuenta > unViaje.precioDelViaje()
	}
	
	method cambiarPerfil(nuevoPerfil){
		perfil = nuevoPerfil
	}
}


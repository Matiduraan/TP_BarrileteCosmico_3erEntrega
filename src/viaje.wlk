import localidad.*
import medioDeTransporte.*
import destinos.*

class Viaje {

	var origen
	var destino
	var transporte
	
	method destino() = destino
	
	method precioDelViaje(){
		const kilometrosARecorrer = origen.distanciaAOtraLocalidad(destino)
		const precioPorKilometros = (transporte.precioPorKilometro())*kilometrosARecorrer
		return precioPorKilometros + (destino.precio())
	}
	
	method distanciaEntreLocalidades() {
		return origen.distanciaAOtraLocalidad(destino)
	}

}

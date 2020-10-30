import destinos.*
import viaje.*
import usuarios.*

object barrileteCosmico {
	
	var destinos = #{garlic,goodAirs,silver,toninas}
	var transportes = #{}
	
	method transportes() = transportes
	
	method destinosMasImportantes() {
		return destinos.filter({unDestino => unDestino.esDestacado()})
	}
	
	method aplicarlesDescuento(unDescuento) {
		destinos.forEach({unDestino => unDestino.aplicarDescuento((unDestino.precio())*unDescuento)})
	}
	
	method esExtrema() {
		return destinos.any({unDestino => unDestino.esPeligroso()})
	}
	
	method destinosPeligrosos() {
		return destinos.filter({unDestino => unDestino.esPeligroso()})
	}
	
	method cartaDeDestinos() {
		return destinos.map({unDestino => unDestino.nombre()})
	}
	
	method armarViaje(unUsuario,unDestino){
		const unViaje = new Viaje(origen = unUsuario.localidadDeOrigen(), destino = unDestino, transporte = unUsuario.transporteElegido(unDestino))
	}
	
	method transporteRandom(){
		return transportes.anyOne()
	}
	
	method transporteMasVeloz(){
		return transportes.max({transporte => transporte.velocidad()})
	}
	
}
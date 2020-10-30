class MedioDeTransporte {
	var velocidad
	const precioPorKilometro
	
	method precioPorKilometro()
	
	method velocidad() = velocidad
	
	method tardanza(unOrigen,unDestino){
		return velocidad * unOrigen.distanciaAOtraLocalidad(unDestino)
	}
	
		method costeAlDestino(origen,destino){
		return self.precioPorKilometro() * origen.distanciaAOtraLocalidad(destino)
	}
	
}


class Avion inherits MedioDeTransporte{
	var turbinas
	
	method tardanza(unOrigen,unDestino){
		return velocidad * unOrigen.distanciaAOtraLocalidad(unDestino)
	}
	
	override method precioPorKilometro(){
		return turbinas.sum({turbina => turbina.impulso()})
	}
	
	method costeAlDestino(origen,destino){
		return self.precioPorKilometro() * origen.distanciaAOtraLocalidad(destino)
	}
}

class micro inherits MedioDeTransporte{
	
	override method precioPorKilometro() = 5000
	
	method tardanza(unOrigen,unDestino){
		return velocidad * unOrigen.distanciaAOtraLocalidad(unDestino)
	}
	
	method costeAlDestino(origen,destino){
		return self.precioPorKilometro() * origen.distanciaAOtraLocalidad(destino)
	}
	
}

class tren inherits MedioDeTransporte{
	
	method tardanza(unOrigen,unDestino){
		return velocidad * unOrigen.distanciaAOtraLocalidad(unDestino)
	}
	
	override method precioPorKilometro() = 2300*1.609
	
	method costeAlDestino(origen,destino){
		return self.precioPorKilometro() * origen.distanciaAOtraLocalidad(destino)
	}
}

class barco inherits MedioDeTransporte{
	var probabilidadDeChoque
	
	method tardanza(unOrigen,unDestino){
		return velocidad * unOrigen.distanciaAOtraLocalidad(unDestino)
	}
	
	override method precioPorKilometro() = 1000 * probabilidadDeChoque
	
	method costeAlDestino(origen,destino){
		return self.precioPorKilometro() * origen.distanciaAOtraLocalidad(destino)
	}
}
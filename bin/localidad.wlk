class Localidad{
	const nombre 
	const equipajeImprescindible 
	var precio 
	const kilometraje
		
	method nombre() = nombre
	
	method precio() = precio
	
	method esDestacado() = precio > 2000
	
	method cantidadDeElementos() {
		return equipajeImprescindible.size()
	}
	
	method ultimoElementoDelEquipaje() {
		return equipajeImprescindible.last()
	}
	
	method aplicarDescuento(unValor) {
		equipajeImprescindible.add("certificado de descuento")
		precio -= unValor
	}
	
	method esPeligroso(){
		return self.tieneEnElEquipaje("vacuna")
	}
	
	method tieneEnElEquipaje(unElemento) {
		return equipajeImprescindible.any({elemento=>elemento.contains(unElemento)})
	}	
	
	method kilometraje(){
		return kilometraje
	}
	
	method distanciaAOtraLocalidad(otraLocalidad){
		return (otraLocalidad.kilometraje() - kilometraje).abs()
	}
}


class Playa inherits Localidad{
	override method esPeligroso(){
		return false
	}
}

class Montania inherits Localidad{
	const altura
	
	override method esPeligroso(){
		return super() && altura > 5000
	}
	
	override method esDestacado() = true
}

class CiudadHistorica inherits Localidad{
	
	const museos
	
	override method esPeligroso(){
		return !super().tieneEnElEquipaje("Seguro de asistencia al viajero")
	}
	
	override method esDestacado(){
		return super() && museos >= 3	
	}
	
}

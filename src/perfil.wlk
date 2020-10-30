import usuario.*
import barrileteCosmico.*

object empresarial{
	method transporteElegido(transportesCosteables){
		return barrileteCosmico.transporteMasVeloz()
	}

}

object estudiantil {
	method transporteElegido(transportesCosteables){
		return transportesCosteables.max({transporte => transporte.velocidad()})
	}
}

object grupoFamiliar{
	method transporteElegido(transportesCosteables){
		return barrileteCosmico.transporteRandom()
	}
}

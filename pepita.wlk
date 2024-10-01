// pepita.wlk
import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.origin()


	method image() {
		return if (self.estaEnElNido()) {
			"pepita-grande.png"
			}else if (self.esAtrapada() or self.estaCansada()) {
			"pepita-gris.png"
		 	} else "pepita.png"
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		if(not self.estaCansada()){
		self.vola(position.distance(nuevaPosicion))
		position = nuevaPosicion
	}
	   if(self.estaCansada()){
		game.say(self, "No doy mas amigo!")
		game.stop()
	   }
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return position == nido.position()
	}
	
	
	method estaEnElSuelo() {
		return position.y() == 0 
	}

	method esAtrapada() = self.position() == silvestre.position() 
	
	method dentroDeLimite(nuevaPosicion) {
		return nuevaPosicion.x().between(0, 9) and nuevaPosicion.y().between(0, 9)
	  }

	method caer() {
		if (position.y() > 0){
			position = position.down(1)
		}
	}
    
}




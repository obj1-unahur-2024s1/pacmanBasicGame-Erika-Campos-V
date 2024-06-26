import wollok.game.*

object pacman {
	var property position = game.origin()
	var property image = "pacman.png"
	var vidas = 3

	method juegoTerminado() = vidas == 0
	
	method resetPosition() {
		position = game.origin()
	}
	
	method chocarCon(rival) {
		// sin dudas perdí una vida
		vidas = vidas - 1
		// reset de las posiciones
		self.resetPosition()
		rival.resetPosition()
		// agregamos la validación del juego terminado en pacman
		if (self.juegoTerminado()) {
			game.stop()
		}
	}
}
	
	
	
class Rival {
	const numero = 1
	var property position = game.at(3, 3)
	var previousPosition= position
	method image() = "rival" + numero.toString() + ".png"

	method acercarseA(personaje) {
		var otroPosicion = personaje.position()
		var newX = position.x() + if (otroPosicion.x() > position.x()) 1 else -1
		var newY = position.y() + if (otroPosicion.y() > position.y()) 1 else -1
		// evitamos que se posicionen fuera del tablero
		newX = newX.max(0).min(game.width() - 1)
		newY = newY.max(0).min(game.height() - 1)
		previousPosition = position
		position = game.at(newX, newY)
	}
	
	method chocarCon(otro) {
		self.resetPosition()
	}
	
	method resetPosition() {
		position = previousPosition 
	}
}



class Cereza{
	var property position = game.at(0,8)
	method image() = "cherry.png"
}






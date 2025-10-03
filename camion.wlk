import cosas.*
object camion {
    const cosasCargadas = []
    var peso = 1000
    method peso() = peso 
    method carga() = cosasCargadas

    method cargarCosa(unaCosa){
        peso = peso + unaCosa.peso()
        cosasCargadas.add(unaCosa)
    }
    method descargarCosa(unaCosa){
        peso = peso - unaCosa.peso()
        cosasCargadas.remove(unaCosa)
    }
    method losPesosSonPares(){
        return cosasCargadas.all({c => c.peso().even()})
    }
    method algoPesa(unPeso){
        return cosasCargadas.any({c => c.peso() == unPeso})
    }
    method primeraCosaConPeligro(nivel){
        return cosasCargadas.findOrDefault({c => c.nivelDePeligrosidad() == nivel}, null)
    }
    method cosasConPeligroMayorA(nivel){
        return cosasCargadas.filter({c => c.nivelDePeligrosidad() > nivel})
    }
    method cosasMasPeligrosasQue(unaCosa){
        return cosasCargadas.filter({c => c.nivelDePeligrosidad() > unaCosa.nivelDePeligrosidad()})
    }
    method elPesoEstaExcedido(){
        return self.peso() > 2500
    }
    method puedeCircularEnRuta(unNivel){
        return not self.elPesoEstaExcedido() && not cosasCargadas.any({c => c.nivelDePeligrosidad() > unNivel})
    }
    method hayAlgoQuePeseEntre(valorMin, valorMax){
        return cosasCargadas.any({c => c.peso() > valorMin && c.peso() < valorMax })
    }
    method cosaMasPesada(){
        return cosasCargadas.max({c => c.peso()})
    }
}

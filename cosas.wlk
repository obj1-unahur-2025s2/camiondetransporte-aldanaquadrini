object knightRider {
    method peso() = 500
    method nivelDePeligrosidad() = 10
    method bulto() = 1
}

object bumblebee {
  var esUnAuto = true
  method transformarEnRobot(){
    esUnAuto = false
  }
   method transformarEnAuto(){
    esUnAuto = true
  }
  method peso() = 800
  method nivelDePeligrosidad(){ // = if(esUnAuto) 15 else 30
    if(esUnAuto){
        return 15
    }else{
       return 30
    }
  }
  method bulto() = 2
}

object paquete {
  var cantidadDeLadrillos = 0
  method cambiarCantidad(cantidad){
    cantidadDeLadrillos = cantidad
  }
  method cantidadDeLadrillos() = cantidadDeLadrillos
  method peso() = cantidadDeLadrillos * 2
  method nivelDePeligrosidad() = 2
  method bulto(){
    if(self.cantidadDeLadrillos() <= 100){
      return 1
    }else if(self.cantidadDeLadrillos().between(101, 300)){
      return 2
    } else{
      return 3
    }
  }
}

object arena {
  var peso = 5
  method cambiarPeso(unPeso){
    peso = unPeso
  }
  method peso() = peso
  method nivelDePeligrosidad() = 1
  method bulto() = 1
}

object bateria {
  var estaConMisiles = true
  method sacarMisiles(){
    estaConMisiles = false
  }
  method ponerMisiles(){
    estaConMisiles = true
  }
  method peso(){ // if (estaConMisiles) 300 else 200
    if(estaConMisiles){
        return 300
    }else{
        return 200
    }
  }
  method nivelDePeligrosidad(){ // {return if (estaConMisiles) 100 else 0}
    if(estaConMisiles){
        return 100
    } else{
        return 0
    }
  }
  method bulto(){
    if(estaConMisiles){
      return 2
    }else{
      return 1
    }
  }
}

object contenedor {
  const carga = []
  // var peso = 0
  method cargarCosa(unaCosa){
        //peso = peso + unaCosa.peso()
        carga.add(unaCosa)
    }
    method descargarCosa(unaCosa){
        //peso = peso - unaCosa.peso()
        carga.remove(unaCosa)
    }
   method peso() = 100 + carga.sum({c => c.peso()}) // carga.sum()
   method nivelDePeligrosidad(){
    if(carga.isEmpty()){
        return 0
   }else{
        return carga.map({c => c.nivelDePeligrosidad()}).max() // carga.max({c=>c.nivelDePeligrosidad()}).nivelDePeligrosidad()
    }
   }
   method bulto(){
    return 1 + carga.sum({c => c.bulto()})
   }
}

object residuos {
  var peso = 20
  method peso() = peso
  method cambiarPeso(unPeso){
    peso = unPeso
  }
  method nivelDePeligrosidad() = 200
  method bulto() = 1
}

object embalaje {
  var cosaQueEnvuelve = objetoVacio
  method envolver(unaCosa){
    cosaQueEnvuelve = unaCosa
  }
  method cosaQueEnvuelve() = cosaQueEnvuelve
  method peso() = self.cosaQueEnvuelve().peso()
  method nivelDePeligrosidad() = self.cosaQueEnvuelve().nivelDePeligrosidad() / 2
  method bulto() = 2
}

object objetoVacio {
  method peso() = 0
  method nivelDePeligrosidad() = 0
}
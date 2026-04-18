object caperucita {
    const contenedor = canasta
    method pesoCaperucita() = 60

    method cantidadDeFrutasRecolectadas() = contenedor.cantidad()

    method pierdeFruta(unidades) {
        contenedor.sacar(unidades)
    }
    method recogeFruta(unidades) {
        contenedor.poner(unidades)
    }
    method peso() = self.pesoCaperucita() + contenedor.peso()
}

object manzana {
    method peso() = 0.2
}

object canasta {
    var cantidad = 6
    method cantidad() = cantidad
    const fruta = manzana
    method poner(unidades) {
        cantidad += unidades
    }
    method sacar(unidades) {
        cantidad = (cantidad - unidades).max(0)
    }
    method peso() = cantidad * fruta.peso()
}
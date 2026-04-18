object feroz {
    const pesoInicial = 10
    const pesoMinSaludable = 20
    const pesoMaxSaludable = 150
    // factorDigestion: porcentaje del peso del alimento que se convierte en aumento de peso
    // Ejemplo: al comer algo de 20 unidades, aumenta 20 * 0.1 = 2 unidades
    const factorDigestion = 0.1
    
    // pesoPerdidoAlCorrer: cantidad de peso que pierde Feroz cada vez que corre
    // Independientemente de la distancia, siempre pierde esta cantidad fija
    const pesoPerdidoAlCorrer = 1
    var peso = pesoInicial
    
    method peso() = peso
    method comer(presa) {
        peso += presa.peso() * factorDigestion
    }
    method estaSaludable() = peso.between(pesoMinSaludable, pesoMaxSaludable)
    method correr() {
        peso = (peso - pesoPerdidoAlCorrer).max(0)
    }
    method sufreCrisis() {
        peso = pesoInicial
    }
}
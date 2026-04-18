import src.feroz.*
import src.caperucita.*
import src.abuelita.*
import src.cazador.*

object historia {  
    // Historia completa hasta antes del cazador
    method historiaCompleta() {
        // Acto 1: Feroz corre al bosque
        feroz.correr()
        // Acto 2: Se encuentra con Caperucita en el bosque
        // Acto 3: Feroz corre a casa de la abuelita
        feroz.correr()
        // Acto 4: Feroz come a la abuelita
        feroz.comer(abuelita)
        // Acto 5: Feroz se disfraza de abuelita
        // Acto 6: Caperucita cruza el bosque y pierde una manzana
        caperucita.pierdeFruta(1)
        // Acto 7: Feroz llega a Caperucita y la come con canasta llena
        feroz.comer(caperucita)
    }

    // FINAL 1: Feroz come al cazador
    method finalFerozComeCazador() {
        self.historiaCompleta()
        // Acto 8: Llega el cazador y Feroz se lo come de un bocado
        feroz.comer(cazador)
    }
    
    // FINAL 2: Cazador vence (Feroz corre para escapar)
    method finalCazadorVence() {
        self.historiaCompleta()
        // Acto 8: Llega el cazador y Feroz huye corriendo
        // Nota: Las 3 invocaciones a correr() también se podrían hacer con:
        // (1..3).forEach({ i => feroz.correr() })
        feroz.correr()
        feroz.correr()
        feroz.correr()
    }
    
    // FINAL 3: Cazador hace que Feroz sufra una crisis
    method finalFerozSufreCrisis() {
        self.historiaCompleta()
        // Acto 8: Llega el cazador y Feroz sufre una crisis
        feroz.sufreCrisis()
    }

    // FINAL 4: Cazador huye
    method finalCazadorHuye() {
        self.historiaCompleta()
        // Acto 8: Llega el cazador ve que esta Feroz y huye
        cazador.huir()
    }

    method verificarSaludFeroz() = feroz.estaSaludable()
    
    method pesoFinalFeroz() = feroz.peso()
}

# Arquitectura del Sistema

## Visión General

El proyecto "El Lobo Feroz" es un sistema orientado a objetos que modela la simulación de la historia clásica del Lobo Feroz. El sistema está diseñado siguiendo principios de programación orientada a objetos y el paradigma de Wollok.

## Diagrama de Componentes

```
┌────────────────────────────────────────────────┐
│              PERSONAJES PRINCIPALES            │
│  ┌──────────────┐  ┌──────────────┐            │
│  │    Feroz     │  │  Caperucita  │  Abuelita  │
│  │   (Lobo)     │  │   (Niña)     │  (Anciana) │
│  └──────────────┘  └──────────────┘            │
│       │                   │                    │
│       ├─ peso             ├─ peso              │
│       ├─ salud            ├─ cantManzanas      │
│       └─ métodos          └─ peso()            │
└────────────────────────────────────────────────┘
                         │
                         │ interactúan
                         ▼
┌────────────────────────────────────────────────┐
│                   CAZADOR                      │
│  ┌──────────────────────────────────────────┐  │
│  │ Personaje creativo con mecánicas propias │  │
│  │ - Puede provocar crisis                  │  │
│  │ - Puede ser comido                       │  │
│  │ - Puede disparar                         │  │
│  └──────────────────────────────────────────┘  │
└────────────────────────────────────────────────┘
                         │
                         │ genera
                         ▼
┌────────────────────────────────────────────────┐
│              DIFERENTES FINALES                │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐      │
│  │ Final 1  │  │ Final 2  │  │ Final 3  │      │
│  │ Come al  │  │ Crisis   │  │ Escapa   │      │
│  │ cazador  │  │ provocada│  │ corriendo│      │
│  └──────────┘  └──────────┘  └──────────┘      │
└────────────────────────────────────────────────┘
```

## Módulos del Sistema

### 1. Feroz (`feroz.wlk`)

**Responsabilidad:** Modelar el Lobo Feroz con su sistema de peso y salud.

**Propiedades:**
- `pesoInicial = 10` - Peso inicial (no saludable)
- `pesoMinSaludable = 20` - Peso mínimo para estar saludable
- `pesoMaxSaludable = 150` - Peso máximo para estar saludable
- `factorDigestion = 0.1` - Porcentaje del peso ingerido que se convierte en aumento
- `pesoPerdidoAlCorrer = 1` - Peso perdido al correr
- `peso` - Peso actual (variable)

**Métodos:**
- `peso()` - Retorna el peso actual
- `comer(presa)` - Feroz come una presa (aumenta 10% del peso total de la presa)
- `correr()` - Feroz corre (pierde 1 unidad de peso)
- `estaSaludable()` - Verifica si el peso está entre 20 y 150
- `sufreCrisis()` - Feroz vuelve a su peso inicial

### 2. Caperucita (`caperucita.wlk`)

**Responsabilidad:** Modelar a Caperucita Roja con su canasta de manzanas.

**Objetos:**
- `caperucita` - La niña
  - `peso = 60` - Peso base
  - `cantidadDeFrutasRecolectadas()` - Retorna cantidad de manzanas en la canasta
  - `peso()` - Peso con manzanas incluidas
  - `pierdeFruta(unidades)` - Pierde manzanas de la canasta
  - `recogeFruta(unidades)` - Agrega manzanas a la canasta

- `manzana` - Objeto consumible
  - `peso = 0.2` - Peso unitario

- `canasta` - Contenedor de manzanas
  - `cantidad()` - Retorna cantidad de manzanas
  - `poner(unidades)` - Agrega manzanas
  - `sacar(unidades)` - Saca manzanas (no puede ser negativo)
  - `peso()` - Retorna peso total de manzanas

### 3. Abuelita (`abuelita.wlk`)

**Responsabilidad:** Modelar a la Abuelita.

**Propiedades:**
- `peso = 50` - Peso fijo
- `peso()` - Retorna el peso (sin cambios)

### 4. Cazador (`cazador.wlk`)

**Responsabilidad:** Modelar al Cazador con mecánicas creativas.

**Propiedades:**
- `peso = 100` - Peso del cazador
- `peso()` - Retorna el peso

**Mecánicas:**
- Puede ser comido por Feroz
- Puede provocar una crisis en Feroz
- Puede disparar causando que Feroz escape corriendo

### 5. Historia (`historia.wlk`)

**Responsabilidad:** Orquestar diferentes versiones de la historia del Lobo Feroz.

**Métodos:**
- `historiaCompleta()` - Ejecuta la historia hasta antes del cazador
- `finalFerozComeCazador()` - Final 1: Feroz come al cazador
- `finalCazadorVence()` - Final 2: Cazador dispara y Feroz escapa corriendo
- `finalFerozSufreCrisis()` - Final 3: Cazador provoca una crisis en Feroz
- `finalCazadorHuye()` - Final 4: Cazador ve a Feroz y huye
- `verificarSaludFeroz()` - Retorna si Feroz está saludable
- `pesoFinalFeroz()` - Retorna el peso final de Feroz

**Finales Disponibles:**

**Final 1: Feroz come al cazador**
- Feroz come a todos: abuelita, Caperucita (con manzanas) y cazador
- Evalúa el estado final de salud
- Peso esperado: 29.1 (saludable)

**Final 2: Cazador vence (Feroz escapa corriendo)**
- Feroz come a abuelita y Caperucita
- El cazador dispara
- Feroz corre 3 veces para escapar
- Evalúa el estado final de salud
- Peso esperado: 16.1 (no saludable)

**Final 3: Cazador provoca crisis**
- Feroz come a abuelita y Caperucita
- El cazador provoca una crisis en Feroz
- Feroz vuelve a su peso inicial
- Peso esperado: 10 (no saludable)

**Final 4: Cazador huye**
- Feroz come a abuelita y Caperucita
- El cazador ve que está Feroz y huye
- Peso esperado: 19.1 (no saludable)

## Patrones de Diseño

### 1. Singleton Pattern
Todos los personajes son objetos singleton (no hay múltiples instancias):
- `feroz`, `caperucita`, `abuelita`, `cazador`

### 2. Composition
- Caperucita compone manzanas
- Los programas componen personajes

### 3. Polymorphism
Todos los objetos consumibles responden a la interfaz:
- `peso()` - Peso total (incluyendo lo que llevan)

## Decisiones de Diseño

### ¿Por qué usar un objeto `historia` en lugar de programs?

**Razón:** 
- **Reutilización**: `historiaCompleta()` se reutiliza en todos los finales
- **Testabilidad**: Más fácil de testear que programs separados
- **Composición**: Los finales se pueden combinar y extender
- **Organización**: Todo relacionado con la historia en un solo lugar

### ¿Por qué el cazador es un objeto simple?

**Razón:** El cazador es un personaje secundario cuya mecánica se define en los programas finales, no en el objeto mismo. Esto permite flexibilidad para diferentes finales.

## Extensibilidad

El sistema está diseñado para ser fácilmente extensible:

### Agregar nuevos personajes
```wollok
object cazador2 {
    method peso() = 120
}
```

### Agregar nuevos finales
```wollok
// En historia.wlk
method finalAlternativo() {
    self.historiaCompleta()
    // Nueva versión del desenlace
    feroz.correr()
    feroz.correr()
    // ... más eventos
}
```

### Modificar mecánicas de Feroz
```wollok
// Cambiar factor de digestión
const factorDigestion = 0.15  // 15% en lugar de 10%

// Cambiar peso perdido al correr
const pesoPerdidoAlCorrer = 2  // 2 unidades en lugar de 1
```

## Flujo de Interacción Típico

1. **Ejecutar un final completo:**
   ```wollok
   historia.finalFerozComeCazador()
   ```

2. **Verificar estado:**
   ```wollok
   feroz.estaSaludable()
   console.println("Peso: " + feroz.peso())
   ```

3. **Experimentar con personajes:**
   ```wollok
   feroz.sufreCrisis()
   feroz.comer(abuelita)
   feroz.correr()
   ```

## Consideraciones de Testing

Cada módulo tiene su propia suite de tests:
- `feroz.wtest` - Tests del Lobo Feroz
- `caperucita.wtest` - Tests de Caperucita
- `abuelita.wtest` - Tests de la Abuelita
- `cazador.wtest` - Tests del Cazador
- `historia.wtest` - Tests de Historia

**Cobertura Total: 100%** (todos los métodos públicos cubiertos)

Ver [testing.md](testing.md) para más detalles sobre estrategias de testing.

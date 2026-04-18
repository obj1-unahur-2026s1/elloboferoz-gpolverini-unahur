# Guía de Testing

## Estrategia de Testing

El proyecto utiliza el framework de testing de Wollok para garantizar la correctitud del código. Los tests están organizados por módulo y cubren tanto casos normales como casos límite.

## Estructura de Tests

```
tests/
├── feroz.wtest        # Tests unitarios del Lobo Feroz (11 tests)
├── caperucita.wtest   # Tests unitarios de Caperucita (10 tests)
├── abuelita.wtest     # Tests unitarios de la Abuelita (2 tests)
├── cazador.wtest      # Tests unitarios del Cazador (3 tests)
└── historia.wtest     # Tests unitarios de Historia (12 tests)

Total: 38 tests
```

## Ejecutar Tests

### Todos los tests
```bash
# Desde VS Code: Abre la paleta de comandos
# Ctrl+Shift+P (Windows/Linux) o Cmd+Shift+P (Mac)
# Busca: "Wollok: Run All Tests"

# O desde la terminal con Wollok CLI (si está instalado):
wollok test
```

### Test individual
```bash
# Desde VS Code: 
# - Abre el archivo .wtest
# - Click en el ícono "Run Test" que aparece sobre cada test
# - O click derecho en el archivo → "Run Wollok File"

# Desde la terminal:
wollok test tests/feroz.wtest
```

## Cobertura de Tests

### 1. Tests de Feroz (`feroz.wtest`)

**Objetivo:** Verificar que el Lobo Feroz gestiona correctamente su peso y salud.

**Casos de prueba:**

#### Estado Inicial
- ✓ Feroz inicia con peso 10
- ✓ Feroz no está saludable inicialmente

#### Salud
- ✓ Está saludable con peso entre 20 y 150
- ✓ No está saludable con peso < 20
- ✓ No está saludable con peso > 150

#### Correr
- ✓ Al correr pierde 1 unidad de peso
- ✓ El peso no puede ser negativo

#### Comer
- ✓ Al comer aumenta el 10% del peso de la presa
- ✓ Funciona con diferentes pesos

#### Crisis
- ✓ Al sufrir crisis vuelve a peso inicial

### 2. Tests de Caperucita (`caperucita.wtest`)

**Objetivo:** Verificar que Caperucita gestiona correctamente su peso y manzanas.

**Casos de prueba:**

#### Peso Base
- ✓ Caperucita pesa 60 unidades (método `pesoCaperucita()`)

#### Manzanas
- ✓ Inicia con 6 manzanas
- ✓ Cada manzana pesa 0.2

#### Peso Total
- ✓ El peso total incluye manzanas
- ✓ Con 0 manzanas pesa 60

#### Pérdida de Manzanas
- ✓ Puede perder manzanas
- ✓ No puede tener manzanas negativas

#### Recoger Frutas
- ✓ Puede recoger manzanas
- ✓ Aumenta la cantidad de manzanas

### 3. Tests de Abuelita (`abuelita.wtest`)

**Objetivo:** Verificar que la Abuelita tiene las propiedades correctas.

**Casos de prueba:**
- ✓ Abuelita pesa 50 unidades
- ✓ El peso total es igual a su peso

**Ejemplo (Formato BDD Gherkin-like):**
```wollok
describe "Abuelita | Verificar peso" {
    test "Given: Abuelita | When: consultamos peso() | Then: debería retornar 50" {
        assert.equals(50, abuelita.peso())
    }
}
```

### 4. Tests de Cazador (`cazador.wtest`)

**Objetivo:** Verificar que el Cazador tiene las propiedades correctas.

**Casos de prueba:**
- ✓ Cazador pesa 100 unidades
- ✓ Método huir() no lanza error

**Ejemplo (Formato BDD Gherkin-like):**
```wollok
describe "Cazador | Verificar peso" {
    test "Given: Cazador | When: consultamos peso() | Then: debería retornar 100" {
        assert.equals(100, cazador.peso())
    }
}

describe "Cazador | Verificar método huir" {
    test "Given: Cazador | When: ejecutamos huir() | Then: no debería lanzar error" {
        cazador.huir()
        assert.that(true)
    }
}
```

### 5. Tests de Historia (`historia.wtest`)

**Objetivo:** Verificar que las diferentes historias se ejecutan correctamente.

**Casos de prueba:**

#### Historia Completa
- ✓ Feroz corre 2 veces
- ✓ Feroz come a abuelita
- ✓ Feroz come a caperucita
- ✓ Caperucita pierde 1 manzana

#### Finales
- ✓ Final 1: Feroz come al cazador (saludable)
- ✓ Final 2: Cazador vence (Feroz escapa corriendo)
- ✓ Final 3: Cazador provoca crisis
- ✓ Final 4: Cazador huye

## Buenas Prácticas de Testing

### 1. Formato BDD Gherkin-like
Los tests deben seguir la estructura Given-When-Then para mayor claridad:

```wollok
describe "Componente | Contexto o funcionalidad" {
    test "Given: estado inicial | When: acción | Then: resultado esperado" {
        // Arrange (preparar estado)
        // Act (realizar acción)
        // Assert (verificar resultado)
        assert.that(condicion)
    }
}
```

**Ventajas:**
- Legible como especificación
- Comunica claramente qué se prueba
- Sirve como documentación viva
- Estándar en la industria

### 2. Nombres Descriptivos
Los nombres de los tests deben describir claramente qué se está probando:

✓ **Bueno:**
```wollok
test "Given: Feroz con peso 50 | When: consultamos estaSaludable() | Then: debería retornar true" {
    assert.that(feroz.estaSaludable())
}
```

✗ **Malo:**
```wollok
test "test1" {
    assert.that(feroz.estaSaludable())
}
```

### 3. Arrange-Act-Assert (AAA)
Organiza tus tests en tres secciones:

```wollok
test "Given: Feroz | When: come a abuelita | Then: peso debería aumentar" {
    // Arrange (preparar)
    feroz.sufreCrisis()
    
    // Act (actuar)
    feroz.comer(abuelita)
    
    // Assert (verificar)
    assert.equals(15, feroz.peso())
}
```

### 4. Tests Independientes
Cada test debe ser independiente y no depender del orden de ejecución:

✓ **Bueno:** Cada test configura su propio estado
✗ **Malo:** Un test depende del estado dejado por otro test

### 5. Casos Límite
Siempre prueba casos límite:

```wollok
test "Given: Feroz con peso 0 | When: corre() | Then: peso no debería ser negativo" {
    feroz.sufreCrisis()
    feroz.correr()
    feroz.correr()
    assert.equals(0, feroz.peso())
}

test "Given: Caperucita con 2 manzanas | When: pierde 5 manzanas | Then: no debería tener negativas" {
    caperucita.pierdeFruta(4)  // Ahora tiene 2
    caperucita.pierdeFruta(5)  // Intenta perder 5
    assert.equals(0, caperucita.cantidadDeFrutasRecolectadas())
}
```

## Cobertura de Código

### Nota sobre Herramientas de Cobertura
**VS Code con la extensión de Wollok actualmente no incluye una herramienta automática de análisis de cobertura de código.** La cobertura debe evaluarse manualmente revisando:
- Qué métodos son llamados por los tests
- Qué ramas condicionales se ejecutan
- Qué casos límite están cubiertos

### Análisis Manual de Cobertura

Para este proyecto, la cobertura puede verificarse revisando:

1. **Feroz** (`feroz.wlk`):
   - ✓ Todos los métodos tienen tests
   - ✓ Casos límite de peso están cubiertos
   - ✓ Cobertura: 100%

2. **Caperucita** (`caperucita.wlk`):
   - ✓ Peso base y total están testeados
   - ✓ Pérdida de manzanas está cubierta
   - ✓ Recoger manzanas está cubierto
   - ✓ Casos límite (manzanas negativas) están cubiertos
   - ✓ Cobertura: 100%

3. **Abuelita** (`abuelita.wlk`):
   - ✓ Peso está testeado
   - ✓ Cobertura: 100%

4. **Cazador** (`cazador.wlk`):
   - ✓ Peso está testeado
   - ✓ Método huir está testeado
   - ✓ Cobertura: 100%

5. **Historia** (`historia.wlk`):
   - ✓ Todos los finales están testeados
   - ✓ Métodos de consulta están testeados
   - ✓ Cobertura: 100%

### Objetivo de Cobertura
- **Mínimo aceptable:** 80% de cobertura
- **Objetivo:** 90%+ de cobertura
- **Ideal:** 100% de cobertura en lógica de negocio
- **Estado actual del proyecto:** ~100% de cobertura

## Debugging de Tests

### Test Falla Inesperadamente

1. **Lee el mensaje de error:**
   ```
   Expected: 15
   But was: 14
   ```

2. **Verifica el estado:**
   ```wollok
   test "debug ejemplo" {
       feroz.sufreCrisis()
       feroz.comer(abuelita)
       console.println("Peso: " + feroz.peso())
       assert.equals(15, feroz.peso())
   }
   ```

3. **Simplifica el test:**
   - Reduce el test al mínimo necesario
   - Verifica una cosa a la vez

### Test Pasa Pero No Debería

- Verifica que estás usando `assert.that()` y no `assert.notThat()`
- Asegúrate de que el test realmente ejecuta la lógica esperada
- Revisa que no haya typos en los nombres de métodos

## Agregar Nuevos Tests

Cuando agregues nueva funcionalidad, sigue estos pasos:

1. **Escribe el test primero (TDD):**
   ```wollok
   test "nueva funcionalidad" {
       // Test que falla porque la funcionalidad no existe
   }
   ```

2. **Implementa la funcionalidad mínima:**
   - Haz que el test pase

3. **Refactoriza:**
   - Mejora el código manteniendo los tests en verde

4. **Agrega más tests:**
   - Casos límite
   - Casos de error
   - Diferentes escenarios

## Recursos Adicionales

- [Documentación oficial de Wollok Testing](https://www.wollok.org/documentacion/testing/)
- [Guía de TDD](https://www.wollok.org/documentacion/tdd/)
- Ver [architecture.md](architecture.md) para entender la estructura del código
- Ver [development.md](development.md) para mejores prácticas

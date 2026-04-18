# Guía para Desarrolladores

## Introducción

Esta guía está diseñada para ayudar a desarrolladores que quieran contribuir o extender el proyecto "El Lobo Feroz". Aquí encontrarás información sobre el flujo de trabajo, convenciones de código y mejores prácticas.

## Configuración del Entorno de Desarrollo

### Requisitos
- Visual Studio Code con extensión de Wollok
- Wollok 4.0.0+
- Git

### Configuración Inicial
```bash
# Clonar el repositorio
git clone <url-del-repositorio>
cd el-lobo-feroz

# Abrir en VS Code
code .
```

Ver [setup.md](setup.md) para instrucciones detalladas.

## Flujo de Trabajo

### 1. Antes de Empezar

1. **Actualiza tu rama local:**
   ```bash
   git checkout main
   git pull origin main
   ```

2. **Crea una nueva rama:**
   ```bash
   git checkout -b feature/nombre-descriptivo
   # o
   git checkout -b fix/nombre-del-bug
   ```

### 2. Durante el Desarrollo

1. **Escribe tests primero (TDD) con formato BDD:**
   ```wollok
   describe "Feroz | Nueva funcionalidad" {
       test "Given: estado inicial | When: acción | Then: resultado esperado" {
           // Test que falla
           assert.equals(valorEsperado, feroz.nuevoMetodo())
       }
   }
   ```

2. **Implementa la funcionalidad:**
   ```wollok
   object feroz {
       method nuevoMetodo() {
           // Implementación mínima para pasar el test
       }
   }
   ```

3. **Ejecuta los tests frecuentemente:**
   - Después de cada cambio significativo
   - Antes de hacer commit

4. **Refactoriza:**
   - Mejora el código manteniendo los tests en verde
   - Elimina duplicación
   - Mejora nombres de variables/métodos

### 3. Antes de Hacer Commit

1. **Ejecuta TODOS los tests:**
   - Desde VS Code: Ctrl+Shift+P → "Wollok: Run All Tests"

2. **Verifica que no haya errores de compilación:**
   - Revisa el panel "Problems" en VS Code (Ctrl+Shift+M)

3. **Revisa tus cambios:**
   ```bash
   git status
   git diff
   ```

### 4. Hacer Commit

```bash
# Agrega los archivos modificados
git add src/archivo.wlk tests/archivo.wtest

# Commit con mensaje descriptivo
git commit -m "Agrega nueva mecánica al Lobo Feroz

- Implementa método nuevoMetodo()
- Agrega tests para casos límite
- Fixes #123"
```

### 5. Push y Pull Request

```bash
# Push a tu rama
git push origin feature/nombre-descriptivo

# Crea un Pull Request en GitHub/GitLab
# Describe los cambios y referencia issues relacionados
```

## Convenciones de Código

### Nomenclatura

#### Objetos
```wollok
// Objetos singleton: camelCase
object feroz { }
object caperucita { }
```

#### Métodos
```wollok
// Métodos: camelCase
method comer(presa) { }
method correr() { }
method estaSaludable() { }
```

#### Variables
```wollok
// Variables: camelCase
const pesoInicial = 10
var peso = pesoInicial
```

### Estilo de Código

#### Indentación
- Usa **2 espacios** (no tabs)
- VS Code con la extensión de Wollok lo configura automáticamente

#### Llaves
```wollok
// ✓ Bueno: llave de apertura en la misma línea
method ejemplo() {
    // código
}

// ✗ Malo: llave de apertura en nueva línea
method ejemplo()
{
    // código
}
```

#### Espacios
```wollok
// ✓ Bueno: espacios alrededor de operadores
const resultado = peso + 100

// ✗ Malo: sin espacios
const resultado=peso+100

// ✓ Bueno: espacio después de comas
method metodo(param1, param2, param3)

// ✗ Malo: sin espacios
method metodo(param1,param2,param3)
```

#### Líneas en Blanco
```wollok
object feroz {
    // Una línea en blanco entre métodos
    method metodo1() {
        // código
    }
    
    method metodo2() {
        // código
    }
}
```

### Comentarios

#### Cuándo Comentar
```wollok
// ✓ Bueno: comentar lógica compleja o no obvia
// factorDigestion: porcentaje del peso del alimento que se convierte en aumento de peso
const factorDigestion = 0.1

// ✗ Malo: comentar lo obvio
method peso() {
    return peso  // retorna peso
}
```

#### Comentarios TODO
```wollok
// TODO: Implementar validación de peso negativo
// FIXME: Este método no maneja el caso de peso cero
// HACK: Solución temporal hasta refactorizar
```

## Mejores Prácticas

### 1. Principio de Responsabilidad Única
Cada objeto debe tener una sola responsabilidad:

```wollok
// ✓ Bueno: cada objeto tiene una responsabilidad clara
object feroz {
    // Responsabilidad: gestionar peso y salud del lobo
}

object caperucita {
    // Responsabilidad: gestionar Caperucita y sus manzanas
}

// ✗ Malo: objeto con múltiples responsabilidades
object personajes {
    // Gestiona feroz, caperucita, abuelita, cazador
}
```

### 2. Encapsulamiento
No expongas detalles de implementación:

```wollok
// ✓ Bueno: encapsula el cálculo
object feroz {
    var peso = pesoInicial
    
    method peso() = peso
    method comer(presa) {
        peso += presa.peso() * factorDigestion
    }
}

// ✗ Malo: expone detalles internos
object feroz {
    var peso = pesoInicial  // público, puede ser modificado
}
```

### 3. Polimorfismo
Aprovecha el polimorfismo de Wollok:

```wollok
// ✓ Bueno: todos los objetos responden a la misma interfaz
feroz.comer(abuelita)
feroz.comer(caperucita)
feroz.comer(cazador)

// ✗ Malo: usar condicionales para tipos
method comer(presa) {
    if (presa == abuelita) peso += 50 * factorDigestion
    else if (presa == caperucita) peso += caperucita.peso() * factorDigestion
    // ...
}
```

### 4. Inmutabilidad Cuando Sea Posible
```wollok
// ✓ Bueno: usa const para valores que no cambian
object abuelita {
    const peso = 50
}

// ✗ Malo: usar var innecesariamente
object abuelita {
    var peso = 50  // ¿realmente necesita cambiar?
}
```

### 5. Nombres Descriptivos
```wollok
// ✓ Bueno: nombres que expresan intención
method estaSaludable() = peso.between(pesoMinSaludable, pesoMaxSaludable)

// ✗ Malo: nombres crípticos
method check() = peso.between(20, 150)
```

## Patrones Comunes

### Pattern: Métodos de Consulta
```wollok
// Métodos que retornan información sin cambiar estado
method peso() = peso
method estaSaludable() = peso.between(pesoMinSaludable, pesoMaxSaludable)
method peso() = peso + cantManzanas * manzana.peso()
```

### Pattern: Métodos de Acción
```wollok
// Métodos que cambian el estado del objeto
method comer(presa) { peso += presa.peso() * factorDigestion }
method correr() { peso = (peso - pesoPerdidoAlCorrer).max(0) }
method sufreCrisis() { peso = pesoInicial }
```

### Pattern: Delegation
```wollok
// Delegar a componentes
object caperucita {
    method peso() = peso + cantManzanas * manzana.peso()
}
```

## Ejecutar los Finales

Para probar diferentes versiones de la historia, usa el REPL de Wollok:

1. **Abrir el REPL:**
   - Ctrl+Shift+P → "Wollok: Start REPL"
   - O click derecho en `historia.wlk` → "Start Wollok REPL"

2. **Ejecutar finales:**
   ```wollok
   >>> historia.finalFerozComeCazador()
   >>> feroz.peso()
   29.1
   >>> feroz.estaSaludable()
   true
   
   >>> feroz.sufreCrisis()  // Resetear para probar otro final
   >>> historia.finalCazadorVence()
   >>> feroz.peso()
   16.1
   ```

## Testing

### Test-Driven Development (TDD)

1. **Red:** Escribe un test que falle
2. **Green:** Implementa lo mínimo para que pase
3. **Refactor:** Mejora el código

**Formato BDD Gherkin-like:**
```wollok
// 1. RED: Test que falla
describe "Feroz | Nueva funcionalidad" {
    test "Given: estado inicial | When: acción | Then: resultado esperado" {
        assert.equals(valorEsperado, feroz.nuevoMetodo())
    }
}

// 2. GREEN: Implementación mínima
object feroz {
    method nuevoMetodo() = valorEsperado
}

// 3. REFACTOR: (si es necesario)
```

Ver [testing.md](testing.md) para más detalles.

## Debugging

### Técnicas de Debugging

#### 1. Console.println()
```wollok
method comer(presa) {
    console.println("Peso antes: " + peso)
    console.println("Peso presa: " + presa.peso())
    peso += presa.peso() * factorDigestion
    console.println("Peso después: " + peso)
}
```

#### 2. Breakpoints
- Click en el margen izquierdo del editor en VS Code
- Ejecuta en modo Debug (F5)
- Inspecciona variables en el panel de Debug

#### 3. Tests Específicos
```wollok
test "debug: verificar cálculo de peso" {
    feroz.sufreCrisis()
    feroz.comer(abuelita)
    console.println("Peso feroz: " + feroz.peso())
    console.println("Esperado: 15")
    assert.equals(15, feroz.peso())
}
```

## Errores Comunes

### 1. Olvidar el `self`
```wollok
// ✗ Malo
object feroz {
    var peso = 10
    method duplicarPeso() {
        peso = peso * 2  // Error: peso no está definido
    }
}

// ✓ Bueno
object feroz {
    var peso = 10
    method duplicarPeso() {
        peso = self.peso() * 2
    }
}
```

### 2. No Inicializar Variables
```wollok
// ✗ Malo
object caperucita {
    var cantManzanas  // Error: no inicializada
}

// ✓ Bueno
object caperucita {
    var cantManzanas = 6
}
```

### 3. No Resetear Estado Entre Tests
```wollok
// ✗ Malo: tests que dependen de estado previo
test "test 1" {
    feroz.comer(abuelita)
}
test "test 2" {
    // Asume que feroz ya comió a abuelita
    assert.equals(15, feroz.peso())
}

// ✓ Bueno: cada test configura su propio estado
test "test 1" {
    feroz.sufreCrisis()
    feroz.comer(abuelita)
    assert.equals(15, feroz.peso())
}
test "test 2" {
    feroz.sufreCrisis()
    feroz.comer(abuelita)
    assert.equals(15, feroz.peso())
}
```

## Preguntas Frecuentes

### ¿Cómo agrego un nuevo personaje?

1. Crea un nuevo archivo `src/personaje.wlk`
2. Define el objeto con `peso`
3. Agrega tests en `tests/personaje.wtest`
4. Úsalo en los finales

### ¿Cómo agrego un nuevo final?

1. Abre `src/historia.wlk`
2. Agrega un nuevo método siguiendo el patrón:
   ```wollok
   method finalNuevo() {
       self.historiaCompleta()
       // Tu desenlace personalizado
       feroz.correr()
       // ...
   }
   ```
3. Agrega tests en `tests/historia.wtest`
4. Prueba desde el REPL: `historia.finalNuevo()`

### ¿Puedo modificar el README.md?

No, el README.md contiene la especificación del ejercicio y no debe modificarse.

### ¿Dónde reporto bugs?

Crea un issue en el repositorio con:
- Descripción del bug
- Pasos para reproducir
- Comportamiento esperado vs actual
- Versión de Wollok

## Contacto

Si tienes preguntas o necesitas ayuda:
- Crea un issue con la etiqueta "question"
- Revisa la [Guía de Contribución](../CONTRIBUTING.md)
- Consulta el [Código de Conducta](../CODE_OF_CONDUCT.md)

# Guía de Uso del REPL de Wollok

## ¿Qué es el REPL?

REPL (Read-Eval-Print Loop) es una consola interactiva donde puedes ejecutar código Wollok en tiempo real. Es ideal para:
- Experimentar con objetos y métodos
- Probar código rápidamente sin escribir tests
- Depurar comportamientos
- Ejecutar los diferentes finales de la historia

## Abrir el REPL

### Método 1: Desde la Paleta de Comandos
1. Abre VS Code con el proyecto
2. Presiona `Ctrl+Shift+P` (Windows/Linux) o `Cmd+Shift+P` (Mac)
3. Busca "Wollok: Start REPL"
4. Presiona Enter

### Método 2: Desde un Archivo
1. Abre cualquier archivo `.wlk` (por ejemplo, `src/historia.wlk`)
2. Click derecho en el editor
3. Selecciona "Start Wollok REPL"

### Método 3: Desde el Explorador
1. Click derecho en cualquier archivo `.wlk` en el explorador
2. Selecciona "Start Wollok REPL"

## Ejecutar los Finales

Una vez abierto el REPL, puedes ejecutar los diferentes finales de la historia:

### Final 1: Feroz come al cazador
```wollok
>>> historia.finalFerozComeCazador()
>>> feroz.peso()
29.1
>>> feroz.estaSaludable()
true
```

**Resultado:** Feroz termina con peso 29.1 (saludable)

### Final 2: Cazador vence (Feroz escapa)
```wollok
>>> feroz.sufreCrisis()  // Resetear estado
>>> historia.finalCazadorVence()
>>> feroz.peso()
16.1
>>> feroz.estaSaludable()
false
```

**Resultado:** Feroz termina con peso 16.1 (no saludable)

### Final 3: Cazador provoca crisis
```wollok
>>> feroz.sufreCrisis()  // Resetear estado
>>> historia.finalFerozSufreCrisis()
>>> feroz.peso()
10
>>> feroz.estaSaludable()
false
```

**Resultado:** Feroz vuelve a su peso inicial 10 (no saludable)

### Final 4: Cazador huye
```wollok
>>> feroz.sufreCrisis()  // Resetear estado
>>> historia.finalCazadorHuye()
>>> feroz.peso()
19.1
>>> feroz.estaSaludable()
false
```

**Resultado:** Feroz termina con peso 19.1 (no saludable)

## Experimentar con Personajes

### Feroz
```wollok
>>> feroz.sufreCrisis()  // Resetear a peso inicial
>>> feroz.peso()
10
>>> feroz.estaSaludable()
false

>>> feroz.comer(abuelita)
>>> feroz.peso()
15.0

>>> feroz.correr()
>>> feroz.peso()
14.0

>>> feroz.comer(caperucita)
>>> feroz.peso()
20.1

>>> feroz.estaSaludable()
true
```

### Caperucita - Métodos Principales
```wollok
>>> caperucita.pesoCaperucita()  // Peso base
60

>>> caperucita.peso()  // Peso total con manzanas
61.2

>>> caperucita.cantidadDeFrutasRecolectadas()  // Cantidad de manzanas
6

>>> caperucita.pierdeFruta(1)  // Pierde manzanas
>>> caperucita.cantidadDeFrutasRecolectadas()
5

>>> caperucita.recogeFruta(2)  // Recoge manzanas
>>> caperucita.cantidadDeFrutasRecolectadas()
7

>>> caperucita.peso()  // Peso total actualizado
61.4
```

### Canasta
```wollok
>>> caperucita.contenedor.cantidad()
6

>>> caperucita.contenedor.sacar(2)
>>> caperucita.contenedor.cantidad()
4

>>> caperucita.contenedor.poner(5)
>>> caperucita.contenedor.cantidad()
9

>>> caperucita.contenedor.peso()
1.8
```

## Ejecutar la Historia Paso a Paso

Puedes ejecutar la historia completa paso a paso para ver cómo cambia el estado:

```wollok
>>> feroz.sufreCrisis()
>>> feroz.peso()
10

>>> // Acto 1: Feroz corre al bosque
>>> feroz.correr()
>>> feroz.peso()
9.0

>>> // Acto 2: Feroz corre a casa de la abuelita
>>> feroz.correr()
>>> feroz.peso()
8.0

>>> // Acto 3: Feroz come a la abuelita
>>> feroz.comer(abuelita)
>>> feroz.peso()
13.0

>>> // Acto 4: Caperucita pierde una manzana
>>> caperucita.pierdeFruta(1)
>>> caperucita.cantidadDeFrutasRecolectadas()
5

>>> // Acto 5: Feroz come a Caperucita
>>> feroz.comer(caperucita)
>>> feroz.peso()
19.1

>>> feroz.estaSaludable()
false
```

## Comandos Útiles del REPL

### Ver el valor de una expresión
```wollok
>>> feroz.peso()
19.1

>>> caperucita.pesoCaperucita()
60

>>> feroz.estaSaludable()
false
```

### Ejecutar múltiples comandos
```wollok
>>> feroz.sufreCrisis()
>>> feroz.comer(abuelita)
>>> feroz.comer(caperucita)
>>> feroz.peso()
16.1
```

### Usar variables temporales (si el REPL lo soporta)
```wollok
>>> const pesoInicial = feroz.peso()
>>> feroz.comer(abuelita)
>>> const pesoFinal = feroz.peso()
>>> pesoFinal - pesoInicial
5.0
```

## Resetear Estado Entre Experimentos

**Importante:** Los objetos mantienen su estado entre comandos. Para resetear:

```wollok
>>> feroz.sufreCrisis()  // Vuelve a peso inicial 10
>>> caperucita.contenedor.sacar(caperucita.contenedor.cantidad())  // Vacía la canasta
>>> caperucita.contenedor.poner(6)  // Vuelve a 6 manzanas
```

O simplemente **reinicia el REPL**:
- Cierra la terminal del REPL
- Vuelve a abrir con Ctrl+Shift+P → "Wollok: Start REPL"

## Consejos y Trucos

### 1. Usa el REPL para Debugging
Si un test falla, usa el REPL para reproducir el escenario:
```wollok
>>> feroz.sufreCrisis()
>>> feroz.comer(abuelita)
>>> feroz.peso()  // Verifica el valor
```

### 2. Experimenta con Casos Límite
```wollok
>>> feroz.sufreCrisis()
>>> feroz.correr()
>>> feroz.correr()
>>> feroz.peso()  // ¿Puede ser negativo?
0.0
```

### 3. Verifica Cálculos Manualmente
```wollok
>>> abuelita.peso()
50
>>> abuelita.peso() * 0.1
5.0
>>> // Feroz debería aumentar 5 unidades al comer a abuelita
```

### 4. Prueba Diferentes Secuencias
```wollok
>>> feroz.sufreCrisis()
>>> feroz.comer(cazador)
>>> feroz.comer(abuelita)
>>> feroz.comer(caperucita)
>>> feroz.peso()
26.1
>>> feroz.estaSaludable()
true
```

## Limitaciones del REPL

- No puedes definir nuevos objetos o clases
- No puedes modificar el código fuente desde el REPL
- Los cambios en el estado persisten hasta que reinicies el REPL
- Algunos comandos avanzados pueden no estar disponibles

## Recursos Adicionales

- [Documentación oficial de Wollok REPL](https://www.wollok.org/documentacion/repl/)
- Ver [development.md](development.md) para más ejemplos de uso
- Ver [testing.md](testing.md) para estrategias de testing


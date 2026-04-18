# Guía de Instalación y Configuración

## Requisitos Previos

- **Visual Studio Code** con la extensión de Wollok instalada
- **Wollok** versión 4.0.0 o superior
- **Git** (opcional, para clonar el repositorio)

## Instalación

### 1. Instalar Visual Studio Code y Wollok

1. **Descarga e instala Visual Studio Code:**
   - [https://code.visualstudio.com/](https://code.visualstudio.com/)

2. **Instala la extensión de Wollok:**
   - Abre VS Code
   - Ve a Extensions (Ctrl+Shift+X o Cmd+Shift+X)
   - Busca "Wollok"
   - Instala la extensión oficial de Wollok

### 2. Clonar o Descargar el Proyecto

**Opción A: Con Git**
```bash
git clone <url-del-repositorio>
cd el-lobo-feroz
```

**Opción B: Descarga directa**
- Descarga el archivo ZIP del proyecto
- Extrae el contenido en tu carpeta de trabajo

### 3. Abrir en VS Code

1. Abre Visual Studio Code
2. Ve a `File` → `Open Folder...`
3. Selecciona la carpeta del proyecto "el-lobo-feroz"
4. VS Code detectará automáticamente los archivos de Wollok

## Estructura del Proyecto

```
el-lobo-feroz/
├── src/                    # Código fuente
│   ├── feroz.wlk          # Lógica del Lobo Feroz
│   ├── caperucita.wlk     # Caperucita y manzanas
│   ├── abuelita.wlk       # La Abuelita
│   ├── cazador.wlk        # El Cazador
│   ├── historia.wlk       # Orquestador de finales
│   └── chanchitos.wlk     # (archivo vacío)
├── tests/                  # Tests unitarios
│   ├── feroz.wtest        # Tests del Lobo Feroz (11 tests)
│   ├── caperucita.wtest   # Tests de Caperucita (10 tests)
│   ├── abuelita.wtest     # Tests de la Abuelita (2 tests)
│   ├── cazador.wtest      # Tests del Cazador (3 tests)
│   └── historia.wtest     # Tests de Historia (12 tests)
├── docs/                   # Documentación
├── log/                    # Archivos de log (ignorados)
├── README.md              # Especificación del ejercicio
├── CONTRIBUTING.md        # Guía de contribución
├── CODE_OF_CONDUCT.md     # Código de conducta
├── LICENSE                # Licencia del proyecto
├── CHANGELOG.md           # Registro de cambios
└── package.json           # Configuración del proyecto
```

## Ejecutar el Proyecto

### Ejecutar Tests Individuales

1. Abre cualquier archivo `.wtest` en el editor
2. Haz clic en el ícono "Run Test" que aparece sobre cada test
3. O click derecho en el archivo → "Run Wollok File"

### Ejecutar Todos los Tests

**Desde VS Code:**
- Abre la paleta de comandos (Ctrl+Shift+P o Cmd+Shift+P)
- Busca "Wollok: Run All Tests"
- Ejecuta el comando

### Ejecutar los Finales

Para ejecutar cada final de la historia, usa el REPL de Wollok:

**Abrir el REPL:**
1. Abre VS Code con el proyecto
2. Ctrl+Shift+P → "Wollok: Start REPL"
3. O click derecho en `src/historia.wlk` → "Start Wollok REPL"

**Ejecutar finales desde el REPL:**
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

>>> feroz.sufreCrisis()
>>> historia.finalFerozSufreCrisis()
>>> feroz.peso()
10

>>> feroz.sufreCrisis()
>>> historia.finalCazadorHuye()
>>> feroz.peso()
19.1
```

### Métodos Importantes de Caperucita

Cuando uses el REPL, recuerda que Caperucita tiene estos métodos:

```wollok
>>> caperucita.pesoCaperucita()  // Peso base
60

>>> caperucita.peso()  // Peso total con manzanas
61.2

>>> caperucita.cantidadDeFrutasRecolectadas()  // Cantidad de manzanas
6

>>> caperucita.pierdeFruta(1)  // Pierde manzanas
>>> caperucita.recogeFruta(1)  // Recoge manzanas
```

## Verificar la Instalación

Para verificar que todo está correctamente instalado:

1. Abre `tests/feroz.wtest`
2. Ejecuta los tests
3. Deberías ver todos los tests en verde ✓

## Troubleshooting

### Error: "Project not found" o "Cannot resolve dependencies"

**Solución:**
1. Asegúrate de tener la extensión de Wollok instalada en VS Code
2. Recarga la ventana de VS Code (Ctrl+Shift+P → "Reload Window")
3. Verifica que el archivo `package.json` esté presente
4. Intenta ejecutar los tests nuevamente

### Los tests no se ejecutan

**Solución:**
1. Verifica que los archivos `.wtest` estén en la carpeta `tests/`
2. Asegúrate de que la extensión de Wollok esté activa
3. Revisa la consola de salida de VS Code para ver errores
4. Recarga la ventana de VS Code

### Errores de sintaxis o compilación

**Solución:**
- Revisa que todos los archivos `.wlk` estén en la carpeta `src/`
- Verifica que no haya errores de sintaxis en el código
- Asegúrate de que las importaciones sean correctas
- Revisa el panel "Problems" de VS Code (Ctrl+Shift+M)

### Los programas (.wpgm) no se ejecutan

**Nota:** Este proyecto no usa archivos `.wpgm`. En su lugar, usa el objeto `historia` con métodos para los diferentes finales.

**Solución:**
1. Abre el REPL de Wollok (Ctrl+Shift+P → "Wollok: Start REPL")
2. Ejecuta los finales con: `historia.finalFerozComeCazador()`, etc.
3. Consulta la sección "Ejecutar los Finales" arriba para más detalles

## Próximos Pasos

- Lee el [README.md](../README.md) para entender la especificación del ejercicio
- Revisa [CONTRIBUTING.md](../CONTRIBUTING.md) si quieres contribuir
- Consulta [architecture.md](architecture.md) para entender el diseño del sistema
- Lee [testing.md](testing.md) para aprender sobre las estrategias de testing

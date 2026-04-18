# Changelog

Todos los cambios notables en este proyecto serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y este proyecto adhiere a [Semantic Versioning](https://semver.org/lang/es/).

## [1.0.0] - 2026-04-15

### Agregado

#### Objetos Principales
- **Feroz**: Lobo protagonista con sistema de gestión de peso y salud
  - Peso inicial: 10 unidades (no saludable)
  - Rango de peso saludable: 20-150 unidades
  - Métodos: `peso()`, `comer()`, `correr()`, `estaSaludable()`, `sufreCrisis()`

- **Caperucita**: Personaje con canasta de manzanas
  - Peso base: 60 unidades
  - Canasta inicial: 6 manzanas de 0.2 unidades cada una
  - Métodos: `cantidadDeFrutasRecolectadas()`, `pierdeFruta()`, `peso()`

- **Abuelita**: Personaje consumible
  - Peso: 50 unidades
  - Métodos: `peso()`

- **Cazador**: Personaje con mecánica creativa
  - Peso: 100 unidades
  - Métodos: `peso()`, `huir()`

- **Manzana**: Objeto consumible
  - Peso unitario: 0.2 unidades

- **Canasta**: Contenedor de frutas
  - Métodos: `cantidad()`, `poner()`, `sacar()`, `peso()`

- **Historia**: Orquestador de diferentes finales de la historia
  - Métodos: `historiaCompleta()`, `finalFerozComeCazador()`, `finalCazadorVence()`, `finalFerozSufreCrisis()`, `finalCazadorHuye()`

#### Mecánicas de Juego
- **Sistema de digestión**: Al comer, Feroz aumenta el 10% del peso del alimento consumido
- **Sistema de ejercicio**: Al correr, Feroz pierde 1 unidad de peso (mínimo 0)
- **Mecanismo de crisis**: Feroz puede volver a su peso inicial en situaciones críticas
- **Cálculo de peso total**: Caperucita se come con su canasta completa

#### Simulación
- **Objeto Historia**: Cuatro finales diferentes de la historia del Lobo Feroz
  - **finalFerozComeCazador()**: Feroz come al cazador (peso final: 29.1, saludable)
  - **finalCazadorVence()**: Cazador dispara y Feroz escapa corriendo (peso final: 16.1, no saludable)
  - **finalFerozSufreCrisis()**: Cazador provoca una crisis en Feroz (peso final: 10, no saludable)
  - **finalCazadorHuye()**: Cazador ve a Feroz y huye (peso final: 19.1, no saludable)
  - Cada final evalúa el estado de salud final de Feroz

### Características Técnicas
- Código limpio con nombres descriptivos y comentarios explicativos
- Constantes bien nombradas (`factorDigestion`, `pesoPerdidoAlCorrer`)
- Métodos polimórficos para consumo de objetos
- Validación de pesos mínimos (no negativos)
- Evaluación de estado de salud basada en rangos

### Documentación
- README.md con especificación completa del ejercicio
- LICENSE (ISC)
- CODE_OF_CONDUCT.md
- CONTRIBUTING.md
- CHANGELOG.md

### Configuración
- Proyecto configurado para Wollok 4.0.0
- Estructura de carpetas src/ y tests/
- Configuración de .gitignore para archivos de log

[1.0.0]: https://github.com/obj1-unahur-2026s1/elloboferoz-gpolverini-unahur/releases/tag/v1.0.0

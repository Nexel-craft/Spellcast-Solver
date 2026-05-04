# Resolvedor de Spellcast

Un potente resolvedor desarrollado en Python con una interfaz gráfica moderna (`customtkinter`), **diseñado específicamente para la actividad de Discord "Spellcast"**. Ten en cuenta que este *no* es un resolvedor de Boggle de propósito general. ¡Este resolvedor te ayuda a encontrar las palabras con mayor puntuación en el tablero de Spellcast, teniendo en cuenta casillas especiales como Diamantes, Palabra Doble (DW), Letra Doble (DL), Letra Triple (TL) e incluso comodines de letras (swaps)!

## Capturas de pantalla

<p align="center">
  <img src="images/default_interface.png" width="45%" alt="Interfaz predeterminada" />
  <img src="images/solver_in_use.png" width="45%" alt="Resolvedor en uso" />
</p>
<p align="center">
  <img src="images/light_mode.png" width="45%" alt="Modo claro" />
  <img src="images/language_menu.png" width="45%" alt="Menú de idiomas" />
</p>

## Características
- **Cuadrícula interactiva 5x5**: Haz clic y escribe letras directamente en la interfaz intuitiva.
- **Anotaciones de casillas especiales**: Marca casillas específicas para Diamantes y Multiplicadores para calcular la puntuación máxima exacta.
- **Soporte de comodines (Swaps)**: Configura cuántos intercambios de letras están permitidos, y el resolvedor encontrará los caminos lógicos.
- **Búsqueda profunda multiproceso**: Utiliza todos los núcleos de tu CPU a través del multithreading de Python para acelerar el cálculo enormemente.
- **Rutas resaltadas**: Pasa el ratón sobre un resultado para ver su ruta ilustrada sobre la cuadrícula, o haz clic en él para bloquear la ruta permanentemente. ¡Una letra marcada con un asterisco `*` te indica que debe ser reemplazada con un comodín!
- **Modo oscuro/claro**: Preciosa interfaz dinámica con posibilidad de cambiar el idioma en tiempo real (Inglés, Francés, Alemán, Español).

## 🚀 ¿Por qué este resolvedor es tan rápido?

A diferencia de los enfoques clásicos que exploran el tablero a ciegas, este programa incorpora dos niveles de optimización, lo que le permite calcular hasta 3 comodines en menos de 30 segundos:

1. **Filtro de compatibilidad global**: Antes de intentar trazar un camino en la cuadrícula 5x5, el algoritmo verifica si las letras necesarias existen físicamente en el tablero mediante un contador de frecuencias. Esta comprobación ultrarrápida descarta instantáneamente más del 99% del diccionario sin realizar cálculos geométricos.
2. **Búsqueda de caminos optimizada (DFS y Bitmasking)**: Para las palabras compatibles restantes, el trazado exacto se verifica mediante una Búsqueda en Profundidad (DFS). El historial de rutas se memoriza dinámicamente (`lru_cache`) y las posiciones se almacenan como bitmasks ultraligeros para no recalcular las mismas intersecciones.
3. **Arquitectura Multihilo**: El diccionario se divide y se distribuye entre todos los núcleos de tu procesador simultáneamente. Esto evita las limitaciones convencionales de Python (GIL), reduciendo drásticamente el tiempo de espera.

## Instalación y Lanzamiento

### El método fácil
1. Asegúrate de tener instalado **Python 3.10+**.
2. Clona o descarga este repositorio.
3. Lanza la aplicación:
   - **Windows**: Haz doble clic en **`start.bat`**.
   - **macOS**: Haz doble clic en **`start_mac.command`**. *(Nota: Es posible que necesites otorgarle permisos de ejecución haciendo clic derecho > "Abrir", o mediante el terminal `chmod +x start_mac.command`)*.
   - **Linux**: Ejecuta **`start_linux.sh`** desde tu terminal, o haz doble clic si tu administrador de archivos lo admite.

   *¡El script configurará automáticamente el entorno virtual, instalará las dependencias y lanzará la aplicación!*

### El método manual (Todos los SO)
1. Asegúrate de tener instalado **Python 3.10+**.
2. Se recomienda un entorno virtual:
   ```bash
   python -m venv .venv
   .\.venv\Scripts\activate  # Windows
   ```
3. Instala los requisitos requeridos:
   ```bash
   pip install -r requirements.txt
   ```

## Cómo usar el resolvedor
Inicia la ventana del programa a través de `start.bat` (Windows) o manualmente:
```bash
python solver/main.py
```
Escribe tus letras en las cajitas, configura la posición de tus modificadores / diamantes o número de hilos con la barra inferior. Haz clic entonces en **"¡Buscar palabras!"**. 

## Licencia
Este proyecto está bajo la **Licencia MIT**. Eres libre de copiar, modificar, publicar, utilizar y distribuir libremente este software, siempre y cuando incluyas el aviso de derechos de autor original (citando al creador original). Consulta el archivo `LICENSE` para conocer más detalles.

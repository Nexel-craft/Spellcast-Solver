# Spellcast Solver

A powerful 5x5 word solver built in Python with a modern graphical interface (`customtkinter`), **specifically designed for the Discord activity "Spellcast"**. Please note that this is *not* a general-purpose Boggle solver. This solver helps you find the highest scoring words on a Spellcast board, taking into account special tiles like Diamonds, Double Words (DW), Double Letters (DL), Triple Letters (TL), and even letter swaps (blanks)!

## Screenshots

<p align="center">
  <img src="images/default_interface.png" width="45%" alt="Default Interface" />
  <img src="images/solver_in_use.png" width="45%" alt="Solver In Use" />
</p>
<p align="center">
  <img src="images/light_mode.png" width="45%" alt="Light Mode" />
  <img src="images/language_menu.png" width="45%" alt="Language Menu" />
</p>

## Features
- **5x5 Interactive Grid**: Click and type letters directly into the intuitive UI.
- **Special Tiles Annotations**: Mark specific tiles for Diamonds, Double Words, Double Letters, and Triple Letters to calculate the exact maximum score.
- **Swap Support**: Configure how many letter swaps are allowed, and let the solver handle the complex permutations.
- **Multithreaded Deep Search**: Utilizes your CPU cores via Python's multithreading/multiprocessing to crunch the dictionary and calculate the paths incredibly fast.
- **Visual Path Highlights**: Hover over a result word to preview its path, or click on it to lock the path permanently over the grid. A letter marked with an asterisk `*` designates a swap!
- **Internationalization**: UI supports English, French, German, and Spanish dynamically.
- **Dark/Light Mode**: Beautiful modern UI that adapts to your preferences.

## 🚀 Why is this solver so fast?

Unlike classic approaches that blindly explore the board, this solver incorporates two layers of optimization, allowing it to process up to 3 letter swaps in under 30 seconds:

1. **Global Compatibility Pre-filter**: Before attempting to trace a path on the 5x5 grid, the algorithm checks if the required letters physically exist on the board (accounting for available swaps) using a flat frequency counter. This ultra-fast linear check instantly discards over 99% of the dictionary without any geometric computation.
2. **Optimized Pathfinding (DFS & Bitmasking)**: For the remaining compatible words, the exact trace is verified using a Depth-First Search (DFS). The state history is dynamically memoized (`lru_cache`) and grid positions are encoded as lightweight bitmasks to prevent recalculating identical paths.
3. **Multi-Threaded Architecture**: The dictionary is chunked and distributed across all your CPU cores simultaneously. This workload division bypasses Python's GIL limitations, effectively dividing the total computation time by your processor's core count.

## Project Structure
- `solver/main.py`: The main GUI application. Run this to use the program!
- `solver/solver_core.py`: The core multithreaded DFS engine.
- `solver/dictionary.csv`: A comprehensive list of valid playable words.
- `build_dictionary.py`: A utility script that leverages the `nltk` library to fetch English lemmas and build an initial CSV dictionary from WordNet.
- `tests/test_solver.py`: Unit test suite ensuring the reliability of the solver.

## Installation & Launch

### The Easy Way
1. Ensure you have **Python 3.10+** installed.
2. Clone or download this repository.
3. Launch the application:
   - **Windows**: Simply double-click **`start.bat`**.
   - **macOS**: Double-click **`start_mac.command`**. *(Note: You may need to grant it execution permissions first by right-clicking it and selecting "Open", or via terminal `chmod +x start_mac.command`)*.
   - **Linux**: Run **`start_linux.sh`** from your terminal, or double-click it if your file manager supports it.

   *The script will automatically set up the virtual environment, install the necessary dependencies, and launch the application!*

### The Manual Way (All OS)
1. Ensure you have **Python 3.10+** installed.
2. Clone or download this repository.
3. It is highly recommended to use a virtual environment:
   ```bash
   python -m venv .venv
   .\.venv\Scripts\activate  # Windows
   # source .venv/bin/activate  # Mac/Linux
   ```
4. Install the required dependencies:
   ```bash
   pip install -r requirements.txt
   ```

## How to Use the Solver

1. Start the solver by running `start.bat` (Windows) or via terminal:
   ```bash
   python solver/main.py
   ```
2. **Letters Stage**: Fill the 5x5 grid by typing the characters. The cursor automatically advances to the next cell.
3. **Diamonds Stage**: Select "Diamonds" from the modifier bar. Click on any grid cell that contains a diamond to highlight it.
4. **Multiplier Stages**: Select the appropriate option (Double Word, Double/Triple Letter) and click on cells to define their multipliers.
5. **Swaps & Threads**: Indicate the maximum number of letter swaps allowed (0 to 3) and how many CPU threads to allocate for the search.
6. **Find Words**: Click the "Find words!" button. The multithreaded engine will find all possible word paths and display them sorted by either "Top by Score" or "Top by Diamonds".
7. **View Path**: Hover your mouse over any word in the lists to highlight the path required to spell it on the board.

## License

This project is licensed under the **MIT License**. You are free to copy, modify, publish, use, and distribute this software, provided you include the original copyright notice and permission notice. See the `LICENSE` file for more details.

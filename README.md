# Tic-Tac-Toe Game

A classic Tic-Tac-Toe game built with Flutter. This application allows two players to compete on the same device, featuring a clean UI, score tracking, and responsive state management using the `provider` package.

## Features

- **Two-Player Gameplay:** Classic X vs. O gameplay for two players.
- **Score Tracking:** Keeps a running tally of wins for Player 1 (X) and Player 2 (O), as well as the number of drawn matches.
- **Turn Indicator:** Clearly displays which player's turn it is.
- **Win/Draw Detection:** Automatically detects winning combinations and draw conditions, displaying a congratulatory message to the winner.
- **Game Controls:**
    - **Restart:** Clears the board to start a new round while preserving the current scores.
    - **New Game:** Wipes the board and resets all scores to zero for a fresh start.
- **Cross-Platform:** Built with Flutter for a seamless experience across multiple platforms including Android, iOS, and Web.

## Tech Stack

- **Framework:** Flutter
- **Language:** Dart
- **State Management:** `provider`

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

You need to have the Flutter SDK installed on your machine. For installation instructions, refer to the [official Flutter documentation](https://flutter.dev/docs/get-started/install).

### Installation & Running

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/vishalyadu1c/tic_tac_toe_game.git
    ```
2.  **Navigate to the project directory:**
    ```sh
    cd tic_tac_toe_game
    ```
3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```
4.  **Run the application:**
    ```sh
    flutter run

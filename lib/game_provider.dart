import 'dart:developer';

import 'package:flutter/widgets.dart';

class GameProvider with ChangeNotifier {
  List<String> gameBoard = List.filled(9, '', growable: false);
  String currentValue = 'X';
  String winningMessage = "";
  int oWinCount = 0;
  int xWinCount = 0;
  int drowMatchCount = 0;
  bool isGameFinished = false;



  bool checkWinner() {
    const ifWinningWenMatch = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2]
    ];

    for (var value in ifWinningWenMatch) {
      if (gameBoard[value[0]] == gameBoard[value[1]] &&
          gameBoard[value[1]] == gameBoard[value[2]] &&
          gameBoard[value[0]] != '') {
        return true;
      }
    }
    return false;
  }


  void handleUserTap(int index) {
    log(checkWinner().toString());
    if (gameBoard[index] == '') {
        if (!isGameFinished) {
          gameBoard[index] = currentValue;
          if (checkWinner()) {
            isGameFinished = true;
            winningMessage = "Player $currentValue Wins!";

            if (currentValue == 'X') {
              xWinCount++;
            }

            if (currentValue == 'O') {
              oWinCount++;
            }

          } else {
            currentValue = currentValue == 'X' ? 'O' : 'X';
          }
        }
    }
    notifyListeners();
  }


   void handleRestartButton() {
      gameBoard = List.filled(9, '', growable: false);
      isGameFinished = false;
      winningMessage = "";
      notifyListeners();
  }

  void handleNewGameButton() {
      gameBoard = List.filled(9, '', growable: false);
      isGameFinished = false;
      winningMessage = "";
      oWinCount = 0;
      xWinCount = 0;
      drowMatchCount = 0;
      notifyListeners();
  }

}
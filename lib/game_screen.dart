import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  final String title;
  const GameScreen({super.key, required this.title});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
      List<String> gameBoard = List.filled(9, '', growable: false);
    String currentValue = 'X';

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
      if (gameBoard[index] == '') {
        setState(() {
          gameBoard[index] = currentValue;
          if (checkWinner()) {
            gameBoard = List.filled(9, '', growable: false);
            showGeneralDialog(
              context: context,
              barrierDismissible: false,
              barrierLabel: 'Dismiss', 
              transitionDuration: Duration(milliseconds: 300),
              pageBuilder: (context, animation, secondaryAnimation) {
              return Center(
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    margin: EdgeInsets.all(18.0),
                    padding: EdgeInsets.all(18.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                       mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 18,
                      children: [
                        Text('Player $currentValue is the winner! 🏆',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                icon: Icon(
                                  Icons.cancel,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                style: OutlinedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  side: const BorderSide(color: Colors.grey),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: (){
                                Navigator.pop(context);
                                },
                                label: Text(
                                  'Restart',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red.shade400,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {
                                  exit(0);
                                },
                                child: Text(
                                  'Exit',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },);
          } else {
            currentValue = currentValue == 'X' ? '0' : 'X';
          }
        });
      }
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 4.0, crossAxisSpacing: 4.0),
            itemCount: gameBoard.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  handleUserTap(index);
                  log(gameBoard[index]);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  color: Colors.grey.shade100,
                  child: Text(
                    gameBoard[index],
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

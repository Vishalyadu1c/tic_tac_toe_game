
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_game/game_provider.dart';
import 'package:tic_tac_toe_game/theme_provider.dart';

class GameScreen extends StatelessWidget {
  final String title;
  const GameScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 14,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    GestureDetector(
                      onTap: ()=>themeProvider.toggleTheme(),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white54, shape: BoxShape.circle),
                        child: Icon(themeProvider.isDarkMode ? Icons.sunny : Icons.nightlight),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 30,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 78,
                          height: 78,
                          decoration: BoxDecoration(
                              color: gameProvider.currentValue == 'X'
                                  ? Colors.white
                                  : Colors.white38,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.account_circle,
                            size: 60,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          "Player 1",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          gameProvider.xWinCount.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.red),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 78,
                          height: 78,
                          decoration: BoxDecoration(
                              color: gameProvider.currentValue == 'O'
                                  ? Colors.white
                                  : Colors.white38,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.account_circle_outlined,
                            size: 60,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          "Player 2",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          gameProvider.oWinCount.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.green),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 130,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    "Player ${gameProvider.currentValue == 'X' ? 1 : 2}'s Turn",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.black38, fontSize: 16),
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.2,
                      mainAxisExtent: 100.0,
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0),
                  itemCount: gameProvider.gameBoard.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => gameProvider.handleUserTap(index),
                      child: Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white54,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 1.6,
                                  blurStyle: BlurStyle.outer)
                            ]),
                        child: Text(
                          gameProvider.gameBoard[index],
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  color: gameProvider.gameBoard[index] == "O"
                                      ? Colors.green
                                      : Colors.red),
                        ),
                      ),
                    );
                  },
                ),
                Visibility(
                    visible: gameProvider.isGameFinished,
                    child: Column(
                      children: [
                        Text(
                          gameProvider.winningMessage,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text("🎉 Congratulation 🎉",
                            style: Theme.of(context).textTheme.titleMedium)
                      ],
                    )),
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                        child: ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.lime),
                          minimumSize:
                              WidgetStatePropertyAll(Size(double.infinity, 50)),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusGeometry.circular(10)))),
                      onPressed: () => gameProvider.handleRestartButton(),
                      label: Text("Restart",
                          style: Theme.of(context).textTheme.labelLarge),
                      icon: Icon(
                        Icons.refresh_outlined,
                        color: Colors.black,
                      ),
                    )),
                    Expanded(
                        child: ElevatedButton.icon(
                      style: ButtonStyle(
                          minimumSize:
                              WidgetStatePropertyAll(Size(double.infinity, 50)),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusGeometry.circular(10)))),
                      onPressed: () => gameProvider.handleNewGameButton(),
                      label: Text(
                        "New Game",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: Colors.black,
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

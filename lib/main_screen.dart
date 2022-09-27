import 'package:flutter/material.dart';
// import 'package:xoxo/utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isTurn = true;
  List<String> playerValue = ['', '', '', '', '', '', '', '', ''];
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeeeeee),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xff333333),
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const Text(
                    'XOXO',
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.refresh,
                      color: Color(0xff333333),
                      size: 30,
                    ),
                    onPressed: () {
                      clearBoard();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        clicked(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff333333),
                            width: 1.2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            playerValue[index],
                            style: const TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff333333),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void clicked(int i) {
    setState(() {
      if (isTurn && playerValue[i] == '') {
        playerValue[i] = 'O';
        number++;
      }
      if (!isTurn && playerValue[i] == '') {
        playerValue[i] = 'X';
        number++;
      }
      isTurn = !isTurn;
      isWinner();
    });
  }

  void isWinner() {
    if (playerValue[0] == playerValue[1] &&
        playerValue[0] == playerValue[2] &&
        playerValue[0] != '') {
      return alertBox('win', playerValue[0]);
    } else if (playerValue[3] == playerValue[4] &&
        playerValue[3] == playerValue[5] &&
        playerValue[3] != '') {
      return alertBox('win', playerValue[3]);
    } else if (playerValue[6] == playerValue[7] &&
        playerValue[6] == playerValue[8] &&
        playerValue[6] != '') {
      return alertBox('win', playerValue[6]);
    } else if (playerValue[0] == playerValue[3] &&
        playerValue[0] == playerValue[6] &&
        playerValue[0] != '') {
      return alertBox('win', playerValue[0]);
    } else if (playerValue[1] == playerValue[4] &&
        playerValue[1] == playerValue[7] &&
        playerValue[1] != '') {
      return alertBox('win', playerValue[1]);
    } else if (playerValue[2] == playerValue[5] &&
        playerValue[2] == playerValue[8] &&
        playerValue[2] != '') {
      return alertBox('win', playerValue[2]);
    } else if (playerValue[0] == playerValue[4] &&
        playerValue[0] == playerValue[8] &&
        playerValue[0] != '') {
      return alertBox('win', playerValue[0]);
    } else if (playerValue[2] == playerValue[4] &&
        playerValue[2] == playerValue[6] &&
        playerValue[2] != '') {
      return alertBox('win', playerValue[2]);
    } else if(number == 9) {
      return alertBox('', '');
    }
  }

  void alertBox(String text, String winner) {
    String result = (text == 'win') ? 'Player $winner is Winner!!' : 'Draw';
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(result),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.refresh,
                  color: Color(0xff333333),
                  size: 30,
                ),
                onPressed: () {
                  clearBoard();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        playerValue[i] = '';
      }
    });

    number = 0;
  }
}

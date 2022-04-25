import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  dynamic player_1_sign;
  dynamic player_2_sign;

  List XoGrid = ['a1', 'a2', 'a3', 'b1', 'b2', 'b3', 'c1', 'c2', 'c3'];

  stdout.write('Let\'s Play TiK-Tak-Toe.');
  stdout.write('To fill the cell, just type the cell # \n');
  stdout.write(
      ' a1| a2 | a3 \n -------------- \n b1| b2 | b3 \n -------------- \n c1| c2 | c3 ');
  stdout.write('\n Please pick a sign: (X/O) ');

  //Player Sign Selection Input
  player_1_sign = stdin.readLineSync();

  //Assign the other sign to AI based on player selection
  if (player_1_sign == 'X') {
    player_2_sign = 'O';
    stdout.write('You picked, $player_1_sign');
  } else if (player_1_sign == 'O') {
    stdout.write('You picked, $player_1_sign');
    player_2_sign = 'X';
  }

  while (true) {
    stdout.write('\n \n Cell # -->');
    var player_1_input = stdin.readLineSync();
    var player_2_input = generatePlayer2Input(XoGrid);

    var xogridID = XoGrid.indexOf(player_1_input);

    XoGrid[xogridID] = player_1_sign;
    XoGrid[player_2_input] = player_2_sign;

    bool gameOverYet = checkForGameOver(XoGrid);

    printXOGrdi(XoGrid);

    if (gameOverYet) {
      break;
    } else {
      continue;
    }
  }
}

//
//
// TICK-TAK-TOE METHODS
//
//
//

generatePlayer2Input(grid) {
  while (true) {
    var rng = Random().nextInt(8);

    if (grid[rng] == 'X' || grid[rng] == 'O') {
      continue;
    } else {
      return rng;
    }
  }
}

bool checkForGameOver(XoGrid) {
  bool gameover;
  if (XoGrid.contains('q')) {
    stdout.write('\n \n You Quit The Game :( ');
    gameover = true;
  } else if (checkForCellFilled(XoGrid)) {
    stdout.write('\n \n It\'s a DRAW !!!');
    gameover = true;
  } else if (checkForPatternAchieved(XoGrid)) {
    stdout.write('\n \n THE GAME IS WON :)) ');
    gameover = true;
  } else {
    gameover = false;
  }

  return gameover;
}

bool checkForPatternAchieved(XoGrid) {
  bool gameover;
  var gridA = XoGrid[0] + XoGrid[1] + XoGrid[2];
  var gridB = XoGrid[3] + XoGrid[4] + XoGrid[5];
  var gridC = XoGrid[6] + XoGrid[7] + XoGrid[8];

  var gridD = XoGrid[0] + XoGrid[3] + XoGrid[6];
  var gridE = XoGrid[1] + XoGrid[4] + XoGrid[7];
  var gridF = XoGrid[2] + XoGrid[5] + XoGrid[8];

  var gridG = XoGrid[3] + XoGrid[4] + XoGrid[8];
  var gridH = XoGrid[6] + XoGrid[4] + XoGrid[2];

  if ((gridA == 'XXX' || gridA == 'OOO') ||
      (gridB == 'XXX' || gridB == 'OOO') ||
      (gridC == 'XXX' || gridC == 'OOO') ||
      (gridD == 'XXX' || gridD == 'OOO') ||
      (gridE == 'XXX' || gridE == 'OOO') ||
      (gridF == 'XXX' || gridF == 'OOO') ||
      (gridG == 'XXX' || gridG == 'OOO') ||
      (gridH == 'XXX' || gridH == 'OOO')) {
    gameover = true;
  } else {
    gameover = false;
  }

  return gameover;
}

bool checkForCellFilled(XoGrid) {
  bool gameover;

  if (XoGrid.contains('a1') ||
      XoGrid.contains('a2') ||
      XoGrid.contains('a3') ||
      XoGrid.contains('b1') ||
      XoGrid.contains('b2') ||
      XoGrid.contains('b3') ||
      XoGrid.contains('c1') ||
      XoGrid.contains('c2') ||
      XoGrid.contains('c3')) {
    gameover = false;
  } else {
    gameover = true;
  }

  return gameover;
}

void printXOGrdi(XoGrid) {
  stdout.write(
      ' ${XoGrid[0]} | ${XoGrid[1]}  | ${XoGrid[2]} \n -------------- \n ${XoGrid[3]} | ${XoGrid[4]} | ${XoGrid[5]} \n -------------- \n ${XoGrid[6]} | ${XoGrid[7]} | ${XoGrid[8]} ');
}

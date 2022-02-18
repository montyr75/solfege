import 'package:console/console.dart';
import 'package:solfege/components/console_menu.dart';
import 'package:solfege/data/music_data.dart';
import 'package:solfege/utils/console_utils.dart';
import 'package:solfege/utils/scales.dart';

// TODO: Support a few more scale types (minor, etc.).
// TODO: Make prompt validator.

void main() {
  Console.init();

  final tonic = getTonicFromUser();

  printMessage(getMajorScale(tonic).toString());
}

Accidental? printAccidentalMenu() {
  Accidental? accidental;

  printConsoleMenu([
    ConsoleMenuOption("Sharp", onSelect: () {accidental = Accidental.sharp;}),
    ConsoleMenuOption("None", onSelect: () {accidental = null;}),
    ConsoleMenuOption("Flat", onSelect: () {accidental = Accidental.sharp;}),
  ]);

  return accidental;
}

Letter? printLetterMenu() {
  final input = promptForStringExt("Letter: ");

  for (final letter in Letter.values) {
    if (letter.name.toLowerCase() == input.toLowerCase()){
      return letter;
    }
  }

  printError("Letter Not Found");
  return null;
}

Note getTonicFromUser() {
  final letter = printLetterMenu();
  final accidental = printAccidentalMenu();

  return Note(letter!, accidental);
}
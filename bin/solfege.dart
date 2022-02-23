import 'package:console/console.dart';
import 'package:solfege/components/console_menu.dart';
import 'package:solfege/data/music_data.dart';
import 'package:solfege/utils/console_utils.dart';
import 'package:solfege/utils/scales.dart';

// TODO: Support a few more scale types (minor, etc.).

void main() {
  Console.init();

  final tonic = getTonicFromUser();

  printMessage(getMajorScale(tonic).toString());
}

Note getTonicFromUser() {
  final letter = printLetterMenu();
  final accidental = printAccidentalMenu();

  return Note(letter, accidental);
}

Letter printLetterMenu() {
  Letter? selectedLetter;

  promptForStringExt(
    "Letter: ",
    validator: (input) {
      selectedLetter = stringToLetter(input);
      return selectedLetter != null;
    },
  );

  return selectedLetter!;
}

Accidental? printAccidentalMenu() {
  Accidental? accidental;

  printConsoleMenu([
    const ConsoleMenuOption("None"),
    ConsoleMenuOption("Sharp", onSelect: () => accidental = Accidental.sharp),
    ConsoleMenuOption("Flat", onSelect: () => accidental = Accidental.flat),
  ]);

  return accidental;
}

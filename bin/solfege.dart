import 'package:console/console.dart';
import 'package:solfege/components/console_menu.dart';
import 'package:solfege/data/music_data.dart';
import 'package:solfege/utils/console_utils.dart';
import 'package:solfege/utils/scales.dart';

void main() {
  Console.init();

  final tonic = getTonicFromUser();

  final scale = getScale(tonic, printScaleTypeMenu());

  consoleNewLine();

  for (int i = 0; i < scale.length; i++) {
    print("${scale[i]} (${solfegeScale[i]})");
  }
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

ScaleType printScaleTypeMenu() {
  late ScaleType scaleType;

  printConsoleMenu([
    ConsoleMenuOption("Major", onSelect: () => scaleType = ScaleType.major),
    ConsoleMenuOption("Minor", onSelect: () => scaleType = ScaleType.minor),
  ]);

  return scaleType;
}

extension IterableStringX on Iterable<String> {
  String toPaddedVerticalString([int width = 3]) {
    final sb = StringBuffer();

    for (final value in this) {
      sb.writeln(value.padRight(width));
    }

    return sb.toString();
  }
}
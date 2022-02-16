import 'package:console/console.dart';
import 'package:solfege/data/music_data.dart';
import 'package:solfege/utils/scales.dart';

// TODO: Support a few more scale types (minor, etc.).

void main() {
  Console.init();

  const tonic = Note(Letter.F);

  // print(getNoteFromSolfege(tonic: "C", solfege: "mi"));
  print(getMajorScale(tonic));
  // print(getNaturals(Letter.C));
  // print(const Note(Letter.G, Accidental.flat).halfStepsToNext());
}
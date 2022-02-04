import 'package:console/console.dart';
import 'package:solfege/utils/scales.dart';

// TODO: Rewrite scale-finding algorithm to work like the real world.
// TODO: Support a few more scale types (minor, etc.).

void main() {
  Console.init();
  
  // print(getNoteFromSolfege(tonic: "C", solfege: "mi"));
  print(getMajorScale("F"));
}

import '../data/music_data.dart';

List<Note> getMajorScale(Note tonic) {
  final List<Note> majorScale = [tonic];

  for (final halfSteps in scaleHalfSteps["major"]!) {
    final currentNote = majorScale.last;
    final nextNote = Note(currentNote.letter.nextLetter());

    final halfStepsToNext = currentNote.halfStepsToNext();
    final diff = halfStepsToNext - halfSteps;

    if (diff == 0) {
      majorScale.add(nextNote);
    }
    else if (diff < 0) {
      majorScale.add(nextNote.sharpen(diff.abs()));
    }
    else {
      majorScale.add(nextNote.flatten(diff));
    }
  }

  return majorScale;
}

// String getNoteFromSolfege({required String tonic, required String solfege}) {
//   assert(chromaticScaleSharp.contains(tonic) && solfegeScale.contains(solfege));
//
//   // get the major scale of the tonic
//   final scale = getMajorScale(tonic);
//
//   // get the index of solfege in solfegeScale
//   final solfegeIndex = solfegeScale.indexOf(solfege);
//
//   // return the note from the major scale at the solfege index
//   return scale[solfegeIndex];
// }

import '../data/music_data.dart';

List<Note> getScale(Note tonic, ScaleType scaleType) {
  final List<Note> scale = [tonic];

  for (final halfSteps in scaleHalfSteps[scaleType]!) {
    final currentNote = scale.last;
    final nextNote = Note(currentNote.letter.nextLetter());

    final halfStepsToNext = currentNote.halfStepsToNext();
    final diff = halfStepsToNext - halfSteps;

    if (diff == 0) {
      scale.add(nextNote);
    }
    else if (diff < 0) {
      scale.add(nextNote.sharpen(diff.abs()));
    }
    else {
      scale.add(nextNote.flatten(diff));
    }
  }

  return scale;
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

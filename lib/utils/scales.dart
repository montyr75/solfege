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

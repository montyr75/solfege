import '../data/music_data.dart';

List<Note> getNaturals(Letter tonic) {
  const letters = Letter.values;

  final List<Note> naturals = [];

  for (int i = 0; i < letters.length; i++) {
    int offsetIndex = tonic.index + i;

    // bounds checking and loopback
    if (offsetIndex >= letters.length) {
      offsetIndex -= letters.length;
    }

    naturals.add(Note(letters[offsetIndex]));
  }

  return naturals;
}

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

List<String> getMajorScaleByHalfSteps(String tonic) {
  assert(chromaticScaleSharp.contains(tonic));

  final List<String> majorScale = [];

  // get the index offset for the tonic
  int offsetIndex = chromaticScaleSharp.indexOf(tonic);

  for (final halfSteps in scaleSteps["major"]!) {
    offsetIndex += halfSteps;

    // bounds checking and loopback
    if (offsetIndex >= chromaticScaleSharp.length) {
      offsetIndex -= chromaticScaleSharp.length;
    }

    majorScale.add(chromaticScaleSharp[offsetIndex]);
  }

  return majorScale;
}

List<String> getMajorScaleSharps(String tonic) {
  assert(chromaticScaleSharp.contains(tonic));

  final List<String> majorScale = [];

  // get the index offset for the tonic
  int offsetIndex = chromaticScaleSharp.indexOf(tonic);

  for (final halfSteps in scaleSteps["major"]!) {
    offsetIndex += halfSteps;

    // bounds checking and loopback
    if (offsetIndex >= chromaticScaleSharp.length) {
      offsetIndex -= chromaticScaleSharp.length;
    }

    majorScale.add(chromaticScaleSharp[offsetIndex]);
  }

  return majorScale;
}

String getNoteFromSolfege({required String tonic, required String solfege}) {
  assert(chromaticScaleSharp.contains(tonic) && solfegeScale.contains(solfege));

  // get the major scale of the tonic
  final scale = getMajorScaleByHalfSteps(tonic);

  // get the index of solfege in solfegeScale
  final solfegeIndex = solfegeScale.indexOf(solfege);

  // return the note from the major scale at the solfege index
  return scale[solfegeIndex];
}

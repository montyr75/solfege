import '../data/music_data.dart';

List<String> getMajorScale(String tonic) {
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
  final scale = getMajorScale(tonic);

  // get the index of solfege in solfegeScale
  final solfegeIndex = solfegeScale.indexOf(solfege);

  // return the note from the major scale at the solfege index
  return scale[solfegeIndex];
}
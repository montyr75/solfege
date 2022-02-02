import '../data/music_data.dart';

List<String> getMajorScale(String tonic) {
  assert(chromaticScaleSharp.contains(tonic));

  final List<String> majorScale = [];

  // get the index offset for the tonic
  final offset = chromaticScaleSharp.indexOf(tonic);

  for (final index in scaleIndexes['major']!) {
    int offsetIndex = index + offset;

    if (offsetIndex >= chromaticScaleSharp.length) {
      offsetIndex -= chromaticScaleSharp.length;
    }

    majorScale.add(chromaticScaleSharp[offsetIndex]);
  }

  return majorScale;
}
const List<String> chromaticScaleSharp = [
  'A',
  'A#',
  'B',
  'C',
  'C#',
  'D',
  'D#',
  'E',
  'F',
  'F#',
  'G',
  'G#',
];

const List<String> solfege = [
  'do',
  're',
  'mi',
  'fa',
  'so',
  'la',
  'ti',
];

// pattern does not include the tonic
const Map<String, List<int>> scaleIndexes = {
  'major': [0, 2, 4, 5, 7, 9, 11],
};

// pattern does not include the tonic
const Map<String, List<Step>> scaleSteps = {
  'major': [Step.whole, Step.whole, Step.half, Step.whole, Step.whole, Step.whole],
};

enum Step {
  half,
  whole,
}
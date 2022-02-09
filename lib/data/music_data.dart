enum Accidental {
  doubleFlat,
  flat,
  natural,
  sharp,
  doubleSharp,
}

extension AccidentalX on Accidental {
  String toAccidentalString() {
    switch (this) {
      case Accidental.doubleFlat: return '♭♭';
      case Accidental.flat: return '♭';
      case Accidental.natural: return '♮';
      case Accidental.sharp: return '♯';
      case Accidental.doubleSharp: return '♯♯';
    }
  }
}

enum Letter {
  A,
  B,
  C,
  D,
  E,
  F,
  G,
}

class Note {
  final Letter letter;
  final Accidental? accidental;

  const Note(this.letter, [this.accidental]);

  Note sharpen() {
    assert(accidental == null || accidental != Accidental.values.last);

    final acc = accidental ?? Accidental.natural;
    return Note(letter, Accidental.values[acc.index + 1]);
  }

  Note flatten() {
    assert(accidental == null || accidental != Accidental.values.first);

    final acc = accidental ?? Accidental.natural;
    return Note(letter, Accidental.values[acc.index - 1]);
  }
}

const List<Note> naturals = [
  Note(Letter.A),
  Note(Letter.B),
  Note(Letter.C),
  Note(Letter.D),
  Note(Letter.E),
  Note(Letter.F),
  Note(Letter.G),
];

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

const List<String> solfegeScale = [
  'do',
  're',
  'mi',
  'fa',
  'so',
  'la',
  'ti',
];

const Map<String, List<int>> scaleSteps = {
  'major': [0, 2, 2, 1, 2, 2, 2],
};

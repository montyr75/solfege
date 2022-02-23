enum Letter {
  A,
  B,
  C,
  D,
  E,
  F,
  G,
}

extension LetterX on Letter {
  Letter nextLetter() => this == Letter.G
      ? Letter.A
      : Letter.values[index + 1];
}

Letter? stringToLetter(String str) {
  try {
    return Letter.values.firstWhere((value) => value.name == str.toUpperCase());
  }
  catch (e) {
    return null;
  }
}

enum Accidental {
  doubleFlat,
  flat,
  natural,
  sharp,
  doubleSharp,
}

extension AccidentalX on Accidental {
  int halfSteps() {
    switch (this) {
      case Accidental.doubleFlat: return 2;
      case Accidental.flat: return 1;
      case Accidental.natural: return 0;
      case Accidental.sharp: return -1;
      case Accidental.doubleSharp: return -2;
    }
  }

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

class Note {
  final Letter letter;
  final Accidental? accidental;

  const Note(this.letter, [this.accidental]);

  Note sharpen([int reps = 1]) {
    assert(accidental == null || accidental != Accidental.values.last);

    final acc = accidental ?? Accidental.natural;
    return Note(letter, Accidental.values[acc.index + reps]);
  }

  Note flatten([int reps = 1]) {
    assert(accidental == null || accidental != Accidental.values.first);

    final acc = accidental ?? Accidental.natural;
    return Note(letter, Accidental.values[acc.index - reps]);
  }

  bool get hasAccidental => accidental != null;

  int halfStepsToNext() {
    final halfSteps = (letter == Letter.B || letter == Letter.E)
        ? 1
        : 2;

    return halfSteps + (accidental?.halfSteps() ?? 0);
  }

  @override
  String toString() => "${letter.name}${accidental?.toAccidentalString() ?? ''}";
}

const List<String> solfegeScale = [
  'do',
  're',
  'mi',
  'fa',
  'so',
  'la',
  'ti',
];

const Map<String, List<int>> scaleHalfSteps = {
  'major': [2, 2, 1, 2, 2, 2],
};

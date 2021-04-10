from collections import Counter


def score(word: str) -> int:

    letter_to_value = dict()

    for letters, value in [
        (["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"], 1),
        (["D", "G"], 2),
        (["B", "C", "M", "P"], 3),
        (["F", "H", "V", "W", "Y"], 4),
        (["K", ], 5),
        (["J", "X"], 8),
        (["Q", "Z"], 10),
    ]:
        for letter in letters:
            letter_to_value[letter] = value

    return sum(
        letter_to_value[letter.upper()] * multiplicity
        for letter, multiplicity in Counter(word).items()
    )

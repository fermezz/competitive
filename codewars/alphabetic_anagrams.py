# Codewars kata link: https://www.codewars.com/kata/53e57dada0cb0400ba000688
from collections import Counter


def list_position(word):
    """Return the anagram list position of the word"""
    word_list = list(word)
    sorted_list = list(sorted(word))
    position = 0

    while word_list:
        dividendo = factorial(len(word_list))
        divisor = reduce(lambda x, y: x * y, [factorial(value) for key, value in Counter(word_list).iteritems()])
        letter = word_list[0]
        permutations_q = dividendo / divisor
        position += (permutations_q / len(word_list)) * len(sorted_list[:sorted_list.index(letter)])
        word_list.remove(letter)
        sorted_list.remove(letter)

    return position + 1


def factorial(number):
    if number == 1:
        return 1
    return number * factorial(number-1)

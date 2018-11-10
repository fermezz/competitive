# Codewars kata link: https://www.codewars.com/kata/540afbe2dc9f615d5e000425<Paste>
import math
from collections import defaultdict


class Sudoku(object):
    def __init__(self, data):
        self.matrix = data
        self.matrix_size = len(self.matrix)
        self.little_square_size = int(math.sqrt(self.matrix_size))
        self.result = sum(val for val in range(self.matrix_size + 1))
        self.expected_value = self.matrix_size * self.result

    def is_valid(self):
        s = int(self.little_square_size)

        if not self.check_valid_values():
            return False

        if s * s != self.matrix_size:
            return False

        if not (len(self.matrix[0]) == self.matrix_size and len(set([len(val) for val in self.matrix])) == 1):
            return False

        if not self.check_lines():
            return False

        if not self.check_little_squares():
            return False

        if not self.check_columns():
            return False

        return True

    def check_lines(self):
        for line in self.matrix:
            if sum(line) != self.result:
                return False

        return True

    def check_columns(self):
        transposed_matrix = [column for column in zip(*self.matrix)]
        for line in transposed_matrix:
            if sum(line) != self.result:
                return False

        return True

    def check_little_squares(self):
        results = {}
        for index, line in enumerate(chunks(self.matrix, self.little_square_size)):
            results[index] = defaultdict(int)
            for chunk in line:
                for idx, val in enumerate(chunks(chunk, self.little_square_size)):
                    results[index][idx] += sum(val)

        for k, v in results.items():
            for q, little_square in v.items():
                if self.result != little_square:
                    return False

        return True

    def check_valid_values(self):
        for line in self.matrix:
            for val in line:
                if type(val) is not int:
                    return False

        return True


def chunks(l, n):
    for i in range(0, len(l), n):
        yield(l[i:i + n])

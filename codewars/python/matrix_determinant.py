# Codewars kata link: https://www.codewars.com/kata/52a382ee44408cea2500074c


def determinant(matrix):
    det = 0

    if len(matrix) == 1:
        return matrix[0][0]

    if len(matrix) > 2:
        for i in range(len(matrix)):

            mult = 1
            if i % 2 == 1:
                mult = (-1)

            matrix_mi = []

            for idx in range(len(matrix)):
                matrix_mi.append(matrix[idx][:i] + matrix[idx][i+1:])

            matrix_mi.pop(0)

            det += mult * matrix[0][i] * determinant(matrix_mi)

        return det

    return matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0]

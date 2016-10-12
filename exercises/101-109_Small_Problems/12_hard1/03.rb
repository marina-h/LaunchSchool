# Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns
# the transpose of the original matrix. Note that there is a Array#transpose
# method that does this -- you may not use it for this exercise. You also are
# not allowed to use the Matrix class from the standard library. Your task is to
# do this yourself.  Take care not to modify the original matrix: you must
# produce a new matrix and leave the original matrix unchanged.

def transpose(matrix)
  transposed = []
  matrix.each_index do |idx|
    transposed << [matrix[0][idx], matrix[1][idx], matrix[2][idx]]
  end
  transposed
end

# any size:
# def transpose(matrix)
#   0.upto(matrix.size - 1).map do |col|
#     matrix.map do |row|
#       row[col]
#     end
#   end
# end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]] # true
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]     # true

# In the previous exercise, you wrote a method to transpose a 3 x 3 matrix as
# represented by a ruby Array of Arrays.  Matrix transposes aren't limited to 3
# x 3 matrices, or even square matrices. Any matrix can be transposed by simply
# switching columns with rows.  Modify your transpose method from the previous
# exercise so it works with any matrix with at least 1 row and 1 column.

def transpose(matrix)
  transposed = []
  num_columns = matrix.first.length
  num_rows = matrix.length

  (0...num_columns).each do |col|
    row_to_add = []
    (0...num_rows).each do |row|
      row_to_add << matrix[row][col]
    end
    transposed << row_to_add
  end

  # another version:
  # (0...num_columns).each do |column_index|
  #   new_row = (0...num_rows).map do |row_index|
  #     matrix[row_index][column_index]
  #   end
  #   result << new_row
  # end

  transposed
end

# shorter!
def transpose(matrix)
  (0...matrix.first.length).map do |col|
    matrix.map { |row| row[col] }
  end
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]

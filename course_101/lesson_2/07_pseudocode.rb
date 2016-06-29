# 7. Pseudocode

# Pseudocode for a method that returns the sum of two integers
# A. Casual:
Given two integers

Add first and second integers together

Return sum

# B. Formal:
START

# Given two integers

SET number1 = first integer
SET number2 = second integer

SET sum = number1 + number2

PRINT sum

END

# Pseudocode for a method that takes an array of strings, and returns a string that is all those strings concatenated together
# A. Casual:
Given an array of strings

Initialize an empty string

Iterate through the array, adding each string to the earlier string

Return concatenated string

# B. Formal:
START

# Given an array of strings

SET iterator = 0
SET concatenated_str = ""

WHILE iterator < length of array
  SET concatenated_str = concatenated_str + next string
  iterator = iterator + 1

PRINT concatenated_str

END

# Pseudocode for a method that takes an array of integers, and returns a new array with every other element
# A. Casual:
Given an array of integers

Initialize an empty array

Iterate through the array, one by one
  - skip positions in the array with an odd index
  - add integers in even positions of the array to new array

Return the new array

# B. Formal:

START

# Given an array of integers

SET iterator = 0
SET new_array = []

WHILE iterator < array.length
  IF iterator % 2 == 0
    SET new_array = new_array + current integer
    iterator = iterator + 1
  ELSE
    iterator = iterator + 1

PRINT new_array

END

# Given an array of strings

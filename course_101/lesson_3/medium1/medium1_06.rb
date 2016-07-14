# Exercises: Medium 1
# Question 6

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

# In the first method, the buffer array is mutated in-place.
# In the second method, a new buffer is created each time it is called,
# and does not mutate the original buffer.

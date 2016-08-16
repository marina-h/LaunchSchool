# Write a method that will take a short line of text, and print it within a box.

def create_line(ends_char, fill_char, length)
  "#{ends_char}#{fill_char * length}#{ends_char}"
end

def print_in_box(text)
  text_chunks = text.scan(/.{1,76}/)
  fill_length = text.length < 76 ? text.length + 2 : 78
  start_and_end = create_line('+', '-', fill_length)
  fill = create_line('|', ' ', fill_length)

  puts start_and_end
  puts fill
  text_chunks.each { |chunk| puts "| #{chunk.ljust(fill_length - 2)} |" }
  puts fill
  puts start_and_end
end

print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+
print_in_box('To boldly go where no one has gone before. To boldly go where ' \
             'no one has gone before. To boldly go where no one has gone ' \
             'before. To boldly go where no one has gone before.')
#  +------------------------------------------------------------------------------+
#  |                                                                              |
#  | To boldly go where no one has gone before. To boldly go where no one has gon |
#  | e before. To boldly go where no one has gone before. To boldly go where no o |
#  | ne has gone before.                                                          |
#  |                                                                              |
#  +------------------------------------------------------------------------------+

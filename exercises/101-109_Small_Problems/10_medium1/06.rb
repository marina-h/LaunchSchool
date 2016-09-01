# Write a method that implements a miniature stack-and-register-based
# programming language that has the following commands:

# n Place a value n in the "register"
# PUSH Push the register value on to the stack
# ADD Add value on stack to the register value
# SUB Subtract value on stack from the register value
# MULT Multiply value on stack by the register value
# DIV Divide value on stack into the register value
# MOD Divide value on stack into the register value and leave remainder
# POP Remove item from stack and place in register
# PRINT print the register value
# ADD, SUB, MULT, DIV, and MOD all remove the topmost item from the stack,
# perform the operation, and leave the result in the register.

# All operations are integer operations (which is only important with DIV and
# MOD). Programs will be supplied to your language method via a string passed in
# as an argument. Your program may assume that all programs are correct
# programs; that is, they won't do anything like try to pop a non-existent value
# from the stack, and they won't contain unknown tokens.

# You should initialize the register to 0.

def do_operation(register, stack, cmd)
  case cmd
  when 'PUSH'  then stack.push(register)
  when 'POP'   then register = stack.pop
  when 'ADD'   then register += stack.pop
  when 'SUB'   then register -= stack.pop
  when 'MULT'  then register *= stack.pop
  when 'DIV'   then register /= stack.pop
  when 'MOD'   then register %= stack.pop
  when 'PRINT' then puts register
  end
  return register, stack
end

def minilang(program)
  register = 0
  stack = []

  commands = program.split
  commands.each do |command|
    if command.to_s == command.to_i.to_s
      register = command.to_i
    else
      register, stack = do_operation(register, stack, command)
    end
  end
end

# One-method version:
# def minilang(program)
#   stack = []
#   register = 0
#   program.split.each do |token|
#     case token
#     when 'ADD'   then register += stack.pop
#     when 'DIV'   then register /= stack.pop
#     when 'MULT'  then register *= stack.pop
#     when 'MOD'   then register %= stack.pop
#     when 'SUB'   then register -= stack.pop
#     when 'PUSH'  then stack.push(register)
#     when 'POP'   then register = stack.pop
#     when 'PRINT' then puts register
#     else              register = token.to_i
#     end
#   end
# end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# # 15
#
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8
#
minilang('5 PUSH POP PRINT')
# # 5
#
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7
#
minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6
#
minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12
#
minilang('-3 PUSH 5 SUB PRINT')
# # 8
#
minilang('6 PUSH')
# # (nothing printed; no PRINT commands)

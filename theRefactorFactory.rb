$VERBOSE = nil    # We'll explain this at the end of the lesson.
require 'prime'   # This is a module. We'll cover these soon!

def first_n_primes(n)

  unless n.is_a? Integer
    return "n must be an integer."
  end

  if n <= 0
    return "n must be greater than 0."
  end
  
  prime_array = [] if prime_array.nil?
  
  prime = Prime.new
  for num in (1..n)
    prime_array.push(prime.next)
  end
  return prime_array
end

first_n_primes(10)

# Refactoring

# step 2/4

require 'prime'   # This is a module. We'll cover these soon!

def first_n_primes(n)
  
    return "n must be an integer." unless n.is_a? Integer
  
    return "n must be greater than 0." if n <= 0

  return Prime.first n
end

first_n_primes(10)

# step 3/4

require 'prime'   # This is a module. We'll cover these soon!

def first_n_primes(n)
  return "n must be an integer." unless n.is_a? Integer
  return "n must be greater than 0." if n <= 0
  Prime.first n
end

first_n_primes(10)
👋 = "Hi Dad!"
println(👋)

# use \pi then hit enter to turn it into unicode
circ = 10 * 2π

str = "The circumference is $circ"

# string parsing abilities are great
occursin(r"^\s(?:#|$)", str)

# can use unicode on functions as well!
function Σ(a,b)
    a+b
end

# shorten functions with just an equals sign (basically a lambda function from Python)
Σ(a,b) = a + b

# "since functions are 1st class objects, they can be assigned to a variable or passed to another function anonymously":
Σ = (a,b) -> a + b
# I think the above is assigning to Σ two variables (a,b) then passing those to the + function/operation so when Σ is called, it adds (a,b). 

#callme(Σ)

# 1 function, 2 methods:
func(x) = print("anything goes")
func(x::Float64) = print("it floats")
func(x::Int) = print("it is whole")

#func(23) dispatches the Int method

# we can pass a type as a parameter. called "parametric types", and use keywords like 'where' to perform logic on the type itself. In this case, Julia will assert that both types are the same
func(x::T, y::T) where {T} = print("types match!")

# julia is not object-oriented
# but does support structs ("composite types" in compsci speak)

struct Human
    dna::Float64
    weight::Int
    bio
end

# Julia has tons of built-in support for arrays
arr1D = [1, 2, 3, 4]
arr2D = [1, 2; 3, 4]
matrix = zeros(Int8, 3, 3) # will create a 3x3 matrix of zeros

# supports asynchronous computing with its 'task' model
# this can pause and sync the execution of code 

t = @task begin; sleep(5); println("done"); end

# distributed computing
r = remotecall(rand, 2, 2, 2)

s = @spawnat 2 1 .+ fetch(r)
fetch(s)

# btw Julia can run natively on a GPU!!


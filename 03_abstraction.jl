# Filling arrays with elements.

println("\n\n\n\n\n\n\n\n=== Beginning Abstraction Protocol ===\n")

element = 1 // 1; # // is different than ÷ or / because it produces rational numbers.

arry = fill(element, 3, 3);

println("Arry:\n", arry); # Arry is now `Rational{Int64}`, a composite type of rational numbers composed of int64's

# Typing and such

println("")
type_tracking = [typeof(1), typeof(1.0), typeof(1//1), typeof(1/1)]


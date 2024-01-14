#a recursive method that return the nth fibonacci number

fibonacci := method(n,
    if(n <= 1,
        n, 
        fibonacci(n-1)+fibonacci(n-2)
    )
)
"Fibonacci 6th element" 
fibonacci(6) println

# modify the / operator to return 0 if the denominator is 0, given that we cant override an operator from the operator table
# we have to add a custom operator

// Add a new operator '%%' to the operator table
OperatorTable addOperator("%%", 1)

// Define the behavior of '%%'
Number %% := method(other,
    if(other == 0 or other == nil,
        0,
        self / other
    )
)

// Example usage
result := 5 %% 0  // Should return 0
result1 := 10 %% 5  // Should perform normal division and return 2

"Results:"
result println
result1 println

# write a program to add up all the numbers in a 2-dimensional array

sum2DArray := method(array,
    sum := 0
    array foreach(row, 
        row foreach(element, 
            sum = sum + element
        )
    )
    sum
)

twoDimensionalArray := list(
    list(1, 2, 3),
    list(4, 5, 6)
)

totalSum := sum2DArray(twoDimensionalArray)
("Total Sum: " .. totalSum) println

# add a slot called my average to the list prototype

List myAverage := method(
    sum := 0
    self foreach(element, sum = sum + element)
    sum / self size
)

// Example usage
myList := list(1, 2, 3, 4, 5)
avg := myList myAverage
("Average: " .. avg) println

myList1 := list("a")
avg1 := myList1 myAverage

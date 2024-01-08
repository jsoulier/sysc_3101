"""
SYSC 3101 Winter 2024
Lab 1, Part 1, Test harness for exercises 1,2 and 3
"""
from lab1 import power,perrin,count_in_list

# recursive power() function. If power() is correct, the two values
# should be the same, or differ at most by a small amount.
 
def test_power(x:float, k:int):
    print(f"Calling power(x, k) with x = {x}, k = {k}\n")
    expected = x ** k
    print(f"Expected result: {expected}")
    actual = power(x, k)
    print(f"actual result: {actual}")
    if abs(actual - expected) < 0.001:
        print("pass\n\n")
    else:
        print("ERROR!\n\n");
    
    return

def test_exercise_1():
    """
    Test cases that allow us to verify if power() correctly calculates 
     3.5 ^ 0, 3.5 ^ 1, 3.5 ^ 2, 3.5 ^ 3 and 3.5 ^ 4.
    """
    print("*** Exercise 1: Testing power ***\n")
    test_power(3.5, 0)
    test_power(3.5, 1)
    test_power(3.5, 2)
    test_power(3.5, 3)
    test_power(3.5, 4)
    print()


test_exercise_1()

# for exercise 2 write your test cases to demo your code to the TA

def test_perrin(n, expected):
    print(f"Calling perrin(n, expected) with n = {n}, expected = {expected}\n")
    actual = perrin(n)
    print(f"actual result: {actual}")
    if expected == actual:
        print("pass\n\n");
    else:
        print("ERROR!\n\n")

def test_exercise_2():
    print("*** Exercise 2: Testing perrin ***\n");
    test_perrin(0, 3)
    test_perrin(1, 0)
    test_perrin(2, 2)
    test_perrin(3, 3)
    test_perrin(4, 2)
    test_perrin(5, 5)
    test_perrin(6, 5)
    test_perrin(7, 7)
    test_perrin(8, 10)
    test_perrin(9, 12)
    test_perrin(10, 17)
    test_perrin(11, 22)
    test_perrin(12, 29)
    test_perrin(13, 39)
    print()

test_exercise_2()

""" Exercise the recursive count_in_list function. 
 * Display the result we expect count_in_list() to return, followed by
 * the actual value calculated by the function.
 * Parameter my_list is the list that will be passed to count_in_list().
 * Parameter n is the number of elements in the list.
 * Parameter target is the value that count_in_list() will search for.
 * Parameter expected is the result that a correct implementation of 
 * count_in_list() will return.
 """

def test_count_in_list(my_list, n, target,  expected):
    print(f"Calling count_in_list with my_list ={my_list} ")
    print(f", n = {n}, target = {target}\n")
    print(f"Expected result: {expected} ")
    actual = count_in_list(my_list,n, target)
    print(f"actual result: {actual}" )
    if (expected == actual):
        print("pass\n\n")
    else:
        print("ERROR!\n\n")
    return

def test_exercise_3():
    print("*** Exercise 3: Testing count_in_list ***\n");
    x = [ 1, 3, 3, 4, 4, 5, 4, 6 ];

    n = len(x)

    # Test case: count_in_list(x, n, 1) should return 1. */
    test_count_in_list(x, n, 1, 1)
    
    #/* Test case: count_in_list(x, n, 2) should return 0. */
    test_count_in_list(x, n, 2, 0)

    #/* Test case: count_in_list(x, n, 3) should return 2. */
    test_count_in_list(x, n, 3, 2)

    #/* Test case: count_in_list(x, n, 4) should return 3. */
    test_count_in_list(x, n, 4, 3)

    #/* Test case: count_in_list(x, n, 5) should return 1. */
    test_count_in_list(x, n, 5, 1)

    #/* Test case: count_in_list(x, n, 6) should return 1. */
    test_count_in_list(x, n, 6, 1)
    print()

test_exercise_3()

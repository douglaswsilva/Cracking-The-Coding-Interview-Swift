//: Playground - noun: a place where people can play

import UIKit

/* Question 3.2 - How would you design a stack which, in addition to push and pop, has a function min which returns the minimum element? Push, pop, and min should all operate in O(1) time.
 
 
    Create another stack, minStack. When we push, if the value is smaller than minStack.peek(), we push the value to stack and minStack. When we pop, we check if the value is equal to minStack.peek(), if yes, we pop from both stacks, if no we only pop from the main stack. 
 
 */
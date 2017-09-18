//: Playground - noun: a place where people can play

import UIKit

/* Question 3.2 - How would you design a stack which, in addition to push and pop, has a function min which returns the minimum element? Push, pop, and min should all operate in O(1) time.
 
 
    Create another stack, minStack. When we push, if the value is smaller than minStack.peek(), we push the value to stack and minStack. When we pop, we check if the value is equal to minStack.peek(), if yes, we pop from both stacks, if no we only pop from the main stack.
 
 */


func rotation(n: Int, d: Int, array: [Int]?) -> [Int]?{
    
    if n < d {
        return nil
    }
    
    if n < 0 {
        return nil
    }
    
    if d < 0 {
        return nil
    }
    
    if n != array?.count {
        return nil
    }
    
    if array != nil {
        
        var N = array!
        var finalArray = [Int]()
        var firstArray = [Int]()
        
        for i in 0 ..< N.count {
            if i < d {
                finalArray.append(N[i])
            }
            else {
                firstArray.append(N[i])
            }
        }
        
        return (firstArray + finalArray)
    }
    
    return nil
}

func printRotation (array: [Int]?) {
    
    if array != nil {
        for element in array! {
            print(element, terminator: " ")
        }
    }
}

let a = rotation(n: 3, d: 2, array: [344, 210, 102])
printRotation(array: a)

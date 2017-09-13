//: Playground - noun: a place where people can play

import UIKit

//Implementation of LinkedList
class Node<T: Equatable> {
    var value: T? = nil
    var next: Node? = nil
}

class LinkedList<T: Equatable> {
    var head = Node<T>()
    
    func insert(value: T) {
        //find to see if empty list
        if self.head.value == nil {
            self.head.value = value
        } else {
            //find the last node without a next value
            var lastNode = self.head
            while lastNode.next != nil {
                lastNode = lastNode.next!
            }
            //once found, create a new node and connect the linked list
            let newNode = Node<T>()
            newNode.value = value
            lastNode.next = newNode
        }
    }
    
    func remove(value: T) {
        //Check if the value is at the head
        if self.head.value == value {
            self.head = self.head.next!
        }
        //Traverse the linked list to see if node is in the linked list
        if self.head.value != nil {
            var node = self.head
            var previousNode = Node<T>()
            //If value found, exit the loop
            while node.value != value && node.next != nil {
                previousNode = node
                node = node.next!
            }
            //once found, connect the previous node to the current node's next
            if node.value == value {
                if node.next != nil {
                    previousNode.next = node.next
                } else {
                    //if at the end, the next is nil
                    previousNode.next = nil
                }
            }
        }
    }
}


struct Stack<Element> {
    fileprivate var array: [Element] = []
    
    mutating func push(_ element: Element) {
        array.append(element)
    }
    
    mutating func pop() -> Element? {
        return array.popLast()
    }
    
    func peek() -> Element? {
        return array.last
    }
}


func isPermutationOfPalindrome(head: Node<String>?) -> Bool{
    
    var dictionary = [String: Int]()
    var curr = head
    var countOdd = 0
    
    while curr != nil {
        if dictionary[(curr!.value)!] == nil {
            dictionary[(curr?.value)!] = 1
        }
        else{
            dictionary[(curr?.value)!] = (dictionary[(curr?.value)!])! + 1
        }
        
        curr = curr?.next
    }
    
    for key in dictionary {
        if (dictionary[key.key])! % 2 != 0 {
            countOdd += 1
        }
    }

    if countOdd > 1 {
        return false
    }
    
    return true
}


func isPalindrome(head: Node<String>?) -> Bool {
    
    var curr = head
    var myStack = Stack<String>()
    
    while curr != nil {
        myStack.push((curr?.value)!)
        curr = curr?.next
    }
    
    curr = head
    
    while curr != nil {
        if myStack.pop()! != (curr?.value)! {
            return false
        }
        curr = curr?.next
    }
    
    return true
}

var list = LinkedList<String>()

list.insert(value: "a")
list.insert(value: "b")
list.insert(value: "c")
list.insert(value: "b")
list.insert(value: "a")


var newList = isPalindrome(head: list.head)
print(newList)









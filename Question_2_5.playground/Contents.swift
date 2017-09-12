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


func sumLists(list1: Node<Int>?, list2: Node<Int>?) -> LinkedList<Int> {
    
    let newList = LinkedList<Int>()
    
    var curr1 = list1
    var curr2 = list2
    
    var strValue1 = ""
    var strValue2 = ""
    
    while curr1 != nil {
        strValue1 = strValue1 + String(curr1!.value!)
        curr1 = curr1?.next
    }
    
    strValue1 = String(strValue1.characters.reversed())
    
    while curr2 != nil {
        strValue2 = strValue2 + String(curr2!.value!)
        curr2 = curr2?.next
    }
    
    strValue2 = String(strValue2.characters.reversed())
    
    
    let intValue1 = Int(strValue1)
    let intValue2 = Int(strValue2)
    
    let newIntValue = intValue1! + intValue2!
    
    var newStrValue = String(newIntValue)
    
    newStrValue = String(newStrValue.characters.reversed())
    
    for char in newStrValue.characters{
        newList.insert(value: Int(String(char))!)
    }
    
    return newList
}

var list1 = LinkedList<Int>()

list1.insert(value: 7)
list1.insert(value: 1)
list1.insert(value: 6)

var list2 = LinkedList<Int>()

list2.insert(value: 5)
list2.insert(value: 9)
list2.insert(value: 2)


func printList(_ head: Node<Int>?){
    if head != nil{
        print(head!.value ?? 0)
        printList(head?.next)
    }
}

//printList(list1.head)
//printList(list2.head)

var newList = sumLists(list1: list1.head, list2: list2.head)
printList(newList.head)






















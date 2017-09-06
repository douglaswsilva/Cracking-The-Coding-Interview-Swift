//: Playground - noun: a place where people can play

import UIKit

func strCompression(string: String) -> String {
    var dictionary = [String: Int]()
    var reduce = false
    var strl = string.lowercased()
    
    for a in string.characters{
        var c = String(a)
        if dictionary[c] == nil{
            dictionary[c] = 1
        }
        else{
            let val = dictionary[c] ?? 0
            dictionary[c]! = val + 1
            reduce = true
        }
    }
    
    var newString = ""
    for (c,i) in dictionary{
        newString += c + String(i)
    }
    
    if reduce{
        return newString
    }
    
    return string
}

print(strCompression(string:"aabbbccccaaa"))
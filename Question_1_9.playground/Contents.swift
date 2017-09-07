//: Playground - noun: a place where people can play

import UIKit

func isARotation(s1:String, s2:String) -> Bool {
    if s1 == s2{
        return true
    }
    
    if s1.characters.count != s2.characters.count{
        return false
    }
    
    var before = ""
    var after = ""
    
    let s2Initial = s2.characters[s2.characters.startIndex]
    var numberOfS2Initial = 0
    var count = 0
    
    for i in s2.characters{
        if i == s2Initial {
            numberOfS2Initial += 1
        }
    }
    
    while before + after != s1 && count <= numberOfS2Initial{
        for ch in s1.characters{
            let c = String(ch)
            if c == String(s2Initial) || after.characters.count > 0{
                after += c
            }
            else{
                before += c
            }
        }
        count += 1
    }
    
    if before + after == s1 {
        return true
    }
    return false
}

print(isARotation(s1: "waterbottle", s2: "erbottlewat"))


// Book Solution

func isARotationBook(str1: String, str2: String) -> Bool{
    
    let string = str1 + str1
    
    if string.range(of:str2) != nil{
        return true
    }
    
    return false
}

print(isARotationBook(str1: "waterbottle", str2: "erbottlewat"))






















//: Playground - noun: a place where people can play

import UIKit
import Foundation

func oneAway(str1: String, str2: String ){
    if (str1 == str2){
        return true
    }
    else if (str1.count) == (str2.count + 1){
        return compare(str1: str1, str2: str2)
    }
    else if (str1.count - 1) == (str2.count){
        return  compare(str1: str2, str2: str1)
    }
    else{
        var count = 0
        for i in 0 ... str1.count{
            if str1[i] != str2[i]{
                count += 1
            }
        }
        if count <= 1{
            return true
        }
    }
    
    return false
}

func compare(str1: String, str2: String){
    var newString = ""
    for(c in str1){
        if str2.contains(c) {
            newString += c
        }
    }
    if newStr == str2{
        return true
    }
    return false
}

print(oneAway(str1: 'pale', str2: 'ple'))
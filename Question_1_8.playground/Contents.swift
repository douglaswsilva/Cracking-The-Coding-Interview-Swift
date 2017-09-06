//: Playground - noun: a place where people can play

import UIKit

func setToZero(matrix: [[Int]]) -> [[Int]] {
    var newMatrix = matrix
    let N = matrix.count
    let M = matrix[0].count
    
    var i0: [Int] = []
    var j0: [Int] = []
    
    for i in 0..<N{
        for j in 0..<M{
            if matrix[i][j] == 0{
                i0.append(i)
                j0.append(j)
            }
        }
    }
    
    for i in 0..<N{
        for j in 0..<M{
            if (i0.contains(i) || j0.contains(j)){
                newMatrix[i][j] = 0
            }
        }
    }
    
    return newMatrix
}

print (setToZero(matrix: [[1,2,3],[4,5,6],[7,8,9], [10,11,12]]))

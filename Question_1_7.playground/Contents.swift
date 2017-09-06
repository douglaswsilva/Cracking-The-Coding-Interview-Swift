//: Playground - noun: a place where people can play

import UIKit

func flipMatrix(matrix: [[Int]]) -> [[Int]]{
    
    let size = matrix.count - 1
    var newMatrix = matrix
    
    for i in 0...size{
        for j in 0...i{
            let temp = newMatrix[i][j]
            newMatrix[i][j] = newMatrix[j][i]
            newMatrix[j][i] = temp
        }
    }
    
    return newMatrix
}


func rotateMatrix(matrix: [[Int]]) -> [[Int]]{
    
    let n = (matrix.count)
    var newMatrix = matrix
    
    for layer in 0...n/2{
        var first = layer
        var last = n - layer - 1
        
        for i in first..<last{
            var offset = i - first
//            print(layer,i,first,last,offset)

            // save top
            let top = newMatrix[first][i]
            // left -> top
            newMatrix[first][i] = newMatrix[last - offset][first]
            // bottom -> left
            newMatrix[last - offset][first] = newMatrix[last][last-offset]
            // right -> bottom
            newMatrix[last][last-offset] = newMatrix[i][last]
            // top -> right
            newMatrix[i][last] = top
            
//            let temp = newMatrix[0][0]
//            newMatrix[0][0] = newMatrix[0][2]
//            newMatrix[0][2] = newMatrix[2][2]
//            newMatrix[2][2] = newMatrix[2][0]
//            newMatrix[2][0] = temp
        }
    }
    
    return newMatrix
}


print(rotateMatrix(matrix: [[1,2,3], [4,5,6], [7,8,9]]))
//print(flipMatrix(matrix: [[1,2,3], [4,5,6], [7,8,9]]))






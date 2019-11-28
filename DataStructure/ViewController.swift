//
//  ViewController.swift
//  DataStructure
//
//  Created by Raman Goyal on 14/11/19.
//  Copyright © 2019 Raman Goyal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ViewController {
    
    
    //https://www.interviewbit.com/problems/maximum-absolute-difference/
    func maxArr(_ A: inout [Int]) -> Int {
        
        var max1 = Int.min
        var max2 = Int.min
        var max3 = Int.min
        var max4 = Int.min
        var result = Int.min
        
        for i in 0..<A.count {
            max1 = max(max1, A[i] + 1)
            max2 = max(max2, -A[i] + 1)
            max3 = max(max3, A[i] - 1)
            max4 = max(max4, -A[i] - 1)
        }
        
        for i in 0..<A.count {
            result = max(result, max1 - (A[i] + 1))
            result = max(result, max2 - (-A[i] + 1))
            result = max(result, max3 - (A[i] - 1))
            result = max(result, max4 - (-A[i] - 1))
        }
        
        return result

    }
    
    //https://www.interviewbit.com/problems/max-sum-contiguous-subarray/
    func maxSubArray(_ A: [Int]) -> Int {
        
        var tempSum = 0
        var maxSum = A[0]
        var tempIndex = 0
        var startIndex = 0
        var endIndex = 0
        
        for (index,element) in A.enumerated() {
            tempSum = tempSum + element
            
            if tempSum > maxSum {
                maxSum = tempSum
                startIndex = tempIndex
                endIndex = index
            }
            
            if tempSum <= 0 {
                tempSum = 0
                tempIndex = index + 1
            }
        }
        return maxSum
    }
    
    //https://www.interviewbit.com/problems/add-one-to-number/
    func plusOne(_ A: inout [Int]) -> [Int] {
        guard A.count > 0 else { return [] }
        
        var outputArray = [Int]()
        var carry = 1
        for element in A.reversed() {
            print(element)
            let newValue = element + carry
            carry = newValue / 10
            if carry > 0 {
                outputArray.append(newValue % 10)
            }else {
                outputArray.append(newValue)
            }
        }
        
        if carry > 0 {
            outputArray.append(carry)
        }
        
        return outputArray.reversed()
    }
    
    //https://www.interviewbit.com/problems/min-steps-in-infinite-grid/
    func coverPoints(_ A: inout [Int], _ B: inout [Int]) -> Int {
    
        if A.count != B.count || A.count == 0 || A.count == 1 {
            return 0
        }
        var distance = 0
        for i in 0 ..< A.count - 1 {
            let x1 = A[i]
            let y1 = B[i]
            let x2 = A[i + 1]
            let y2 = B[i + 1]
            distance += distanceBetweenPoints((x1, y1), (x2, y2))
        }
        return distance
    }
    func distanceBetweenPoints(_ a: (x: Int, y: Int), _ b: (x: Int, y: Int)) -> Int {
        return (abs(a.y - b.y) - abs(a.x - b.x)) > 0 ? abs(a.y - b.y) : abs(a.x - b.x)
    }
    
    //https://www.interviewbit.com/problems/spiral-order-matrix-i/
    @discardableResult
    func spiralOrder(_ A: [[Int]]) -> [Int] {
        var t = 0
        var b = A.count - 1
        var l = 0
        var r = A[0].count - 1
        var dir = 0
        var outputArray: [Int] = []
        
        while (l <= r && t <= b) {
            if (dir == 0) {
                for index in stride(from: l, through: r, by: 1) {
                    outputArray.append(A[t][index])
                }
                t += 1
            } else if (dir == 1) {
                for index in stride(from: t, through: b, by: 1) {
                    outputArray.append(A[index][r])
                }
                r -= 1
            } else if (dir == 2) {
                for index in stride(from: r, through: l, by: -1) {
                    outputArray.append(A[b][index])
                }
                b -= 1
            } else if (dir == 3) {
                for index in stride(from: b, through: t, by: -1) {
                    outputArray.append(A[index][l])
                }
                l += 1
            }
            dir = (dir + 1)%4
        }
        
        return outputArray
    }

}


//MARK:- Grab Hackathon
extension ViewController {
    
    func adjecentMatrix(_ A: [[Int]]) -> Int {
        if A.isEmpty {
            return 0
        }
        let row = A.count
        let column = A[0].count
        
        //horizontal check
        for i in 0..<row {
            var j = 0
            while (j < column) && (j+1 < column) {
                if A[i][j] == A[i][j+1] {
                    return 0
                }
                j += 1
            }
        }
        
        //vertical check
        for i in 0..<column {
            var j = 0
            while (j < row) && (j+1 < row) {
                if A[j][i] == A[j+1][i] {
                    return 0
                }
                j += 1
            }
        }
        return 1
    }
}


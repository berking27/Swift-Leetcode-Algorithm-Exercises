//
//  main.swift
//  Algorithms
//
//  Created by Berkin Demirel on 30.07.2024.
//

import Foundation

//MARK: - Exercise-1
func squareDigits(_ num: Int) -> Int {
    
    let digitArray = String(num).compactMap { Int($0.description).map { $0 * $0 } }
    let squaredDigitArray = digitArray.map { String($0) }.joined()
    
    return Int(squaredDigitArray) ?? 0
    
}

print(squareDigits(9119))

//MARK: - Day-1 Two-Sum
//https://leetcode.com/problems/two-sum/description/
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    for (index, num) in nums.enumerated() {
        let secondNum = nums.filter({$0 == (target - num)})
        
        if let index2 = nums.firstIndex(of: secondNum[0]), index != index2 {
            return [index, index2]
        }
    }
    
    return [0]
}

print(twoSum([3,2,4], 6))

//MARK: -Day-2 Palindrome
//https://leetcode.com/problems/palindrome-number/
func isPalindrome(_ x: Int) -> Bool {
    let palindromeStr = String(x)
    let reversedStr = String(palindromeStr.reversed())
    
    if String(reversedStr) == palindromeStr {
        return true
    } else {
        return false
    }
}

print(isPalindrome(121))

//MARK: - Roman To Integer
//https://leetcode.com/problems/roman-to-integer/
func romanToInt(_ s: String) -> Int {
    var romanNumber = 0
    var previousValue = 0
    let romanValues: [Character: Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    ]
    
    for char in s.reversed() {
        let value = romanValues[char]!
        
        if value >= previousValue {
            romanNumber += value
        } else {
            romanNumber -= value
        }
        
        previousValue = value
    }
    
    return romanNumber
}

print(romanToInt("MCMXCIV"))


//MARK: - Longest Common Prefix
//https://leetcode.com/problems/longest-common-prefix/description/
func longestCommonPrefix(_ strs: [String]) -> String {
    let arrayOfArray = strs.map({Array($0)})
    var prefix = ""
    
    for y in 0..<arrayOfArray[0].count {
        let currentChar = arrayOfArray[0][y]
        var isAllMatch = true
        
        for x in 0..<arrayOfArray.count {
            if y >= arrayOfArray[x].count || arrayOfArray[x][y] != currentChar {
                isAllMatch = false
                break
            }
        }
        
        if isAllMatch {
            prefix.append(currentChar)
        } else {
            break
        }
        
    }
    return prefix
}

//MARK: - Valid Paranthesis
//https://leetcode.com/problems/valid-parentheses/description/
func isValid(_ s: String) -> Bool {
    func shouldStackPop(closingChar: Character) -> Bool {
        guard let matchingOpenChar = matchingPairs[closingChar] else {
            return true
        }
        return paranthesStack.isEmpty || paranthesStack.last != matchingOpenChar
        
    }
    
    var paranthesStack: [Character] = []
    var matchingPairs: [Character: Character] = [")": "(", "]": "[", "}": "{"]
    
    
    for char in s {
        switch char {
        case "(", "[", "{":
            paranthesStack.append(char)
            
        case ")", "]", "}":
            if shouldStackPop(closingChar: char) {
                return false
            }
            paranthesStack.removeLast()
            
        default:
            return false
        }
        
    }
    
    return paranthesStack.isEmpty
    
}

print(isValid("[]"))

//MARK: - Merge Two Sorted Lists
//https://leetcode.com/problems/merge-two-sorted-lists/
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    let dummy = ListNode(0)
    var current = dummy
    
    var l1 = list1
    var l2 = list2
    
    while let firstList = l1, let secondList = l2 {
        if firstList.val <= secondList.val {
            current.next = firstList
            l1 = firstList.next
        } else {
            current.next = secondList
            l2 = secondList.next
        }
        current = current.next!
    }
    
    current.next = l1 ?? l2
    
    return dummy.next
}


//MARK: - Remove Duplicates From Sorted Array
//https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/
func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 1 else { return nums.count }
    var index = 0
    
    for i in 1..<nums.count {
        if nums[index] == nums[i] {
            index += 1
            nums[index] = nums[i]
        }
    }
    
    return index + 1
}



var array = [1,1,2,3,3,4,4,5,5]
let k = removeDuplicates(&array)
print(k)

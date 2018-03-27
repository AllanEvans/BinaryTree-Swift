//
//  BinaryTree.swift
//  BinaryTree
//
//  Created by Allan Evans on 8/25/16.
//  Copyright © 2016 Aelyssum Corp. All rights reserved.
//

import Foundation

class BinaryTree<B: Comparable> {
    
    class Tree: CustomDebugStringConvertible {
        var value: B
        var rightTree: Tree?
        var leftTree: Tree?
        var depth: Int {
            return max((leftTree?.depth ?? 0), (rightTree?.depth ?? 0)) + 1
        }
        var count: Int {
            return (leftTree?.count ?? 0) + (rightTree?.count ?? 0) + 1
        }
        var isRightHeavy: Bool {
            return (rightTree?.depth ?? 0) > (leftTree?.depth ?? 0)
        }
        var isLeftHeavy: Bool {
            return (leftTree?.depth ?? 0) > (rightTree?.depth ?? 0)
        }
        var isBalanced: Bool {
            return abs((leftTree?.depth ?? 0) - (rightTree?.depth ?? 0)) < 2
        }
        
        var isLeaf: Bool {
            return leftTree == nil && rightTree == nil
        }
        
        init(value: B) {
            self.value = value
        }
        
        func insert(_ newValue: B) -> Tree {
            
            func insertRight(_ newValue: B) -> Tree {
                rightTree = rightTree!.insert(newValue)
                if rightTree!.depth > (leftTree?.depth ?? 0)+1 {
                    print("Rotating left at node \(self.value)")
                    if rightTree!.isLeftHeavy {
                        rightTree = rightTree!.rotateRight()
                    }
                    return rotateLeft()
                } else {
                    return self
                }
            }
            
            func insertLeft(_ newValue: B) -> Tree {
                leftTree = leftTree!.insert(newValue)
                if leftTree!.depth > (rightTree?.depth ?? 0)+1 {
                    if leftTree!.isRightHeavy {
                        leftTree = leftTree!.rotateLeft()
                    }
                    return rotateRight()
                } else {
                    return self
                }
            }
            
            if newValue > value {
                guard rightTree != nil else {
                    rightTree = Tree(value: newValue)
                    return self
                }
                return insertRight(newValue)
            } else if newValue < value {
                guard leftTree != nil else {
                    leftTree = Tree(value: newValue)
                    return self
                }
                return insertLeft(newValue)
            } else {
                return self
            }
        }
        
        func contains(_ value: B) -> Bool {
            if self.value == value {
                return true
            } else if value > self.value {
                return rightTree?.contains(value) ?? false
            } else {
                return leftTree?.contains(value) ?? false
            }
        }
        
        func remove(_ value: B) -> Tree? {
            if self.value == value && self.isLeaf {
                return nil
            }
            if self.value == value && rightTree != nil {
                self.value = rightTree!.minValue
                rightTree = rightTree!.remove(self.value)
                return self
            } else if self.value == value && leftTree != nil {
                self.value = leftTree!.maxValue
                leftTree = leftTree!.remove(self.value)
                return self
            } else if value > self.value {
                rightTree = rightTree?.remove(value)
                return self
            } else {
                leftTree = leftTree?.remove(value)
                return self
            }
        }
        
        var minValue: B {
            guard let left = leftTree else {
                return value
            }
            return left.minValue
        }
        
        var maxValue: B {
            guard let right = rightTree else {
                return value
            }
            return right.maxValue
        }
        
        var enumerated: [B] {
            var returnArray = [B]()
            if let left = leftTree {
                returnArray.append(contentsOf: left.enumerated)
            }
            returnArray.append(value)
            if let right = rightTree {
                returnArray.append(contentsOf: right.enumerated)
            }
            return returnArray
        }
        
        func index(of value: B, startingCount: Int) -> Int? {
            if self.value == value {
                return startingCount
            } else if value < self.value {
                return leftTree?.index(of: value, startingCount: startingCount)
            } else {
                return rightTree?.index(of: value, startingCount: startingCount+(leftTree?.count ?? 0)+1)
            }
        }
        
        func rotateLeft() -> Tree {
            let returnTree = rightTree!
            self.rightTree = rightTree?.leftTree
            returnTree.leftTree = self
            return returnTree
        }
        
        func rotateRight() -> Tree {
            let returnTree = leftTree!
            self.leftTree = leftTree?.rightTree
            returnTree.rightTree = self
            return returnTree
        }
        
        var debugDescription: String {
            return self.asString()
        }
        
        func asString(_ depth: Int = 0) -> String {
            var returnString = ""
            returnString += " \(self.value)\n"
            if let left = leftTree {
                returnString += String(repeating: " ", count: (depth+1)*2)+" ┗"+left.asString(depth+1)
            }
            if let right = rightTree {
                returnString += String(repeating: " ", count: (depth+1)*2)+" ┗"+right.asString(depth+1)
            }
            return returnString
        }

    }
    
    var root: Tree?
    
    func insert(_ value: B) {
        enumerationIsValid = false
        guard root != nil else {
            root = Tree(value: value)
            return
        }
        root = root!.insert(value)
    }
    
    func insert(_ values: [B]) {
        for value in values {
            insert(value)
        }
        enumerationIsValid = false
    }
    
    func contains(_ value: B) -> Bool {
        return root?.contains(value) ?? false
    }
    
    func remove(_ value: B) {
        root = root?.remove(value)
        enumerationIsValid = false
    }
    
    func remove(_ values: [B]) {
        for value in values {
            root = root?.remove(value)
        }
        enumerationIsValid = false
    }
    
    private var array = [B]()
    private var enumerationIsValid = true
    
    var enumerated: [B] {
        if !enumerationIsValid {
            print("Enumeration invalid.  Enumerating...")
            array = root?.enumerated ?? [B]()
            enumerationIsValid = true
        }
        return array
    }
    
    func index(of value: B) -> Int? {
        return root?.index(of: value, startingCount: 0)
    }
    
    var depth: Int {
        return root?.depth ?? 0
    }
    
    var count: Int {
        return root?.count ?? 0
    }
    
    var isEmpty: Bool {
        return root == nil
    }
    
    var isBalanced: Bool {
        return root?.isBalanced ?? true
    }
}

extension BinaryTree: CustomDebugStringConvertible {

    var debugDescription: String {
        return "  "+(root?.debugDescription ?? "nil")
    }
    
}

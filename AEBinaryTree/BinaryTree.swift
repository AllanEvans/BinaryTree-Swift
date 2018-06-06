//
//  BinaryTree.swift
//  BinaryTree
//
//  Created by Allan Evans on 8/25/16.
//  Copyright © 2016 Aelyssum Corp. All rights reserved.
//

import Foundation
/** A BinaryTree or binary search tree conforming to the AVL (Adelson-Velsky and Landis) requirement of self-balancing where each subtree has left and right subtrees with depths (or heights) that differ by at most 1.  The BinaryTree class is generic and accepts any type that conforms to the Comparable protocol.  Elements in the tree must be unique.  If a new value is inserted into the tree that is equivalent (in an Equatable sense) to an existing value, the existing value is updated to the new value.

 The BinaryTree class provides subscripting with an integer-valued parameter for random-accessibility, albeit at O(logN) complexity.  This is sufficiently fast for the BinaryTree to be a data source delegate for UITableView or UICollectionView instances.  For faster operation, the enumerated property provides a representation as an Array.
 
 Internal operation of each BinaryTree instance is thread-safe.  The BinaryTree class provides convenience methods for  insert() and remove() and index(of:) operations with O(logN) complexity, with internal recursive operations performed off the main queue.
*/
open class BinaryTree<B: Comparable> {
    
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
                self.value = newValue
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
        
        subscript(index: Int) -> B {
            let leftCount = leftTree?.count ?? 0
            if let left = leftTree,
                index < leftCount {
                return left[index]
            } else if let right = rightTree,
                index > leftCount {
                return right[index-leftCount-1]
            } else {
                return value
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
    
    private var root: Tree?
    private var queue = DispatchQueue(label: "com.Aelyssum.BinaryTree.\(type(of: B.self)).\(Date())")
    
    public init() { }
    
    /// Insert a new element into the tree.  The tree self-balances after the insert operation.  If the provided value is equivalent to an existing element in the tree (in an Equatable sense) then the existing value is updated to the input value.
    /// - Parameter value: An instance of the generic type to be inserted
    /// - Complexity:  O(logN)
    open func insert(_ value: B) {
        queue.sync {
            guard root != nil else {
                root = Tree(value: value)
                return
            }
            root = root!.insert(value)
        }
    }
    
    /// Insert new elements into the tree
    /// - Parameter values: A sequence of the generic type
    /// - Complexity: O(M•logN) where M is the number of elements in the input sequence and N is the number of elements in the BinaryTree
    open func insert<Seq: Sequence>(_ values: Seq) where Seq.Element == B {
        for value in values {
            insert(value)
        }
    }
    
    /// Returns true if the BinaryTree contains the provided value.
    /// - Parameter value: An instance of the generic type to be inserted
    /// - Returns: true if the BinaryTree contains `value`
    /// - Complexity:  O(logN)
    open func contains(_ value: B) -> Bool {
        return queue.sync {
            return root?.contains(value) ?? false
        }
    }
    
    /// Removes the element from the BinaryTree.  This method provides no indication if the input value was not found in the tree.
    /// - Parameter value: The instance of the generic type to be removed
    /// - Complexity:  O(logN)
    open func remove(_ value: B) {
        queue.sync {
            root = root?.remove(value)
        }
    }
    
    /// Removes the sequence of elements from the BinaryTree.
    /// - Parameter values: A sequence of the generic type
    /// - Complexity: O(M•logN) where M is the number of elements in the input sequence and N is the number of elements in the BinaryTree
    open func remove<Seq: Sequence>(_ values: Seq) where Seq.Element == B {
        for value in values {
            remove(value)
        }
    }
    
    /// Removes all elements from the tree
    open func removeAll() {
        queue.sync {
            root = nil
        }
    }
    
    /// Representation of all elements of the BinaryTree as an Array.  It is highly recommended that a copy of this property be stored for subsequent operations.
    /// - Complexity: O(N•logN)
    open var enumerated: [B] {
        return queue.sync {
            return root?.enumerated ?? [B]()
        }
    }
    
    /// The index of the input value in the BinaryTree.
    /// - Parameter value: an instance of the generic type
    /// - Returns: the integer valued index of `value` in the BinaryTree or nil if the BinaryTree does not contain the provided `value`.
    /// - Complexity: O(logN)
    open func index(of value: B) -> Int? {
        return queue.sync {
           return root?.index(of: value, startingCount: 0)
        }
    }
    
    /**
     The value at the provided index.  Attempting to access an index greater than count-1 will result in the last value being returned.  Similarly, attempting to access a negative index will result in the first value being returned.
     - Parameters:
        - index: The index of the generic type to be removed
     - throws: Exception if BinaryTree is empty
     - Returns: The `value` in the BinaryTree at the provided `index`.
     - Complexity: O(logN)
    */
    open subscript(index: Int) -> B {
        return queue.sync {
            guard root != nil else {
                fatalError("Attempting to subscript an empty BinaryTree")
            }
           return root![index]
        }
    }
    
    /// The depth of the BinaryTree (also referred to as height) which is approximately log(`count`) of the number of elements `count`.
    open var depth: Int {
        return queue.sync {
            return root?.depth ?? 0
        }
    }
    
    /// The number of elements in the BinaryTree.
    open var count: Int {
        return queue.sync {
            return root?.count ?? 0
        }
    }
    
    /// True if the number of elements in the BinaryTree is zero.
    open var isEmpty: Bool {
        return queue.sync {
            return root == nil
        }
    }
    
    /// True if each subtree in the BinaryTree has left and right subtrees with a depth within 1 of each other.
    open var isBalanced: Bool {
        return queue.sync {
            return root?.isBalanced ?? true
        }
    }
}

extension BinaryTree: CustomDebugStringConvertible {

    open var debugDescription: String {
        return queue.sync {
            return "  "+(root?.debugDescription ?? "nil")
        }
    }
    
}


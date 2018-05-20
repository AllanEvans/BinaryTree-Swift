# AEBinaryTree
A BinaryTree or binary search tree conforming to the AVL (Adelson-Velsky and Landis) requirement of self-balancing where each subtree has left and right subtrees with depths (or heights) that differ by at most 1.  The BinaryTree class is generic and accepts any type that conforms to the Comparable protocol.

Since many applications require sorting data as it arrives from some backend service, but then displaying it in the UI as an array, the BinaryTree class provides convenience methods for inserting elements and for providing an enumerated array property and random access indexing.  Additionally, the BinaryTree directly supports random access via a subscript method with O(logN) complexity, which should be sufficiently fast for delegation as a data source for a UITableView or UICollectionView.

Internal operation of each BinaryTree instance is thread-safe.  The BinaryTree class provides convenience methods for  insert() and remove() and index(of:) operations with O(logN) complexity, with internal recursive operations performed off the main queue.

# Usage

```swift
import AEBinaryTree

class SomeClass {

    var intTree: BinaryTree<Int> // A binary tree of integers
    var stringTree: BinaryTree<String> // A binary tree of strings
    var doubleTree: BinaryTree<Double> // A binary tree of doubles, not the hotel chain
    var someTree: BinaryTree<SomeElement> // A binary tree of SomeElement that conforms to the Comparable protocol

}
```
# Adding To Your Project

## CocoaPods
CocoaPods is the recommended dependency manager:
```ruby
    pod AEBinaryTree
```

## Clone Repo
```bash
$ git clone https://github.com/AllanEvans/BinaryTree-Swift.git <directory>
```

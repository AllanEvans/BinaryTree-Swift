# BinaryTree-Swift
A BinaryTree or binary search tree conforming to the AVL (Adelson-Velsky and Landis) requirement of self-balancing where each subtree has left and right subtrees with depths (or heights) within ±1 of each other.

Since many applications require sorting data as it arrives from some backend service, but then displaying it in the UI as an array, the BinaryTree class provides convenience methods for inserting elements and for providing a cached enumerated array property.  The enumerated property is only updated when accessed when invalidated, preventing an O(N) operation to update the UI each time an element is inserted or removed.

Internal operation of each BinaryTree is thread-safe.  The BinaryTree class provides convenience methods for either synchronous or asynchronous operation, enabling insert() and remove() operations with O(logN) complexity, to be performed without blocking the main queue.

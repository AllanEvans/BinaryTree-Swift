//
//  BinaryTreeTests.swift
//  BinaryTreeTests
//
//  Created by Allan Evans on 8/25/16.
//  Copyright © 2016 Aelyssum Corp. All rights reserved.
//

import XCTest
@testable import AEBinaryTree

class BinaryTreeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCountAndDepth<T>(insert value: T, tree: BinaryTree<T>, expectedCount: Int, expectedDepth: Int) {
        print("Inserting: \(value)")
        tree.insert(value)
        print(tree)
        XCTAssert(tree.count == expectedCount, "Count should be \(expectedCount), got \(tree.count)")
        XCTAssert(tree.isBalanced , "Tree unbalanced")
    }

    func testInsert0() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let tree = BinaryTree<Int>()
        tree.insert(5)
        tree.insert(3)
        var expectedCount: Int!
        var expectedDepth: Int!
        expectedCount = 2
        expectedDepth = 2
        XCTAssert(tree.count == expectedCount, "Count should be \(expectedCount), got \(tree.count)\n\(tree)")
        XCTAssert(tree.depth == expectedDepth, "Depth should be \(expectedDepth), got \(tree.depth)\n\(tree)")
        print(tree)
        tree.insert(1)
        expectedCount = 3
        expectedDepth = 2
        XCTAssert(tree.count == expectedCount, "Count should be \(expectedCount), got \(tree.count)\n\(tree)")
        XCTAssert(tree.depth == expectedDepth, "Depth should be \(expectedDepth), got \(tree.depth)\n\(tree)")
        print(tree)
        XCTAssert(tree.first == 1, "First should be 1")
        XCTAssert(tree.last == 5, "Last should be 5")
    }

    func test1() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let tree = BinaryTree<Int>()
        tree.insert(5)
        tree.insert(10)
        tree.insert(3)
        var expectedCount: Int!
        var expectedDepth: Int!
        expectedCount = 3
        expectedDepth = 2
        XCTAssert(tree.count == expectedCount, "Count should be \(expectedCount), got \(tree.count)\n\(tree)")
        XCTAssert(tree.depth == expectedDepth, "Depth should be \(expectedDepth), got \(tree.depth)\n\(tree)")
        print(tree)
        tree.insert(1)
        tree.insert(4)
        expectedCount = 5
        expectedDepth = 3
        XCTAssert(tree.count == expectedCount, "Count should be \(expectedCount), got \(tree.count)\n\(tree)")
        XCTAssert(tree.depth == expectedDepth, "Depth should be \(expectedDepth), got \(tree.depth)\n\(tree)")
        print(tree)
        tree.insert(0)
        expectedCount = 6
        expectedDepth = 3
        XCTAssert(tree.count == expectedCount, "Count should be \(expectedCount), got \(tree.count)\n\(tree)")
        XCTAssert(tree.depth == expectedDepth, "Depth should be \(expectedDepth), got \(tree.depth)\n\(tree)")
        print(tree)
        tree.insert(2)
    }
    
    func test2() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let tree = BinaryTree<Int>()
        testCountAndDepth(insert: 5, tree: tree, expectedCount: 1, expectedDepth: 1)
        testCountAndDepth(insert: 15, tree: tree, expectedCount: 2, expectedDepth: 2)
        testCountAndDepth(insert: 53, tree: tree, expectedCount: 3, expectedDepth: 2)
        testCountAndDepth(insert: 68, tree: tree, expectedCount: 4, expectedDepth: 3)
        testCountAndDepth(insert: 65, tree: tree, expectedCount: 5, expectedDepth: 3)
        testCountAndDepth(insert: 83, tree: tree, expectedCount: 6, expectedDepth: 3)
        testCountAndDepth(insert: 57, tree: tree, expectedCount: 7, expectedDepth: 3)
//        tree.insert(74)
    }
    
    func test3() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let tree = BinaryTree<Int>()
        testCountAndDepth(insert: 0, tree: tree, expectedCount: 1, expectedDepth: 1)
        testCountAndDepth(insert: 1, tree: tree, expectedCount: 2, expectedDepth: 2)
        testCountAndDepth(insert: 2, tree: tree, expectedCount: 3, expectedDepth: 2)
        testCountAndDepth(insert: 3, tree: tree, expectedCount: 4, expectedDepth: 3)
        testCountAndDepth(insert: 4, tree: tree, expectedCount: 5, expectedDepth: 3)
        testCountAndDepth(insert: 5, tree: tree, expectedCount: 6, expectedDepth: 3)
        testCountAndDepth(insert: 6, tree: tree, expectedCount: 7, expectedDepth: 3)
    }

    func test4() {
        let tree = BinaryTree<Int>()
        let values = [6,5,4,3,2,1,0]
        tree.insert(values)
        print(tree)
        XCTAssert(tree.isBalanced, "Tree unbalanced")
        XCTAssert(tree.count == values.count , "Wrong count \(tree.count)")
    }

    func testSubscript() {
        let tree = BinaryTree<Int>()
        let values = [6,5,4,3,2,1,0]
        tree.insert(values)
        print(tree)
        let sortedValues = values.sorted()
        for index in 0..<sortedValues.count {
            XCTAssert(sortedValues[index]==tree[index], "Failure at \(index): Expected \(sortedValues[index]), got \(tree[index])")
        }
        XCTAssert(tree[tree.count]==sortedValues.last!, "Failed array bounds")
        XCTAssert(tree[-1]==sortedValues.first!, "Failed array bounds")
    }

    func testRemove() {
        let tree = BinaryTree<Int>()
        let values = [6,5,4,3,2,1,0]
        tree.insert(values)
        print(tree)
        tree.remove(3)
        print(tree)
        tree.remove(2)
        print(tree)
        tree.remove(values)
        print(tree)
        XCTAssert(tree.isBalanced, "Tree unbalanced")
        XCTAssert(tree.isEmpty  , "Wrong count \(tree.count)")
    }
    
    func testDeduplication() {
        let tree = BinaryTree<Int>()
        let values = [0,1,2,3,3,4,5,6]
        print(values)
        tree.insert(values)
        print(tree)
        let enumerated = tree.enumerated
        print(enumerated)
        XCTAssert(enumerated[3] == 3, "Indexing failed")
        XCTAssert(enumerated[4] == 4, "Indexing failed")
    }
    
    func testEnumerate() {
        let tree = BinaryTree<Int>()
        let values = [6,5,4,3,2,1,0]
        print(values)
        tree.insert(values)
        print(tree)
        print(tree.enumerated)
        XCTAssert(tree.enumerated == values.reversed(), "Enumeration failed")
        tree.insert(7)
        print(tree)
        print(tree.enumerated)
        XCTAssert(tree.enumerated[7] == 7, "Indexing failed")
        XCTAssert(tree.enumerated[5] == 5, "Indexing failed")
    }
    func testIndexing() {
        
        let tree = BinaryTree<Int>()
        let values = [6,5,4,2,1,0]
        tree.insert(values)
        print(tree)
        print(tree.enumerated)
        XCTAssert(tree.index(of: 6) == 5, "Index 6 failed")
        tree.insert(3)
        XCTAssert(tree.index(of: 3) == 3, "Index 3 failed")
        tree.insert(7)
        XCTAssert(tree.index(of: 7) == 7, "Index 7 failed")

    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

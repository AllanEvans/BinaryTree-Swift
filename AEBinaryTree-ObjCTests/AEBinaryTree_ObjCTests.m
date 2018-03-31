//
//  AEBinaryTree_ObjCTests.m
//  AEBinaryTree-ObjCTests
//
//  Created by Allan Evans on 3/30/18.
//  Copyright © 2018 AllanEvans. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BinaryTree.h"

@interface AEBinaryTree_ObjCTests : XCTestCase

@end

@implementation AEBinaryTree_ObjCTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBasicInsert {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    BinaryTree* tree = [[BinaryTree alloc] init];
    [tree insert: 1];
    [tree insert: 2];
    [tree insert: 3];
    [tree insert: 4];
    [tree insert: 5];
    [tree insert: 6];
    [tree insert: 7];
    NSLog([tree description]);
}

- (void)testBalancedInsert {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    BinaryTree* tree = [[BinaryTree alloc] init];
    [tree insert: 4];
    [tree insert: 2];
    [tree insert: 1];
    [tree insert: 3];
    [tree insert: 6];
    [tree insert: 5];
    [tree insert: 7];
    NSLog([tree description]);
}

- (void)testReversedInsert {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    BinaryTree* tree = [[BinaryTree alloc] init];
    [tree insert: 7];
    [tree insert: 6];
    [tree insert: 5];
    [tree insert: 4];
    [tree insert: 3];
    [tree insert: 2];
    [tree insert: 1];
    NSLog([tree description]);
}


- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

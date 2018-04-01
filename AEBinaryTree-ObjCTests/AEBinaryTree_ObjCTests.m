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

NSNumber* numberOne;
NSNumber* numberTwo;
NSNumber* numberThree;
NSNumber* numberFour;
NSNumber* numberFive;
NSNumber* numberSix;
NSNumber* numberSeven;


- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    numberOne = [[NSNumber alloc] initWithInt:1];
    numberTwo = [[NSNumber alloc] initWithInt:2];
    numberThree = [[NSNumber alloc] initWithInt:3];
    numberFour = [[NSNumber alloc] initWithInt:4];
    numberFive = [[NSNumber alloc] initWithInt:5];
    numberSix = [[NSNumber alloc] initWithInt:6];
    numberSeven = [[NSNumber alloc] initWithInt:7];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBasicInsert {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    BinaryTree* tree = [[BinaryTree<NSNumber *> alloc] init];
    [tree insert: numberOne];
    [tree insert: numberTwo];
    [tree insert: numberThree];
    [tree insert: numberFour];
    [tree insert: numberFive];
    [tree insert: numberSix];
    [tree insert: numberSeven];
    NSLog([tree description]);
}

- (void)testBalancedInsert {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    BinaryTree* tree = [[BinaryTree<NSNumber *> alloc] init];
    [tree insert: numberFour];
    [tree insert: numberTwo];
    [tree insert: numberOne];
    [tree insert: numberThree];
    [tree insert: numberSix];
    [tree insert: numberFive];
    [tree insert: numberSeven];
    NSLog([tree description]);
}

- (void)testReversedInsert {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    BinaryTree* tree = [[BinaryTree alloc] init];
    [tree insert: numberSeven];
    [tree insert: numberSix];
    [tree insert: numberFive];
    [tree insert: numberFour];
    [tree insert: numberThree];
    [tree insert: numberTwo];
    [tree insert: numberOne];
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

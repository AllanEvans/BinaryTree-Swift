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

NSString* letterA;
NSString* letterB;
NSString* letterC;
NSString* letterD;
NSString* letterE;
NSString* letterF;
NSString* letterG;

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
    
    letterA = [[NSString alloc] initWithUTF8String: "a"];
    letterB = [[NSString alloc] initWithUTF8String: "b"];
    letterC = [[NSString alloc] initWithUTF8String: "c"];
    letterD = [[NSString alloc] initWithUTF8String: "d"];
    letterE = [[NSString alloc] initWithUTF8String: "e"];
    letterF = [[NSString alloc] initWithUTF8String: "f"];
    letterG = [[NSString alloc] initWithUTF8String: "g"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRotateLeft {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    BinaryTree* tree = [[BinaryTree<NSNumber *> alloc] init];
    [tree insert: numberOne];
    [tree insert: numberTwo];
    [tree insert: numberThree];
    NSLog([tree description]);
    XCTAssertTrue(tree.depth == 2, "Depth failed");
}

- (void)testRotateRight {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    BinaryTree* tree = [[BinaryTree<NSNumber *> alloc] init];
    [tree insert: numberThree];
    [tree insert: numberTwo];
    [tree insert: numberOne];
    NSLog([tree description]);
    XCTAssertTrue(tree.depth == 2, "Depth failed");
}

- (void)testBasicInsertNumber {
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

- (void)testBalancedInsertNumber {
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
    XCTAssert(tree.depth == 3, @"Expected 3 got different");
}

- (void)testBalancedInsertString {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    BinaryTree* tree = [[BinaryTree<NSString *> alloc] init];
    [tree insert: letterD];
    [tree insert: letterB];
    [tree insert: letterA];
    [tree insert: letterC];
    [tree insert: letterF];
    [tree insert: letterE];
    [tree insert: letterG];
    NSLog([tree description]);
    NSLog([NSString stringWithFormat:@"Depth %d", tree.depth]);
    XCTAssertTrue(tree.depth == 3, "Depth failed");
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

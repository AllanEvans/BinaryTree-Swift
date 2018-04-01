//
//  BinaryTree.m
//  AEBinaryTree-ObjC
//
//  Created by Allan Evans on 3/30/18.
//  Copyright © 2018 AllanEvans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BinaryTree.h>
#import <Comparable.h>
#import <Node.h>

@implementation BinaryTree

#define Element id<Comparable>

Node<Element>* root;


- (id) init
{
    self = [super init];
    root = NULL;
    return self;
}

- (void) insert:(Element) value
{
    if (root == NULL) {
        root = [[Node<Element> alloc] initializeWithValue: value];
    } else {
        root = insert(root, value);
    };
}

Node<Element>* insert(Node<Element>* node, Element value)
{
    if (node == NULL) {
        node = [[Node<Element> alloc] initializeWithValue:value];
        return node;
    };
    if ([value compare:node.value] == NSOrderedAscending) {
        node.left = insert(node.left, value);
    } else if ([value compare:node.value] == NSOrderedSame) {
        node.value = value;
    } else {
        node.right = insert(node.right, value);
    }
    return node;
}

NSString* repeatingString(NSString* string, int count)
{
    NSString* returnStr = @"";
    for (int i = 0; i < count; i++) {
        returnStr = [returnStr stringByAppendingString:string];
    }
    return returnStr;
}

NSString* stringFromNode(Node* node, int depth)
{
    NSString *returnStr = @"";
    if (node == NULL) {
        return returnStr;
    }
    returnStr = [returnStr stringByAppendingFormat:@"%@\n", node.value.description];
    if (node.left != NULL) {
        returnStr = [returnStr stringByAppendingString: repeatingString(@"  ", depth)];
        returnStr = [returnStr stringByAppendingString: @"┗ "];
        returnStr = [returnStr stringByAppendingString:stringFromNode(node.left, depth+1)];
    }
    if (node.right != NULL) {
        returnStr = [returnStr stringByAppendingString: repeatingString(@"  ", depth)];
        returnStr = [returnStr stringByAppendingString: @"┗ "];
        returnStr = [returnStr stringByAppendingString:stringFromNode(node.right, depth+1)];
    }
    return returnStr;
}

- (NSString*) description
{
    if (root == NULL) {
        return @"nil";
    } else {
        NSString* returnStr = @"\n";
        returnStr = [returnStr stringByAppendingString:stringFromNode(root, 0)];
        return returnStr;
    }
}

- (int) depth
{
    return root.depth;
}

@end

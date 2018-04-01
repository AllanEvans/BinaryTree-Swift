//
//  Node.m
//  AEBinaryTree-ObjC
//
//  Created by Allan Evans on 4/1/18.
//  Copyright © 2018 AllanEvans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@implementation Node: NSObject
#define Element id<Comparable>

- (id) initializeWithValue:(Element) value
{
    self.value = value;
    self.left = NULL;
    self.right = NULL;
    return self;
}

- (Node<Element>*) insert:(Element) value
{
    if ([value compare:self.value] == NSOrderedAscending) {
        if (self.left == NULL) {
            self.left = [[Node<Element> alloc] initializeWithValue:value];
        } else {
            self.left = [self.left insert:value];
        }
    } else if ([value compare:self.value] == NSOrderedSame) {
        self.value = value;
    } else {
        if (self.right == NULL) {
            self.right = [[Node<Element> alloc] initializeWithValue:value];
        } else {
            self.right = [self.right insert:value];
        }
    }
    return self;
}


- (int) depth {
    int _depth = 1;
    if (self.left != NULL) {
        _depth = self.left.depth+1;
    }
    if (self.right != NULL) {
        _depth = MAX(_depth,self.right.depth+1);
    }
    return _depth;
}

@end

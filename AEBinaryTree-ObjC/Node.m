//
//  Node.m
//  AEBinaryTree-ObjC
//
//  Created by Allan Evans on 4/1/18.
//  Copyright © 2018 AllanEvans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface Node<Element: id<Comparable>> ()
- (Node<Element>*) insertLeft: (Element) value;
- (Node<Element>*) insertRight: (Element) value;
- (BOOL) isLeftHeavy;
- (BOOL) isRightHeavy;
- (Node<Element>*) rotateLeft;
- (Node<Element>*) rotateRight;
@end

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
            self.left = [[Node<Element> alloc] initializeWithValue: value];
            return self;
        } else {
            return [self insertLeft:value];
        }
    } else if ([value compare:self.value] == NSOrderedSame) {
        self.value = value;
    } else {
        if (self.right == NULL) {
            self.right = [[Node<Element> alloc] initializeWithValue: value];
            return self;
        } else {
            return [self insertRight:value];
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

- (BOOL) isRightHeavy {
    return self.right.depth > self.left.depth;
}

- (BOOL) isLeftHeavy {
    return self.left.depth > self.right.depth;
}

- (Node<Element>*) insertLeft: (Element) value {
    self.left = [self.left insert: value];
    if (self.left.depth > self.right.depth+1) {
        if (self.left.right.isRightHeavy) {
            self.left = [self.left rotateLeft];
        }
        return [self rotateRight];
    }
    return self;
}

- (Node<Element>*) insertRight: (Element) value {
    self.right = [self.right insert: value];
    if (self.right.depth > self.left.depth+1) {
        if (self.right.left.isLeftHeavy) {
            self.right = [self.right rotateRight];
        }
        return [self rotateLeft];
    }
    return self;
}
- (Node<Element>*) rotateLeft {
    Node<Element>* node = self.right;
    self.right = self.right.left;
    node.left = self;
    return node;
}

- (Node<Element>*) rotateRight {
    Node<Element>* node = self.left;
    self.left = self.left.right;
    node.right = self;
    return node;
}

@end

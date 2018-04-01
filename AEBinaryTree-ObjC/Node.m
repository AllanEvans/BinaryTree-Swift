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

- (id) initializeWithValue:(id<Comparable>) value
{
    self.value = value;
    self.left = NULL;
    self.right = NULL;
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

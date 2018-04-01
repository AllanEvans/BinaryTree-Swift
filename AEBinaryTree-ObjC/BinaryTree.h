//
//  BinaryTree.h
//  AEBinaryTree-ObjC
//
//  Created by Allan Evans on 3/30/18.
//  Copyright © 2018 AllanEvans. All rights reserved.
//

#ifndef BinaryTree_h
#define BinaryTree_h
#import "Comparable.h"

@interface BinaryTree<Element: id<Comparable>>:NSObject

- (id) init;
- (void) insert: (Element) value;

@end
#endif /* BinaryTree_h */

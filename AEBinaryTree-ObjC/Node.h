//
//  Node.h
//  AEBinaryTree-ObjC
//
//  Created by Allan Evans on 4/1/18.
//  Copyright © 2018 AllanEvans. All rights reserved.
//

#ifndef Node_h
#define Node_h
#import "Comparable.h"


@interface Node<Element: id<Comparable>>: NSObject

@property (nonnull)Element value;
@property (nullable)Node<Element>* left;
@property (nullable)Node<Element>* right;

- (nonnull id) initializeWithValue: (nonnull Element) value;
- (nonnull Node<Element>*) insert:(nonnull Element) value;

@property (readonly)int depth;

@end


#endif /* Node_h */

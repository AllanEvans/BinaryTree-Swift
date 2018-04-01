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

@property Element value;
@property Node<Element>* left;
@property Node<Element>* right;
- (id) initializeWithValue: (Element) value;

@end


#endif /* Node_h */

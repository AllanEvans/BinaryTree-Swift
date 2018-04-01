//
//  Comparable.h
//  AEBinaryTree-ObjC
//
//  Created by Allan Evans on 3/31/18.
//  Copyright © 2018 AllanEvans. All rights reserved.
//

#ifndef Comparable_h
#define Comparable_h

@protocol Comparable

- (NSComparisonResult) compare: (id<Comparable>) other;
@property NSString* description;

@end
#endif /* Comparable_h */

@interface NSNumber () <Comparable>
@end

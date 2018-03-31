//
//  BinaryTree.m
//  AEBinaryTree-ObjC
//
//  Created by Allan Evans on 3/30/18.
//  Copyright © 2018 AllanEvans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BinaryTree.h>

@implementation BinaryTree

struct Node
{
    struct Node *left;
    struct Node *right;
    int value;
};

typedef struct Node Node;

Node *root;

Node newNode(int value)
{
    Node node;
    node.value = value;
    node.left = NULL;
    node.right = NULL;
    return node;
}

+ (void) initialize
{
    root = NULL;
}

+ (void) insert:(int)value
{
    if (root == NULL) {
        *root = newNode(value);
    } else {
        *root = insert(root, value);
    };
}

Node insert(Node* node, int value)
{
    if (node == NULL) {
        *node = newNode(value);
        return *node;
    };
    if (value < node->value) {
        *node->left = insert(node->left, value);
    } else if (value == node->value) {
        node->value = value;
    } else {
        *node->right = insert(node->right, value);
    }
    return *node;
}
@end

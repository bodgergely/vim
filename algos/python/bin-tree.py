from typing import List, Optional
# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

def preorder_traversal(root: Optional[TreeNode]) -> List[int]:
    res = []
    stack = []
    while len(stack) or root:
        if root != None:
            res.append(root.val)  # first process node, then save on stack because we need to go to right node from this later
            stack.append(root)
            root = root.left
        else:                       # left node is nil so pop the parent from the stack and since we already processed the parent we just go to the right
            root = stack.pop()
            root = root.right
    return res

def inorder_traversal(root: Optional[TreeNode]) -> List[int]:
    res = []
    stack = []
    while len(stack) or root:
        if root != None:
            stack.append(root)   # save the current node on the stack and keep going left
            root = root.left
        else:                   # this is the case when the left node was nil so pop the parent and go to the right
            root = stack.pop()  # pop the parent, we now know the left child was missing so process node and go to right
            res.append(root.val) # process node (add value to the result)
            root = root.right    # go to the right
    return res

def postorder_traversal(root: Optional[TreeNode]) -> List[int]:
    res = []
    stack = []
    while len(stack) or root:
        if root != None:
            stack.append(root)
            res.insert(0, root.val)     # reverse the process of preorder
            root = root.right             # reverse the process of preorder
        else:
            node = stack.pop()          # reverse the process of preorder
            root = node.left






import pytest

from queue_using_stacks import MyQueue
from queue_using_stacks import Stack

def test_stack():
    s1 = Stack()
    s1.push(5)
    s1.push(4)
    s1.push(2)
    s2 = s1.clone()
    assert s1.x == s2.x

def test_stack_iteration():
    stak = Stack()
    stak.push(1)
    stak.push(2)
    stak.push(3)
    i = 3
    for c in stak:
        assert c == i
        i -= 1
    assert stak.empty() == True
    

def test_empty():
    q = MyQueue()
    assert q.empty() == True
    q.push(5)
    assert q.empty() == False
    q.peek()
    assert q.empty() == False
    q.pop()
    assert q.empty() == True


def test_push_peek_pop():
    print("testing push peek bala")
    q = MyQueue()
    q.push(5)
    assert q.peek() == 5
    q.push(2)
    assert q.peek() == 5
    q.push(1)
    assert q.peek() == 5
    assert q.pop() == 5
    assert q.peek() == 2
    assert q.pop() == 2
    q.push(13)
    assert q.peek() == 1
    assert q.peek() == 1
    q.push(18)
    assert q.pop() == 1
    assert q.peek() == 13
    

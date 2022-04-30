class Stack:
    def __init__(self):
        self.x = list()

    def push(self, x):
        self.x.append(x)

    def pop(self):
        if not self.empty():
            return self.x.pop(-1)
        return None

    def peek(self):
        if not self.empty():
            return self.x[-1]
        return None

    def empty(self):
        return len(self.x) == 0

    def __len__(self):
        return len(self.x)

    def __str__(self):
        cp = [c for c in self.x]
        res = ""
        for c in cp[::-1]:
            res += str(c)
            res += " "
        return res

    def __iter__(self):
        return self

    def __next__(self):
        if len(self.x) <= 0:
            raise StopIteration
        return self.x.pop()

    def clone(self):
        s = Stack()
        cp = [c for c in self.x]
        for c in cp:
            s.push(c)
        return s

class MyQueue:
    def __init__(self):
        self.pushq = Stack()
        self.popq = Stack()
        self.pushed = True
        
    def push(self, x: int) -> None:
        if not self.pushed:
            for c in self.popq:
                self.pushq.push(c) 
        self.pushq.push(x)
        self.pushed = True

    def pop(self) -> int:
        if self.pushed:
            for c in self.pushq:
                self.popq.push(c)
        self.pushed = False
        return self.popq.pop()

    def peek(self) -> int:
        res = self.pop()
        self.popq.push(res)
        return res

    def empty(self) -> bool:
        if self.pushed:
            return len(self.pushq) == 0
        else:
            return len(self.popq) == 0



# Your MyQueue object will be instantiated and called as such:
# obj = MyQueue()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.peek()
# param_4 = obj.empty()

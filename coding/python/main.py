from typing import Any

class Decorator:
    def __init__(self, *args, **kwargs) -> None:
        print("Inside Decor __init__", "args:", args, "kwargs:", kwargs)
        self.args = args
        self.kwargs = kwargs
    def __call__(self, func) -> Any:
        print("Inside Decor __call__, func:", func)
        def wrapper(*args, **kwargs):
            print("Inside wrapper()", args, kwargs)
            with self:
                return func(*args, **kwargs)
        return wrapper
    def __enter__(self):
        print("Inside Decor __enter__")
    def __exit__(self, exc_type, exc_val, exc_tb):
        print("Inside Decor __exit__")


@Decorator("Geri", 4, height=175, weight=73)
def add(x, y):
    print("Inside add()", x, y)
    return x + y

r = add(67, 89)
print(r)
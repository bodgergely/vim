import pytest

from first_bad_version import Solution, bad_version_func_factory

def setup_function(function):
    print("setting up", function)

def test_all():
    sol = Solution()
    for bad_from in range(1, 11):
        fn = bad_version_func_factory(bad_from)
        for n in range(1,30):
            if n < bad_from:
                continue
            assert sol.firstBadVersion(n, fn) == bad_from
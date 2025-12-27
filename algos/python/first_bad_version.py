def bad_version_func_factory(bad_from: int):
    def isBadVersion(version: int):
        if version >= bad_from:
            return True
        else:
            return False
    return isBadVersion

class Solution:
    def firstBadVersion(self, n: int, isBadVersion) -> int:
        a = 0
        b = n
        while b - a > 1:
            m = a + (b-a) // 2
            if isBadVersion(m):
                b = m
            else:
                a = m
        return b
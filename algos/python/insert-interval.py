class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        # find the insertion place + element that is preceding it
        # if element preceding it has later or equal finish time => merge them
            # otherwise insert it
        # III. check if the next element has finishing time less or equal:
            # if greater -> END
            # if equal -> merge them -> END
            # if less -> merge them and loop back to III.
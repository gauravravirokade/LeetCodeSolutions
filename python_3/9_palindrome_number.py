class Solution:
    def isPalindrome(self, x: int) -> bool:

        # by reversing the integer & comparing with the original int - storing the reversed integer as a string
        # y = str(x)[::-1]
        # return str(x) == y

        # reversing & comparing, not storing anything.
        return str(x) == str(x)[::-1]

        # using loops
        # x = str(x)
        # for i in range(len(x)//2):
        #     if x[i] != x[len(x)-1-i]:
        #         return False
        # return True
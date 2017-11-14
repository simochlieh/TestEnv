def find_first_occurrence_idx(arr, x, low, high):
    if high - low == 1:
        # There is one value to check
        return -1 if x != arr[low] else low
    mid = (low + high) / 2
    if (mid == 0 or x > arr[mid - 1]) and x == arr[mid]:
        return mid
    else:
        if x <= arr[mid]:  # In this case, the first occurrence index of x is still < mid
            return find_first_occurrence_idx(arr, x, low, mid)
        else:
            return find_first_occurrence_idx(arr, x, mid, high)


def find_last_occurrence_idx(arr, x, low, high):
    if high - low == 1:
        # There is one value to check
        return -1 if x != arr[low] else low

    mid = (low + high) / 2
    if (mid + 1 == high or x < arr[mid + 1]) and x == arr[mid]:
        return mid
    else:
        if x >= arr[mid]:  # In this case, the first occurrence index of x is still < mid
            return find_last_occurrence_idx(arr, x, mid, high)
        else:
            return find_last_occurrence_idx(arr, x, low, mid)


def maim():
    x = 0
    arr = [0, 1, 1, 2, 3, 3, 3, 3, 4, 4, 5, 6, 7, 8, 10]
    low = 0
    high = len(arr)
    print find_first_occurrence_idx(arr, x, low, high)
    print find_last_occurrence_idx(arr, x, low, high)


if __name__ == '__main__':
    maim()

# Goal:
# Build a method #bubble_sort that takes an array and returns a sorted array. It must use the bubble sort methodology (using #sort would be pretty pointless, wouldn’t it?).
def bubble_sort(array)
  # shallow copy to return new in lieu of mutating argument
  sorted = array.dup
  # index-accessor-safe length
  len = sorted.length - 1

  # Stanley P. Y. Fung's algorithm: https://arxiv.org/abs/2110.01111v1
  (0..len).each do |n|
    (0..len).each do |nn|
      next unless sorted[n] < sorted[nn]

      # save value before overwriting
      swap = sorted[n]

      sorted[n] = sorted[nn]
      sorted[nn] = swap
    end
  end

  sorted
end

p bubble_sort([4, 3, 78, 2, 0, 2])
p bubble_sort([101, -2, 4, 0, 3])

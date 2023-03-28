import Foundation

// MARK: Constant time
func checkFirst(names: [String]) {
  if let first = names.first {
    print(first)
  } else {
    print("no names")
  }
}

// MARK: Linear time 1
func printNames(names: [String]) {
    for name in names {
        print(name)
    }
}

// MARK: Linear time 2
func linearSearch<T: Equatable>(_ array: [T], _ target: T) -> Int? {
    for i in 0..<array.count {
        if array[i] == target {
            return i
        }
    }
    return nil
}

// MARK: Quadratic time 1
func Quadratic(names: [String]) {
  for _ in names {
    for name in names {
      print(name)
    }
  }
}

// MARK: Quadratic time 2
func bubbleSort<T: Comparable>(_ array: inout [T]) {
    guard array.count > 1 else {
        return
    }
    
    for i in 0..<array.count {
        for j in 1..<array.count - i {
            if array[j] < array[j - 1] {
                array.swapAt(j, j - 1)
            }
        }
    }
}

// MARK: Logarithmic time 1
func naiveContains(_ value: Int, in array: [Int]) -> Bool {
  guard !array.isEmpty else { return false }
  let middleIndex = array.count / 2

  if value <= array[middleIndex] {
    for index in 0...middleIndex {
      if array[index] == value {
        return true
      }
    }
  } else {
    for index in middleIndex..<array.count {
      if array[index] == value {
        return true
      }
    }
  }

  return false
}

// MARK: Quasilinear
func findMaxValue<T: Comparable>(_ array: [T]) -> T? {
    guard array.count > 0 else {
        return nil
    }
    
    var max = array[0]
    for i in 1..<array.count {
        if array[i] > max {
            max = array[i]
        }
    }
    
    return max
}

// MARK:  Comparing time complexity 1
func sumFromOne1(upto n: Int) -> Int {
  var result = 0
  for i in 1...n {
    result += i
  }
  return result
}
// MARK:  Comparing time complexity 2
func sumFromOne2(upto n: Int) -> Int {
  (1...n).reduce(0, +)
}

// MARK:  Comparing time complexity 3
func sumFromOne3(upto n: Int) -> Int {
  (n + 1) * n / 2
}

import Foundation

// MARK: Stack
public struct Stack<Element> {
    
    /// 제네릭으로 구현되어 있어서, 어떤 데이터도 담을 수 있음.
    private var storage: [Element] = []
    
    /// 아무런 인자도 받지 않으며, 구조체를 초기화
    public init() { }
    
    // MARK: Stack에 새로운 element 추가
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    // MARK: Stack의 가장 위에 있는 element를 제거하고, 그 element를 반환한다.
    public mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    // MARK: Stack의 가장 위에 있는 요소를 반환한다. 단, Stack에서 제거하지 않는다.
    public func peek() -> Element? {
        return storage.last
    }
    
    // MARK: Stack이 비어있는지 여부를 반환
    public var isEmpty: Bool {
        return storage.isEmpty
    }
    
    // MARK: Stack의 element 개수를 반환
    public var count: Int {
        return storage.count
    }
}

// MARK: The first challenge
/// 노드를 Stack에 push하면 시간복잡도는 O(n)이다.
/// Stack의 요소를 pop해 값을 출력하는 것 역시 O(n)이기 때문에 알고리즘의 시간 복잡도는 O(n)
func printReversed<T>(_ array: [T]) {
    var stack = Stack<T>()
    
    // 함수 내부에서는 입력으로 받은 배열의 요소를 Stack에 차례대로 넣어준다.
    for i in array {
        stack.push(i)
    }
    
    // while을 이용해 Stack에서 element를 꺼내어 출력합니다.
    // 이때, 스택이 빈 상태가 되면 루프를 빠져나옵니다.
    while let element = stack.pop() {
        print(element)
    }
}

let array = [1, 2, 3, 4, 5]
printReversed(array)
// 결과
// 5
// 4
// 3
// 2
// 1


// MARK: Second challenge
func checkParenthesesBalance(_ str: String) -> Bool {
    var stack = Stack<Character>()
    
    for ch in str {
        if ch == "(" {
            stack.push(ch)
        } else if ch == ")" {
            if stack.isEmpty {
                // 짝이 맞지 않는 경우
                return false
            }
            stack.pop()
        }
    }
    
    // 입력 문자열을 모두 처리한 후, 스택이 비어있으면 짝이 맞는 경우
    // 만약 스택이 비어있지 않으면, 열린 괄호 "("가 더 많은 경우이므로 짝이 맞지 않는 경우임
    return stack.isEmpty
}

print(checkParenthesesBalance("h((e))llo(world)()")) // true
print(checkParenthesesBalance("(hello world")) // false

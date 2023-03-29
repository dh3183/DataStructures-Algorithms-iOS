import Foundation

// MARK: Stack
public struct Stack<Element> {
    
    private var storage: [Element] = []
    
    public init() { }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    public func peek() -> Element? {
        storage.last
    }
    
    public var isEmpty: Bool {
        peek() == nil
    }
    
    public init(_ elements: [Element]) {
        storage = elements
    }
}

// MARK: extend "CustomDebugStringConvertible" on the stack.
extension Stack: CustomDebugStringConvertible {
    public var debugDescription: String {
    """
    ----top----
    \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
    -----------
    """
    }
}

// MARK: extend "ExpressibleByArrayLiteral" on the stack.
extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}

// example 함수는, 제목과 실행할 함수를 받아들이는 클로저를 매개 변수로 사용합니다. 클로저는 실행할 코드 블록을 캡슐화하는 방법으로 사용됩니다.
// example 함수는 이 클로저를 실행하고, 제목과 함께 실행 결과를 출력합니다.
func example(of title: String, action: () -> Void) {
    print("----- Example of \(title) -----")
    action()
}

example(of: "using a stack") {
    var stack = Stack<Int>()
    stack.push(1)
    stack.push(2)
    stack.push(3)
    stack.push(4)
    
    print(stack)
    
    if let poppedElement = stack.pop() {
        assert(4 == poppedElement)
        print("Popped: \(poppedElement)")
    }
}

example(of: "initializing a stack from an array") {
    let array = ["A", "B", "C", "D"]
    var stack = Stack(array)
    print(stack)
    stack.pop()
}

example(of: "initializing a stack from an array literal") {
    var stack: Stack = [1.0, 2.0, 3.0, 4.0]
    print(stack)
    stack.pop()
}

import UIKit

protocol Container {
    associatedtype Item
    var count: Int { get }
    subscript(i: Int) -> Item? { get }
    mutating func append (_ item: Item)
}
//Очередь
struct Queue<T> {
    var items: [T] = []
    var head: T? {
        return items.first
    }
    var tail: T? {
        return items.last
    }
    mutating func enqueue (_ value: T) {
        items.append(value)
    }
    mutating func dequeue () -> T? {
        if (items.count != 0) {
            return items.removeFirst()
        }
        else {
            return nil
        }
    }
    var count: Int {
        return items.count
    }
    var isEmpty: Bool {
        return items.isEmpty
    }
    subscript(i: Int) -> T? {
        return items[i]
    }
    mutating func append(_ item: T) {
        self.enqueue(item)
    }
}

//Cвязанный список
class Node<Item> {
    let value: Item
    var next: Node?
    init(value: Item) {
        self.value = value
    }
}
struct LinkendList<Item>: Container {
    subscript(index: Int) -> Node<Item>? {
        func find(node: Node<Item>?) -> Node<Item> {
            guard let node = node else { fatalError() }
            if i == index {
                return node
            } else {
                i += 1
                return find(node: node.next)
            }
        }

        var i = 0
        return find(node: node)
    }
    var node: Node<Item>?
    var count: Int {
        func counter(node: Node<Item>?) {
            if let node = node {
                i += 1
                counter(node: node.next)
            }
        }
        var i = 0
        counter(node: node)
        return i
    }
    mutating func append(_ newNode: Node<Item>) {
        func add(node: inout Node<Item>?) {
            if let node = node {
                add(node: &node.next)
            } else {
                node = newNode
            }
        }
        add(node: &node)
    }
}

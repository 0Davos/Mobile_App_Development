/*
 Owen Davis
 Mobile App Development
 Homework 3
 */


import UIKit

// 1) Queue Data Structure

class Queue<T> {
    var items = [T]()
    func enqueue(_ newItem: T) {
        items.append(newItem)
        }
    func dequeue() -> T? {
        guard !items.isEmpty else {
        return nil
        }
        let first = items.removeFirst()
        return first
    }
}


// Testing
func testQueue() {
    var queue = Queue<String>()
    queue.enqueue("now")
    queue.enqueue("is")
    queue.enqueue("the")
    queue.enqueue("time")
    queue.enqueue("for")
    queue.enqueue("all")
    while let item = queue.dequeue() {
        print(item)
    }
}
testQueue()
print("-----------------------")

// 2) Priority Queue

class PQueue<T: Equatable>: Queue<T> {
    var priorities = [Int]()
    func enqueue(_ newItem: T, priority: Int) {
        var queue = [T]()
        // If empty, just insert like normal
        if priorities.isEmpty {
            priorities.append(priority)
            queue.append(newItem)
        }
        
        var inserted = false
        for i in 0...(priorities.count-1) {
            if priority > priorities[i] {
                items.insert(newItem, at: i)
                priorities.insert(priority, at: i)
                inserted = true
                break
            }
        }
        if !inserted {
            items.append(newItem)
            priorities.append(priority)
        }
    }
    override func dequeue() -> T? {
        guard !priorities.isEmpty else {
            return nil
        }
        priorities.remove(at:0)
        return items.remove(at:0)
    }
    func changePriority(_ element: T, newPriority: Int) {
        // Find if the element actually exists in the queue
        if var index = items.firstIndex(of: element) {
            // if it does, take both it and the current priority out
            priorities.remove(at:index)
            items.remove(at:index)
        }
        else {
            return
        }
        // then run enqueue on it with the new priority
        enqueue(element, priority:newPriority)
    }
}


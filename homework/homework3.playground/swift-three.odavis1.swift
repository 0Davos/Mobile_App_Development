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
            items.append(newItem)
            return
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
        if let index = items.firstIndex(of: element) {
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

// Professor testing function
func testPQueue() {
    var pqueue = PQueue<String>()
    pqueue.enqueue("the", priority: 5)
    pqueue.enqueue("is", priority: 3)
    pqueue.enqueue("now", priority: 1)
    pqueue.enqueue("for", priority: 10)
    pqueue.enqueue("time", priority: 9)
    // following should print, in this order: now is the time for
    while let item = pqueue.dequeue() {
        print(item)
    }

    pqueue.enqueue("the", priority: 10)
    pqueue.enqueue("is", priority: 15)
    pqueue.enqueue("now", priority: 18)
    pqueue.enqueue("for", priority: 2)
    pqueue.enqueue("time", priority: 4)

    pqueue.changePriority("now", newPriority: 1)
    pqueue.changePriority("is", newPriority: 2)
    pqueue.changePriority("blueberry", newPriority: 56)
    pqueue.changePriority("the", newPriority: 3)
    pqueue.changePriority("time", newPriority: 4)
    pqueue.changePriority("for", newPriority: 5)

    // following should print, in this order: now is the time for
    while let item = pqueue.dequeue() {
        print(item)
    }
} // testPQueue()

testPQueue()

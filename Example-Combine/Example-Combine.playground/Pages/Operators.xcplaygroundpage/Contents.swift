import Combine

//: [Previous](@previous)

let publisher1 = PassthroughSubject<Int, Never>()

let publisher2 = publisher1.map { value in
    value + 20
}

let subscription1 = publisher1.sink { value in
    print("Subscription1 received value: \(value)")
}

let subscription2 = publisher2.sink { value in
    print("Subscription2 received value: \(value)")
}

publisher1.send(9)
publisher1.send(5)


//: [Next](@next)

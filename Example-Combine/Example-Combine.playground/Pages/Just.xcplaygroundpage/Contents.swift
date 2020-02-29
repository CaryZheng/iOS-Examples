import Combine

//: [Previous](@previous)

let publisher = Just(98)

let subscription = publisher.sink { value in
    print("Received value: \(value)")
}

//: [Next](@next)

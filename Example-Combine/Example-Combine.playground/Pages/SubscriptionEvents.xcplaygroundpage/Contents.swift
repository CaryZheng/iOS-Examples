import Combine
import Foundation

//: [Previous](@previous)

enum MyError: Swift.Error {
    case error1
}

let subject = PassthroughSubject<String, MyError>()

subject.handleEvents(receiveSubscription: { subscription in
    print("receiveSubscription: \(subscription)")
}, receiveOutput: { value in
    print("receiveOutput: \(value)")
}, receiveCompletion: { _ in
    print("receiveCompletion")
}, receiveCancel: {
    print("receiveCancel")
}, receiveRequest: { _ in
    print("receiveRequest")
    }).replaceError(with: "Failure123")
    .sink { value in
        print("sink received value: \(value)")
}

subject.send("1")
subject.send("2")
subject.send("3")
subject.send(completion: Subscribers.Completion<MyError>.failure(MyError.error1))
subject.send("4")

//: [Next](@next)

import Combine
import Foundation

//: [Previous](@previous)

let usernamePublisher = PassthroughSubject<String, Never>()
let passwordPublisher = PassthroughSubject<String, Never>()

let validatedCredentials = Publishers.CombineLatest(usernamePublisher, passwordPublisher).map { (username, password) -> Bool in
        !username.isEmpty && !password.isEmpty && password.count > 6
}
.replaceError(with: false)
.sink { valid in
    print("valid: \(valid)")
}

usernamePublisher.send("Tony")
passwordPublisher.send("asdf")
passwordPublisher.send("asdf123456")

//: [Next](@next)

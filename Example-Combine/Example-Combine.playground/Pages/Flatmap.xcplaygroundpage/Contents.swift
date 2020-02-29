import Combine
import Foundation
import UIKit

//: [Previous](@previous)

enum RequestError: Error {
    case sessionError(error: Error)
}

let urlPublisher = PassthroughSubject<URL, RequestError>()

let subscription = urlPublisher.flatMap { requestUrl in
    URLSession.shared.dataTaskPublisher(for: requestUrl).mapError { error -> RequestError in
        RequestError.sessionError(error: error)
    }
}
.assertNoFailure()
.sink { result in
    print("Request finish: \(result)")
    
    _ = UIImage(data: result.data)
}

urlPublisher.send(URL(string: "https://httpbin.org/image/jpeg")!)

print("123456")

//: [Next](@next)

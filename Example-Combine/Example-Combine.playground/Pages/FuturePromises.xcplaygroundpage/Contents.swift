import Combine
import Foundation

//: [Previous](@previous)

struct User {
    let id: Int
    let name: String
}

let users = [
    User(id: 1, name: "Tony"),
    User(id: 2, name: "Lily"),
    User(id: 3, name: "Lucy")
]

enum FetchError: Error {
    case userNotFound
}

func fetchUser(userId: Int, complettion: (_ result: Result<User, FetchError>) -> Void) {
    if let user = users.first(where: { $0.id == userId}) {
        complettion(Result.success(user))
    } else {
        complettion(Result.failure(FetchError.userNotFound))
    }
}

let fetchUserPublisher = PassthroughSubject<Int, FetchError>()

fetchUserPublisher
    .flatMap { userId -> Future<User, FetchError> in
        return Future { promise in
            fetchUser(userId: userId) { result in
                switch result {
                case .success(let user):
                    promise(.success(user))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
}.map {
    user in user.name
}.catch { error -> Just<String> in
    print("Error: \(error)")
    return Just("Not Found")
}.sink { result in
    print("User is \(result)")
}

fetchUserPublisher.send(3)
fetchUserPublisher.send(8)

//: [Next](@next)

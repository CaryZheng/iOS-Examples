import Combine

let subject = PassthroughSubject<String, Never>()

let subscription = subject.sink { value in
    print("Received value: \(value)")
}

subject.send("Hello World")

let publisher = Just("My Test")
publisher.subscribe(subject)

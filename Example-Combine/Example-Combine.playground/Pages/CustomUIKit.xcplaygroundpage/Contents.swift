import Combine
import UIKit

//: [Previous](@previous)

struct UIControlPublisher<Control: UIControl>: Publisher {
    typealias Output = Control
    typealias Failure = Never
    
    let control: Control
    let controlEvents: UIControl.Event
    
    init(control: Control, controlEvents: UIControl.Event) {
        self.control = control
        self.controlEvents = controlEvents
    }
    
    func receive<S>(subscriber: S) where S : Subscriber, UIControlPublisher.Failure == S.Failure, UIControlPublisher.Output == S.Input {
        subscriber.receive(subscription: UIControlSubscription(subscriber: subscriber, control: control, event: controlEvents))
    }
}

final class UIControlSubscription<SubscriberType: Subscriber, Control: UIControl>: Subscription where SubscriberType.Input == Control {
    
    private var subscriber: SubscriberType?
    private let control: Control
    
    init(subscriber: SubscriberType, control: Control, event: UIControl.Event) {
        self.subscriber = subscriber
        self.control = control
        control.addTarget(self, action: #selector(eventHandler), for: event)
    }
    
    func request(_ demand: Subscribers.Demand) {
        
    }
    
    func cancel() {
        subscriber = nil
    }
    
    @objc private func eventHandler() {
        _ = subscriber?.receive(control)
    }
    
    deinit {
        print("UIControlTarget deinit")
    }
}

protocol CombineCompatible {}

extension UIControl: CombineCompatible {}

extension CombineCompatible where Self: UIControl {
    
    func publisher(events: UIControl.Event) -> UIControlPublisher<Self> {
        return UIControlPublisher(control: self, controlEvents: events)
    }
}

let button = UIButton()
let subscription = button.publisher(events: .touchUpInside).sink { button in
    print("Button is pressed")
}

button.sendActions(for: .touchUpInside)
subscription.cancel()




//: [Next](@next)

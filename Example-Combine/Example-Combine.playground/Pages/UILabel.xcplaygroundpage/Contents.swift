import Combine
import UIKit
import PlaygroundSupport

//: [Previous](@previous)

class MyViewController : UIViewController {
    
    let label = UILabel()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "10"
        label.textColor = .black
        
        Just(30).map {
            "Number is \($0)"
        }.assign(to: \.text, on: label)
        
        view.addSubview(label)
        self.view = view
    }
}

PlaygroundPage.current.liveView = MyViewController()

//: [Next](@next)


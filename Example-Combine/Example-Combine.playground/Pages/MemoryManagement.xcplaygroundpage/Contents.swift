import Combine
import UIKit

//: [Previous](@previous)

final class HomeViewController: UIViewController {
    
    private let tableView = UITableView()
    private let timeLabel = UILabel()
    
    private var foregroundSubscriber: AnyCancellable?
    
    deinit {
        print("HomeViewController deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foregroundSubscriber = NotificationCenter.default
            .publisher(for: .NSExtensionHostWillEnterForeground)
            .print("foregroundSubscriber")
            .sink { [unowned self] _ in
                print("Reload tableview")
                
                self.tableView.reloadData()
        }
    }
    
}

var homeViewController: HomeViewController? = HomeViewController(nibName: nil, bundle: nil)
homeViewController!.viewDidLoad()
NotificationCenter.default.post(name: .NSExtensionHostWillEnterForeground, object: nil)
homeViewController = nil

//: [Next](@next)

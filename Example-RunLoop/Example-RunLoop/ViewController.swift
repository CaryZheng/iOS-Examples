//
//  ViewController.swift
//  Example-RunLoop
//
//  Created by Cary on 2020/4/22.
//  Copyright © 2020 Cary. All rights reserved.
//

import UIKit

class MyThread: Thread {
    override func main() {
        print("\(Thread.current) is main thread: \(Thread.isMainThread)")

        let timer = Timer.init(timeInterval: 2, target: self, selector: #selector(doSomethingWithTimer(_:)), userInfo: nil, repeats: true)

        RunLoop.current.add(timer, forMode: .default)
        
        RunLoop.current.run()
    }

    @objc func doSomethingWithTimer(_ timer: Timer) {
        print("\(Timestamp().getString()): MyThread doSomethingWithTimer")
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // TableView
        let tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Add RunLoop Observer
        addRunLoopObserver()
        
        // 开子线程
//        let thread = MyThread.init()
//        thread.start()
        
        // 当前主线程
//        let timer = Timer.init(timeInterval: 2, target: self, selector: #selector(doSomethingWithTimer(_:)), userInfo: nil, repeats: true)
//        RunLoop.current.add(timer, forMode: .common)
//        timer.fire()
    }
    
    @objc func doSomethingWithTimer(_ timer: Timer) {
        print("\(Timestamp().getString()): doSomethingWithTimer")
    }

    func addRunLoopObserver() {
        let observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, CFRunLoopActivity.allActivities.rawValue, true, 0) { (observer, activity) in
            
            let currentMode = String(describing: RunLoop.current.currentMode?.rawValue)
            
            switch activity {
            case .entry:
                print("\(Timestamp().getString()): \(currentMode) RunLoop entry")
            case .beforeTimers:
                print("\(Timestamp().getString()): \(currentMode) RunLoop beforeTimers")
            case .beforeSources:
                print("\(Timestamp().getString()): \(currentMode) RunLoop beforeSources")
            case .beforeWaiting:
                print("\(Timestamp().getString()): \(currentMode) RunLoop beforeWaiting")
            case .afterWaiting:
                print("\(Timestamp().getString()): \(currentMode) RunLoop afterWaiting")
            case .exit:
                print("\(Timestamp().getString()): \(currentMode) RunLoop exit")
            default:
                break
            }
        }
        
//        CFRunLoopAddObserver(RunLoop.current.getCFRunLoop(), observer, CFRunLoopMode.defaultMode)
        CFRunLoopAddObserver(RunLoop.current.getCFRunLoop(), observer, CFRunLoopMode.commonModes)
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = "测试数据\(indexPath.row)"
        
        return cell!
    }
}

extension ViewController: UITableViewDelegate {
    
}

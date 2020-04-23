//
//  Timestamp.swift
//  Example-RunLoop
//
//  Created by Cary on 2020/4/23.
//  Copyright © 2020 Cary. All rights reserved.
//

import Foundation

class Timestamp {
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS "
        return formatter
    }()

    func getString() -> String {
        return dateFormatter.string(from: Date())
    }
}

//
//  ContentView.swift
//  SwiftUI-List
//
//  Created by Cary on 2020/2/23.
//  Copyright © 2020 Cary. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
 
    var body: some View {
        RefreshableNavigationView(title: "Test123", action: {
            self.numbers.append(self.getTestData())
        }) {
            ForEach(self.numbers, id: \.self) { number in
                VStack(alignment: .leading) {
                    Text("\(number)")
                    Divider()
                }
            }
        }
    }
    
    func getTestData() -> Int {
        return numbers.count + 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

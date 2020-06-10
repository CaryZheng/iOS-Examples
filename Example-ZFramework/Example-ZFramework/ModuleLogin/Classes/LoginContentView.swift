import SwiftUI

public struct LoginContentView: View {
    
    public init() {
        
    }
    
    public var body: some View {
        VStack {
            Text("LoginContentView")
        }.navigationBarTitle("Login", displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginContentView()
    }
}

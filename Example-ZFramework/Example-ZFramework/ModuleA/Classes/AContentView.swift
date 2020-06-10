import SwiftUI

public struct AContentView: View {
    
    public init() {
        
    }
    
    public var body: some View {
        NavigationView {
            Text("AContentView")
                .navigationBarTitle("AContentView", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AContentView()
    }
}

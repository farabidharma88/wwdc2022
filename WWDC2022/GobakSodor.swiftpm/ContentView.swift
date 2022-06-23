import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: DragView()) {
                    GestureRow(title: "Gobak Sodor", description: "Dare yourself to go through it.", SFSymbol: "gamecontroller")
                }
            }
            .navigationTitle("Home")
            
            Text("Select a Gesture Example")
                .foregroundColor(.secondary)
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}

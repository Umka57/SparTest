
import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab){
            MainView()
                .tabItem{
                    Image("spar-tree-logo-small")
                    Text("Главная")
                }
                .tag(0)
            
            Text("Каталог")
                .tabItem{
                    Image("menu-logo")
                    Text("Главная")
                }
                .tag(1)
            
            Text("Корзина")
                .tabItem{
                    Image(systemName: "cart")
                    Text("Корзина")
                }
                .tag(2)
            
            Text("Профиль")
                .tabItem{
                    Image(systemName: "person")
                    Text("Профиль")
                }
                .tag(3)
            
        }.accentColor(Color.green)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}


import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0
    init() {
        let customColor = UIColor(red: 0.46, green: 0.46, blue: 0.46, alpha: 1.0)
        UITabBar.appearance().unselectedItemTintColor = customColor
    }
    
    var body: some View {
       
        ZStack {
          
            TabView {
                SwiftUIView1()
                    .tabItem {
                      
                        Text("API1")
                            .font(.system(size: 16))
                    }.toolbar(.visible, for: .tabBar)
                
                    
                SwiftUIView2()
                    .tabItem {
                      
                        Text("API2")
                            .font(.system(size: 16))
                    }.toolbar(.visible, for: .tabBar)
                
                
                        
                        SwiftUIView3()
                            .tabItem {
                              
                                Text("API3")
                                    .font(.system(size: 16))
                            }.toolbar(.visible, for: .tabBar)
                        
                          
                        
                        SwiftUIView4()
                            .tabItem {
                              
                                Text("API4")
                                    .font(.system(size: 16))
                            }.toolbar(.visible, for: .tabBar)
                        
                           
                SwiftUIView5()
                    .tabItem {
                      
                        Text("API5")
                            .font(.system(size: 16))
                    }.toolbar(.visible, for: .tabBar)
                
                   
                
                
            }
            .accentColor(.black)
            .toolbar {
                ToolbarItemGroup(placement: .principal) {
                    
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

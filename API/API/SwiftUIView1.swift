
import SwiftUI

struct Quote0: Codable {
 
   
    var name: String
   var model: String
    //var title: String
    
}

struct SwiftUIView1: View {
    @State private var quotes = [Quote0]()
    
    var body: some View {
        NavigationView {
            
            List(quotes, id: \.name) { quote in
                
                VStack(alignment: .leading){
                    
                  
                    Text(quote.name)
                        .font(.headline)
                    Text(quote.model)
                       .font(.headline)
                  //  Text(quote.title)
                    
                }
            }
            
            
           .navigationTitle("HomeWifi")
            .task{
                await fetchData()
            }
            
        }
    }
    
    func fetchData() async{
        
        
        guard let url = URL(string: "https://api.opensensemap.org/boxes?model=homeWifi") else {
            
            print("hey man THIS URL DOES NOT WORK")
            
            return
        }
     
        do {
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([Quote0].self, from: data) {
                quotes  = decodedResponse
            }
        } catch {
            print("bod news... this data isn't valid ")
        }
    }
    
    
}

struct SwiftUIView1_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView1()
    }
}


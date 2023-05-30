
import SwiftUI

struct Quote3: Codable {
 
    var id : String
    var name: String
  //var color: String
    //var date: Int
   // var logo: Image
    
}

struct SwiftUIView3: View {
    @State private var quotes = [Quote3]()
    
    var body: some View {
        NavigationView {
            
            List(quotes, id: \.name) { quote in
                
                VStack(alignment: .leading){
                    
                  
                    Text(quote.name)
                        .font(.headline)
                    Text(quote.id)
                    //Image(.logo)
                  //  Text(quote.date)
                    
                }
            }
            
            
           .navigationTitle("Fun & Games")
            .task{
                await fetchData()
            }
            
        }
    }
    
    func fetchData() async{
        
        
        guard let url = URL(string: "https://api.tcgdex.net/v2/en/sets") else {
            
            print("hey man THIS URL DOES NOT WORK")
            
            return
        }
     
        do {
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([Quote3].self, from: data) {
                quotes  = decodedResponse
            }
        } catch {
            print("bod news... this data isn't valid ")
        }
    }
    
    
}

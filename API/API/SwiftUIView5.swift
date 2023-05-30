
import SwiftUI

struct Quote5: Codable {
 
   var id : Int
    var name: String
  //var color: String
    //var date: Int
   // var logo: Image
    
}

struct SwiftUIView5: View {
    @State private var quotes = [Quote5]()
    
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
            
            if let decodedResponse = try? JSONDecoder().decode([Quote5].self, from: data) {
                quotes  = decodedResponse
            }
        } catch {
            print("bod news... this data isn't valid ")
        }
    }
    
    
}


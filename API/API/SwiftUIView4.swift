
import SwiftUI

struct Quote4: Codable {
 
    
    var name: String
   // var description: String
  //var color: String
    //var date: Int
   // var logo: Image
    
}

struct SwiftUIView4: View {
    @State private var quotes = [Quote4]()
    
    var body: some View {
        NavigationView {
            
            List(quotes, id: \.name) { quote in
                
                VStack(alignment: .leading){
                    
                  
                    Text(quote.name)
                        .font(.headline)
               //     Text(quote.description)
                    //Image(.logo)
                  //  Text(quote.date)
                    
                }
            }
            
            
           .navigationTitle("Filterlists")
            .task{
                await fetchData()
            }
            
        }
    }
    
    func fetchData() async{
        
        
        guard let url = URL(string: "http://filterlists.com/api/directory/lists") else {
            
            print("hey man THIS URL DOES NOT WORK")
            
            return
        }
     
        do {
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([Quote4].self, from: data) {
                quotes  = decodedResponse
            }
        } catch {
            print("bod news... this data isn't valid ")
        }
    }
    
    
}



import SwiftUI

struct Quote1: Codable {
 
   
    var name: String
   var localName: String
    //var date: Int
    
}

struct SwiftUIView2: View {
    @State private var quotes = [Quote1]()
    
    var body: some View {
        NavigationView {
            
            List(quotes, id: \.name) { quote in
                
                VStack(alignment: .leading){
                    
                  
                    Text(quote.name)
                        .font(.headline)
                    Text(quote.localName)
//                        .font(.headline)
                 //   Text(quote.date)
                    
                }
            }
            
            
           .navigationTitle("Holidays")
            .task{
                await fetchData()
            }
            
        }
    }
    
    func fetchData() async{
        
        
        guard let url = URL(string: "https://date.nager.at/api/v2/publicholidays/2020/US") else {
            
            print("hey man THIS URL DOES NOT WORK")
            
            return
        }
     
        do {
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([Quote1].self, from: data) {
                quotes  = decodedResponse
            }
        } catch {
            print("bod news... this data isn't valid ")
        }
    }
    
    
}

struct SwiftUIView3_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView3()
    }
}

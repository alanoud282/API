//
//  SwiftUIView1.swift
//  API
//
//  Created by ساره المرشد on 29/05/2023.
//

import SwiftUI

struct SwiftUIView1: View {
  @State private var data: Data?

  var body: some View {
    List {
      if let data = data {
        let response = try! JSONDecoder().decode(Response.self, from: data)
        Text(response.message)
      } else {
        Text("Loading...")
      }
    }
    .task {
        guard let url = URL(string: "https://kfc-chickens.p.rapidapi.com/chickens/2?key=69cca0c2bcmsha544e0c2a7ed3e8p108f6bjsne7d5fe9061d2") else {
          print("Invalid URL")
          return
        }


      do {
        let (data, _) = try await URLSession.shared.data(from: url)
        self.data = data
      } catch {
        print(error)
      }
    }
  }
}

struct Response: Decodable {
  let message: String
}



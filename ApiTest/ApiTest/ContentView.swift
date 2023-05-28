//
//  ContentView.swift
//  ApiTest
//
//  Created by Adriel Bernard Rusli on 23/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var result = [TaskEntry]()
    @State var results = [Meal]()
    
    func loadData() {
            guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata") else {
                print("Invalid URL")
                return
            }
            let request = URLRequest(url: url)

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    if let response = try? JSONDecoder().decode([Meal].self, from: data) {
                        DispatchQueue.main.async {
                            self.results = response
                        }
                        return
                    }
                }
            }.resume()
        }
    
    var body: some View {
        VStack {
            List(results, id: \.id) { item in
                        VStack(alignment: .leading) {
                            Text(item.name)
                        }
                    }.onAppear(perform: loadData)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

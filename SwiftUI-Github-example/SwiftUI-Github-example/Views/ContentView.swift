//
//  ContentView.swift
//  SwiftUI-Github-example
//
//  Created by Qilin on 2020/08/30.
//  Copyright © 2020 Ogawa Yuki. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var query = ""
    @EnvironmentObject private var searchRepositories: SearchRepositories
    var body: some View {
        VStack{
            SearchBar(query: $query) {
                self.searchRepositories.fetch(queryString: self.query)
            }
            if self.searchRepositories.repositories.isEmpty {
                Spacer()
                Text("Empty");
                Spacer()
            }
            else {
                List(self.searchRepositories.repositories, id: \.id){ repogitory in
                    RepositoryRow(repository: repogitory).onTapGesture {
                        guard let url = URL(string: repogitory.url) else { return }
                        UIApplication.shared.open(url)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

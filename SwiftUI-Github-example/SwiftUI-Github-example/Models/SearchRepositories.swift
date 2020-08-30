//
//  SearchResults.swift
//  SwiftUI-Github-example
//
//  Created by Qilin on 2020/08/30.
//  Copyright © 2020 Ogawa Yuki. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
import Apollo

final class SearchRepositories: ObservableObject {
    @Published var repositories: [SearchMostTopStarQuery.Data.Search.Edge.Node.AsRepository] = []
    
    func fetch(queryString: String) {
        Network.shared.apollo.fetch(query: SearchMostTopStarQuery(queryString: queryString, first: 50)) { result in
            self.repositories.removeAll()
            guard let data = try? result.get().data else { return }
            guard let edges = data.search.edges else { return }
            for edge in edges {
                guard let repository = edge?.node?.asRepository else { continue; }
                self.repositories.append(repository)
            }
        }
    }
}

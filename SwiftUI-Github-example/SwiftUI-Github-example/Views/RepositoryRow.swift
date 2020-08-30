//
//  RepositoryRow.swift
//  SwiftUI-Github-example
//
//  Created by Qilin on 2020/08/30.
//  Copyright © 2020 Ogawa Yuki. All rights reserved.
//

import SwiftUI

struct RepositoryRow: View {
    var repository: SearchMostTopStarQuery.Data.Search.Edge.Node.AsRepository
    var body: some View {
        VStack(alignment: .leading) {
            Text(repository.name).fontWeight(.bold)
            Text("Star: \(repository.stargazers.totalCount) Fork: \(repository.forks.totalCount)")
        }
    }
}



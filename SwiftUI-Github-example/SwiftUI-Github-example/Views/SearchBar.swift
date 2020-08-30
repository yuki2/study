//
//  SearchBar.swift
//  SwiftUI-Github-example
//
//  Created by Qilin on 2020/08/30.
//  Copyright © 2020 Ogawa Yuki. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    @Binding var query: String
    var onCommit: () -> Void = {}
    
    var body: some View {
        VStack{
            TextField("Search repogitory",
                      text: $query,
                      onEditingChanged: { (_) in},
                      onCommit: self.onCommit)
            .padding()
            Color.black.frame(height: 0.5).opacity(0.7)
        }
    }
}

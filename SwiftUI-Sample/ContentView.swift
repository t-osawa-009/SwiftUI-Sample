//
//  ContentView.swift
//  SwiftUI-Sample
//
//  Created by dev on 2019/07/23.
//  Copyright © 2019 dev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var numbers: [Int] = [1, 2, 3, 4, 5]
    var body: some View {
        NavigationView {
            List.init(numbers) { number in
                HStack {
                    Text(number.description)
                }
                
            }.navigationBarTitle(Text("Number list"))
                .navigationBarItems(leading: Button("Add", action: add), trailing: Button("Remove", action: remove))
        }
    }
    
    func add() {
        numbers.append(numbers.count + 1)
    }
    
    func remove() {
        guard !numbers.isEmpty else {
            return
        }
        numbers = numbers.dropLast()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

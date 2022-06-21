//
//  ContentView.swift
//  FetchDataApi
//
//  by Developer Light on 21.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var comments = [Comments]()
    
    var body: some View {
        NavigationView {
            List(comments) { comment in
                Text(comment.name)
                Text(comment.body)
            }
            .onAppear {
                apiCall().getUserComments {(comments) in
                    self.comments = comments
                }
            }
            .navigationTitle("Comments")
            .listStyle(.grouped)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  H4CK3R N3WS
//
//  Created by Christian Martinez on 10/2/26.
//

import SwiftUI
import WebKit


struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()//Acts like an atenna, it hears the broadcast from "Published" and instantly refreshes
    var body: some View {
        NavigationView{
            //Each post in posts array, print title in a list
            List(networkManager.posts){ post in//Whenever the posts changes, it triggers an update on our List
                NavigationLink(destination: WebView(url: URL(string: post.url ?? "No URL for this one")!)) {//This creates a clickable arrow on each post which takes us to the posts url
                    
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("H4CK3R N3WS")
        }
        .onAppear {
            networkManager.fetchData()
        }//Performs a function once our "var body view" appears on screen
    }
}

#Preview {
    ContentView()
}


//let posts = [
    //Post(id: "1", title: "Hello"),
    //Post(id: "2", title: "Hallo"),
    //Post(id: "3", title: "Hola")
//]


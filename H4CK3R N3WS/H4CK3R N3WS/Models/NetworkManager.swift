//
//  NetworkManager.swift
//  H4CK3R N3WS
//
//  Created by Christian Martinez on 10/2/26.
//

import Foundation
internal import Combine

class NetworkManager: ObservableObject{//The protocol is telling the views/code to keep a look at this class
    
    @Published var posts = [Post]()//If a change occurs in this variable, broadcast a signal to notify there was an update
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)//We are going to create a default url session
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil{
                    let decoder = JSONDecoder() //We create a JSON decoder if no error
                    if let safeData = data{
                        do{
                           let results = try decoder.decode(Results.self, from: safeData)//If we get ahold of the result data
                            DispatchQueue.main.async{
                                self.posts = results.hits//Make posts equal our results hits array which matches with our JSON
                            }
                        }catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
}

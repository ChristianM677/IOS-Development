//
//  PostData.swift
//  H4CK3R N3WS
//
//  Created by Christian Martinez on 10/2/26.
//
import Foundation

struct Results: Decodable{
    let hits: [Post]
}

struct Post: Decodable, Identifiable{
    var id: String{//Whenever trying to fetch the id, it will look at our objectID and will equal to that
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}

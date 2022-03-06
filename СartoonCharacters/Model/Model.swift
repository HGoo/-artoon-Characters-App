//
//  File.swift
//  СartoonCharacters
//
//  Created by Николай Петров on 05.03.2022.
//


struct Character: Decodable {
    //let info: DetailInfo?
    let results: [DetailResult]?
    
}

struct DetailInfo: Decodable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}


struct DetailResult: Decodable {
    let image: String?
    let name: String?
}

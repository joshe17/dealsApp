//
//  DealsResponse.swift
//  DealsApp
//
//  Created by Joshua Ho on 7/3/23.
//

import Foundation

struct DealsResponse: Codable {
    let data: Deals
    
    private enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}

struct Deals: Codable {
    let deals: [Deal]
    
    private enum CodingKeys: String, CodingKey {
        case deals = "deals"
    }
}


struct Deal: Codable, Identifiable {
    let id: String
    let title: String
    let url: String
    let price: Int
    let description: String
    let product: Product
    let createdAt: String
    let updatedAt: String
    let likes: [ProductLike]
    let dislikes: [ProductDislike]
    let comments: [Comment]
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case url = "url"
        case price = "price"
        case description = "description"
        case product = "product"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case likes = "likes"
        case dislikes = "dislikes"
        case comments = "comments"
    }
    
//    func formatCreatedDate() -> String {
//        let date =  Date(timeIntervalSince1970: Double(createdAt) ?? 0)
//        let formatted = date.formatted(date: .abbreviated, time: .omitted)
//        return formatted
//    }
    func formatUpdatedDate() -> String {
        let date =  Date(timeIntervalSinceReferenceDate: Double(product.updatedAt) ?? 0)
        let formatted = date.formatted(date: .abbreviated, time: .omitted)
        return formatted
    }
}

struct Product: Codable {
    let availability: String
    let image: String
    let description: String
    let sku: String
    let updatedAt: String
    
    private enum CodingKeys: String, CodingKey {
        case availability = "availability"
        case image = "image"
        case description = "description"
        case sku = "sku"
        case updatedAt = "updatedAt"
    }
}

struct ProductLike: Codable, Identifiable {
    let id: String
    let user: User
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case user = "user"
    }
}

struct User: Codable, Identifiable {
    let id: String
    let name: String
    let likes: [UserLike]
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case likes = "likes"
    }
}

struct UserLike: Codable, Identifiable {
    let id: String
    let deal: AbbreviatedDeal
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case deal = "deal"
    }
}

struct AbbreviatedDeal: Codable, Identifiable {
    let id: String
    let title: String
    let url: String
    let price: Int
    let createdAt: String
    let updatedAt: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case url = "url"
        case price = "price"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
    }
}

struct ProductDislike: Codable, Identifiable{
    let id: String
    let user: DislikeUser
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case user = "user"
    }
}

struct DislikeUser: Codable {
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

struct Comment: Codable, Identifiable {
    let id: String
    let createdAt: String
    let text: String
    let user: CommentUser
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case createdAt = "createdAt"
        case text = "text"
        case user = "user"
    }
}

struct CommentUser: Codable, Identifiable {
    let id: String
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}

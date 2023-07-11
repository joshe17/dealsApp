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


struct Deal: Codable, Identifiable, Hashable {
    let id: String
    let title: String
    let url: String
    let price: Int
    let description: String?
    let product: Product?
    let createdAt: String
    let updatedAt: String
    let likes: [ProductLike]?
    let dislikes: [ProductDislike]?
    let comments: [Comment]?
    
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
    
    static func == (lhs: Deal, rhs: Deal) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    func formatUpdatedDate() -> String {
        let date =  Date(timeIntervalSinceReferenceDate: Double(product?.updatedAt ?? "") ?? 0)
        let formatted = date.formatted(date: .abbreviated, time: .omitted)
        return formatted
    }
    
    func getRelatedDeals(allDeals: [Deal]) -> [Deal] {
        var res: [Deal] = []
        if let allLikes = likes {
            for l in allLikes {
                if let userLikes = l.user.likes {
                    for abbreviatedDeal in userLikes {
                        if abbreviatedDeal.deal.id != id && res.contains(abbreviatedDeal.deal) == false {
                            if let index = allDeals.firstIndex(of: abbreviatedDeal.deal) {
                                res.append(allDeals[index])
                            }
                        }
                    }
                }
            }
        }
        return res
    }
}

struct Product: Codable, Hashable {
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

struct ProductLike: Codable, Identifiable, Hashable {
    let id: String
    let user: User
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case user = "user"
    }
}

struct User: Codable, Identifiable, Hashable {
    let id: String?
    let name: String
    let likes: [UserLike]?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case likes = "likes"
    }
}

struct UserLike: Codable, Identifiable, Hashable {
    let id: String
    let deal: Deal
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case deal = "deal"
    }
}

struct ProductDislike: Codable, Identifiable, Hashable {
    let id: String
    let user: User
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case user = "user"
    }
}


struct Comment: Codable, Identifiable, Hashable {
    let id: String
    let createdAt: String
    let text: String
    let user: User
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case createdAt = "createdAt"
        case text = "text"
        case user = "user"
    }
}


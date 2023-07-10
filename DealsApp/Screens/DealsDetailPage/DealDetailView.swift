//
//  DealDetailView.swift
//  DealsApp
//
//  Created by Joshua Ho on 7/6/23.
//

import SwiftUI



struct DealDetailView: View {
    let deal : Deal
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                DealDetailHeroView(deal: deal)
                
                Divider()
                    .frame(height: 4)
                    .overlay(Color("lightPurple"))
                    .padding(.horizontal)
                
                DealDetailDescriptionView(deal: deal)
                
                Divider()
                    .frame(height: 4)
                    .overlay(Color("lightPurple"))
                    .padding(.horizontal)
                
                if deal.comments.count > 0 {
                    DealDetailsCommentsView(comments: deal.comments)
                }
            }
        }
        .background(Color("darkPurple"))
        .foregroundColor(.white)
        .toolbarBackground(
            Color("darkPurple"),
            for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Deals").font(.title).bold()
                    .foregroundColor(Color("lightPink"))
            }
        }
    }
    
}

//struct DealDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DealDetailView(deal: Deal(id: "1", title: "My Arcade All-Star Stadium Pico Player, Universal", url: "https://www.officedepot.com/a/products/9025577/My-Arcade-All-Star-Stadium-Pico/", price: 1999, description: "What a fantastic price on a must-have product - you should totally buy this right now!", product: Product(availability: "IN STOCK", image: "https://media.officedepot.com/images/t_extralarge%2Cf_auto/products/9025577/9025577_o01.jpg", description: "Enjoy endless fun when you bring along the My Arcade All-Star Stadium Pico Player. This game console features an ergonomic design and a full-color 2\" screen with a built-in speaker. It includes 7 officially licensed Jaleco titles and 100 retro-style bonus games for versatile fun.  Handheld console with an ergonomic and compact design.  Offers 7 officially licensed Jaleco titles including BASES LOADED 1, 2, 3, and 4, GOAL!, RACKET ATTACK and HOOPS.  Bonus 100 retro-style games for added fun.  Full-color 2\" screen.  Built-in speaker with volume control.  Portable console is ideal for long road trips, commuting to work, travel and more.  Powered by 3 AAA batteries (not included).  Includes a user guide.", sku: "9025577", updatedAt: "2023-06-17 19:44:22"), createdAt: "1688149416821", updatedAt: "1688149416821", likes: [ProductLike(id: "1", user: User(id: "1", name: "John Doe", likes: [UserLike(id: "1", deal: AbbreviatedDeal(id: "1", title: "My Arcade All-Star Stadium Pico Player, Universal", url: "https://www.officedepot.com/a/products/9025577/My-Arcade-All-Star-Stadium-Pico/", price: 1999, createdAt: "1688149416821", updatedAt: "1688149416821"))]))], dislikes: [ProductDislike(id: "1", user: DislikeUser(name: "John Doe"))], comments: [Comment(id: "3", createdAt: "1688149416932", text: "The quality of the product is excellent! You are going to love it. Plus, the price is great. I bought it and I am very happy with it.", user: CommentUser(id: "3", name: "Alex Johnson"))]))
//    }
//}
//

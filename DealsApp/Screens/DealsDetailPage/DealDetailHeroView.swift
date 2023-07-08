//
//  DealDetailHeroView.swift
//  DealsApp
//
//  Created by Joshua Ho on 7/6/23.
//

import SwiftUI

struct DealDetailHeroView: View {
    let deal : Deal

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: deal.product.image)) {image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            Link(destination: URL(string: deal.url)!) {
                Text(deal.title)
                    .font(.largeTitle).bold()
                    .multilineTextAlignment(.leading)
            }
            .padding()
                
            HStack {
                NavigationLink(destination: DealsLikesView(likes: deal.likes)){
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text("\(deal.likes.count)").bold()
                }
                
                NavigationLink(destination: DealsDislikesView(dislikes: deal.dislikes)) {
                    Image(systemName: "hand.thumbsdown.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding(.leading)
                    Text("\(deal.dislikes.count)").bold()
                }
 
                Spacer()
                
                Text("$\(deal.price)").font(.system(size: 50)).bold()
                    .foregroundColor(Color("lightPink"))
            }
            .padding()
        }
    }
}

//struct DealDetailHeroView_Previews: PreviewProvider {
//    static var previews: some View {
//        DealDetailHeroView()
//    }
//}

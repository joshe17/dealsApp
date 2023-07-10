//
//  FeaturedDealView.swift
//  DealsApp
//
//  Created by Joshua Ho on 7/4/23.
//

import SwiftUI

struct FeaturedDealView: View {
    let deal: Deal
    
    var body: some View {
        VStack {
            Text(deal.title).font(.title3).bold()
                .padding()
            Spacer()
            if let imageLink = deal.product?.image {
                AsyncImage(url: URL(string: imageLink)) {image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 250)
                .cornerRadius(20)
            }

            HStack {
                Image(systemName: "heart.fill")
                Text("\(deal.likes?.count ?? 0)").bold()
                Spacer()
                Text("$\(deal.price)").font(.system(size: 30)).bold()
                    .foregroundColor(Color("lightPink"))
            }
            .padding()
            
        }
        .frame(maxWidth: .infinity)
        .background(Color("lightPurple"))
        .foregroundColor(.white)
        .overlay( /// apply a rounded border
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray, lineWidth: 5)
        ).cornerRadius(20)
            .padding(.horizontal, 40)
            .padding(.bottom)
    }
}

//struct FeaturedDealView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeaturedDealView()
//    }
//}

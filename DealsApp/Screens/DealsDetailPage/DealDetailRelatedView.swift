//
//  DealDetailRelatedView.swift
//  DealsApp
//
//  Created by Joshua Ho on 7/10/23.
//

import SwiftUI

struct DealDetailRelatedView: View {
    let deal: Deal
    let allDeals: [Deal]
    var body: some View {
        VStack {
            Text("Users who liked this also liked:")
                .frame(maxWidth:.infinity, alignment: .leading)
                .font(.title2).bold()
                .foregroundColor(.white)
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(deal.getRelatedDeals(allDeals: allDeals)) { deal in
                        NavigationLink(value: deal) {
                            VStack {
                                if let imageLink = deal.product?.image {
                                    
                                    AsyncImage(url: URL(string: imageLink)) {image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                            .aspectRatio(1, contentMode: .fill)
                                            .clipped() //A
                                    } placeholder: {
                                        ZStack {
                                            ProgressView()
                                        }
                                        .frame(width: 175, height: 180)
                                        .cornerRadius(20)
                                    }
                                }
                                
                                Text(deal.title)
                                    .lineLimit(1)
                                    .bold()
                                    .padding()

                            }
                            .frame(width: 175)
                            .background(Color("lightPurple"))
                            .cornerRadius(20)
                        }
                    }
                }
            }
        }
        .padding()
    }
}

//struct DealDetailRelatedView_Previews: PreviewProvider {
//    static var previews: some View {
//        DealDetailRelatedView()
//    }
//}

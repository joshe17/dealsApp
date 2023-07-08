//
//  DealGridView.swift
//  DealsApp
//
//  Created by Joshua Ho on 7/5/23.
//

import SwiftUI

struct DealGridView: View {
    let deals: [Deal]

    let columns : [GridItem] = [
        GridItem(.flexible(), alignment: .center),
        GridItem(.flexible(), alignment: .center)
    ]
    
    @State var seeMore = false
    var body: some View {
        VStack {
            LazyVGrid(columns: columns) {
                ForEach(seeMore == true ? deals : Array(deals.prefix(4))) { deal in
                    NavigationLink(destination: DealDetailView(deal: deal)) {
                        VStack {
                            AsyncImage(url: URL(string: deal.product.image)) {image in
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
                            
                            Text(deal.title)
                                .lineLimit(1)
                                .bold()
                                .padding()
                            
                        }
                        .background(Color("lightPurple"))
                        .cornerRadius(20)
                    }
                    
                }
            }
            
            Button {
                seeMore.toggle()
            } label: {
                Text(seeMore ? "See Less" : "See More")
                    .foregroundColor(.white)
                    .font(.title3).bold()
                    .padding()
            }
            .frame(maxWidth: .infinity)
            .background(Color("lightPurple"))
            .cornerRadius(20)
            .overlay( /// apply a rounded border
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.gray, lineWidth: 5)
            ).cornerRadius(20)

        }
        .padding()

    }
}

//struct DealGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        DealGridView()
//    }
//}

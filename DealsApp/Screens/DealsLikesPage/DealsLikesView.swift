//
//  DealsLikesView.swift
//  DealsApp
//
//  Created by Joshua Ho on 7/7/23.
//

import SwiftUI

struct DealsLikesView: View {
    let likes: [ProductLike]
    
    var body: some View {
        VStack {
            if likes.count > 0 {
                ScrollView(showsIndicators: false) {
                    Text("Likes")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle).bold()
                        .padding()
                    ForEach(likes) { like in
                        HStack {
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding()
                            Spacer()
                            Text(like.user.name)
                                .bold()
                                .padding()
                        }
                        .scrollContentBackground(.hidden)
                        .background(Color("lightPurple"))
                        .cornerRadius(20)
                        .padding(.horizontal)
                    }
                    Spacer()
                }
            }
            else {
                Text("Nobody has liked this product")
                    .bold()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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

//struct DealsLikesView_Previews: PreviewProvider {
//    static var previews: some View {
//        DealsLikesView()
//    }
//}

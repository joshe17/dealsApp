//
//  DealsDislikesView.swift
//  DealsApp
//
//  Created by Joshua Ho on 7/7/23.
//

import SwiftUI

struct DealsDislikesView: View {
    let dislikes: [ProductDislike]
    
    var body: some View {
        VStack {
            if dislikes.count > 0 {
                ScrollView(showsIndicators: false) {
                    Text("Dislikes")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.largeTitle).bold()
                        .padding()
                    ForEach(dislikes) { dislike in
                        HStack {
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding()
                            Spacer()
                            Text(dislike.user.name)
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
                Text("Nobody has disliked this product")
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

//
//struct DealsDislikesView_Previews: PreviewProvider {
//    static var previews: some View {
//        DealsDislikesView()
//    }
//}

//
//  DealDetailsCommentsView.swift
//  DealsApp
//
//  Created by Joshua Ho on 7/6/23.
//

import SwiftUI

struct DealDetailsCommentsView: View {
    let comments: [Comment]

    var body: some View {
        VStack {
            Text("Comments From Other Users:")
                .frame(maxWidth:.infinity, alignment: .leading)
                .font(.title).bold()
                .foregroundColor(.white)
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(comments) { comment in
                        ZStack {
                            Image("bg3")
                                .resizable()
                                .scaledToFill()
                                .overlay(LinearGradient(colors: [.clear, Color("lightPurple")], startPoint: .bottom, endPoint: .center))
                            VStack(alignment: .leading) {
                                Text("\(comment.user.name) says...")
                                    .font(.title2).bold()
                                    .padding()
                                Text(comment.text)
                                    .padding([.horizontal, .bottom])
                                Spacer()
                            }
                            .frame(width: 340)
                        }
                        .frame(width: 340)
                        .background(Color("lightPurple"))
                        .cornerRadius(20)
                        .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white, lineWidth: 10)
                        ).cornerRadius(20)
                    }
                }
            }

            
        }
        .padding()

    }
}

//struct DealDetailsCommentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DealDetailsCommentsView()
//    }
//}

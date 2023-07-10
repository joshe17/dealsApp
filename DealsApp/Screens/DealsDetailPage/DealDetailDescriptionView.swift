//
//  DealDetailDescriptionView.swift
//  DealsApp
//
//  Created by Joshua Ho on 7/6/23.
//

import SwiftUI

struct DealDetailDescriptionView: View {
    let deal : Deal
    @State var showMoreDescription = false
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Availability: \(deal.product?.availability ?? "n/a")")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                        .foregroundColor(Color("lightPink"))
                        .padding(.bottom)
                    Text("Last updated: \(deal.formatUpdatedDate())")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .bold()
                }
                Spacer()
            }
            .padding(.bottom)
            
            VStack {
                Text(deal.product?.description ?? "no description available")
                    .lineLimit(showMoreDescription ? nil : 6)
                    .padding()
                Button {
                    showMoreDescription.toggle()
                } label: {
                    Image(systemName: showMoreDescription ? "chevron.compact.up" : "chevron.compact.down")
                        .resizable()
                        .frame(width: 20, height: 10)
                }
                .padding()
            }
            .background(Color("lightPurple"))
            .cornerRadius(15)
            
        }
        .padding()
    }
}

//struct DealDetailDescriptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        DealDetailDescriptionView()
//    }
//}

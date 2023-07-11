//
//  ContentView.swift
//  DealsApp
//
//  Created by renupunjabi on 7/3/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                ScrollView(showsIndicators: false) {
                    VStack {
                        ZStack {
                            Image("bg3")
                                .resizable()
                                .scaledToFill()
                                .overlay(LinearGradient(colors: [.clear, Color("darkPurple")], startPoint: .top, endPoint: .bottom))
                            Text("Get the Best Deals")
                                .font(.system(size: 55)).bold()
                                .multilineTextAlignment(.center)
                        }

                        if let featured = viewModel.getMostPopularDeal() {
                            Text("Most Popular Deal")
                                .font(.title3).bold()
                                .padding(.horizontal, 30)
                                .padding(.top)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            NavigationLink(value: featured) {
                                FeaturedDealView(deal: featured)
                            }
                        }
                        
                        Text("Current Deals")
                            .font(.title3).bold()
                            .padding(.horizontal, 30)
                            .padding(.top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        DealGridView(deals: viewModel.deals, path: $path)
                            .padding()
                    }
                    .toolbarBackground(
                        Color("darkPurple"),
                        for: .navigationBar)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Button {
                                path.removeLast(path.count)
                            } label: {
                                Text("Deals").font(.title).bold()
                                    .foregroundColor(Color("lightPink"))
                            }
                        }
                    }

                }
            }
            .background(Color("darkPurple"))
            .foregroundColor(.white)
            .navigationDestination(for: Deal.self) { deal in
                DealDetailView(deal: deal, allDeals: viewModel.deals, path: $path)
            }
        }

        .onAppear {
            viewModel.getDeals()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  BreakingBadView.swift
//  ApiCallsExercise
//
//  Created by Lama AL Yousef on 30/05/2023.
//

import SwiftUI

struct BreakingBadView: View {
    @StateObject private var viewModel = BreakingBadViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.quotes, id: \.quote) { quote in
                VStack(alignment: .leading) {
                    Text(quote.quote)
                        .font(.headline)
                    Text("- \(quote.author)")
                        .font(.subheadline)
                }
            }
            .navigationTitle("Breaking Bad Quotes")
        }
        .onAppear {
            Task {
                await viewModel.fetchQuotes()
            }
        }
    }
}

struct BreakingBadView_Previews: PreviewProvider {
    static var previews: some View {
        BreakingBadView()
    }
}

//
//  BreakingBadViewModel.swift
//  ApiCallsExercise
//
//  Created by Lama AL Yousef on 30/05/2023.
//

import SwiftUI

class BreakingBadViewModel: ObservableObject {
    @Published var quotes: [Quote] = []
    
    func fetchQuotes() async {
//------------------------------------------------------------
        // # create url
        guard let url = URL(string: "https://api.breakingbadquotes.xyz/v1/quotes/100") else {
            print("Hey Girl THIS url is Not working! ")
            return
        }
//------------------------------------------------------------
        // # fetch data from the url
        
        do  {
            let (data , _) = try await URLSession.shared.data(from: url)
            // decode that data
            if let decodedResponse = try? JSONDecoder().decode([Quote].self, from: data){
                quotes = decodedResponse
            }//jsondecoder
        } //do fetch
        catch{
          print("bad news this data is not valid :(")
            
         }// catch
    }//func load data
}//class

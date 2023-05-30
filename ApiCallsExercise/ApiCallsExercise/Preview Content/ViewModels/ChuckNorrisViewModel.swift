//
//  ChuckNorrisViewModel.swift
//  ApiCallsExercise
//
//  Created by Lama AL Yousef on 30/05/2023.
//

import SwiftUI

class ChuckNorrisViewModel: ObservableObject {
    @Published var jokes: [Joke] = []
    
    func fetchJokes() async {
//------------------------------------------------------------
        // # create url
        guard let url = URL(string: "https://api.chucknorris.io/jokes/random") else {
            print("Hey Girl THIS url is Not working! ")
            return
        }
//------------------------------------------------------------
        // # fetch data from the url
        
        do  {
            let (data, _) = try await URLSession.shared.data(from: url)
            // decode that data
            if let decodedResponse = try? JSONDecoder().decode(Joke.self, from: data) {
                jokes = [decodedResponse]
            }//jsondecoder
        } //do fetch
        catch{
          print("bad news this data is not valid :(")
            
         }// catch
    }//func load data
}//class




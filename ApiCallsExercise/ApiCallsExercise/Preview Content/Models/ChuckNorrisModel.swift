//
//  ChuckNorrisModel.swift
//  ApiCallsExercise
//
//  Created by Lama AL Yousef on 30/05/2023.
//

import Foundation
struct Joke: Codable,Identifiable, Hashable {
    let id = UUID()
    let value: String
    let icon_url:String
    let categories : [String]
    let created_at : String
    
}


struct ApiError : Codable,Error{
    let error: Bool
    let message : String
    
    
    
    
}

extension ApiError{
    static func defaulterror() -> ApiError {
        return ApiError(
        error: true, message: "Something went wrong please try again")
        
    }
}




import SwiftUI

class CatViewModel: ObservableObject {
    @Published var cats: [Cat] = []
    
    func fetchCats() async {
//-------------------------------------------------
        
        // # create url
        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds?limit=100") else {
            print("Hey Girl THIS url is Not working! ")
            return
        }
//-------------------------------------------------
        // # fetch data from the url
        
        do  {
            let (data , _) = try await URLSession.shared.data(from: url)
            // decode that data
            if let decodedResponse = try? JSONDecoder().decode([Cat].self, from: data){
                cats = decodedResponse
            }//jsondecoder
        } //do fetch
        catch{
          print("bad news this data is not valid :(")
            
         }// catch
    }//func load data
}//class

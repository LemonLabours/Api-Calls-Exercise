import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            TabView {
//---------------------------------------------------
                BreakingBadView()
                    .tabItem {
                        Image(systemName: "pills.circle.fill")
                            .renderingMode(.template)
                            .font(.title)
                        
                    }  .toolbar(.visible, for: .tabBar)
//---------------------------------------------------
                CatView()
                    .tabItem {
                        Image(systemName: "pawprint.fill")
                            .renderingMode(.template)
                            .font(.title)
                    }.toolbar(.visible, for: .tabBar)
//---------------------------------------------------
                ChuckNorrisView()
                    .tabItem {
                        Image(systemName: "figure.fall")
                            .renderingMode(.template)
                            .font(.title)
                    
                    }.toolbar(.visible, for: .tabBar)
//---------------------------------------------------
                DigimonView()
                    .tabItem {
                        Image(systemName: "moon.fill")
                            .renderingMode(.template)
                            .font(.title)
                
                    }.toolbar(.visible, for: .tabBar)
//---------------------------------------------------
                PokemonView()
                    .tabItem {
                        Image(systemName: "tree.fill")
                            .renderingMode(.template)
                            .font(.title)
                        
                    }  .toolbar(.visible, for: .tabBar)
            }//TabView
//---------------------------------------------------
        }// zstack
        .navigationBarBackButtonHidden()
    }// body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

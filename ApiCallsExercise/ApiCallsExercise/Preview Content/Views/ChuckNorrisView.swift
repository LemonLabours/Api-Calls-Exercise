import SwiftUI

struct ChuckNorrisView: View {
    @StateObject private var viewModel = ChuckNorrisViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.jokes, id: \.id) { joke in
                VStack(alignment: .leading) {
                    Text(joke.value)
                        .font(.title)
                    // Display the image using AsyncImage
                    AsyncImage(url: URL(string: joke.icon_url)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    } placeholder: {
                        ProgressView()
                    }
                }
            }
            .navigationTitle("Chuck Norris")
        }
        .onAppear {
            Task {
                await viewModel.fetchJokes()
            }
        }
    }
}

struct ChuckNorrisView_Previews: PreviewProvider {
    static var previews: some View {
        ChuckNorrisView()
    }
}

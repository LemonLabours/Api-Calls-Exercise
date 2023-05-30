
    import SwiftUI

    struct CatView: View {
        @StateObject private var viewModel = CatViewModel()
        
        var body: some View {
            NavigationView {
                List(viewModel.cats, id: \.self) { cat in
                    VStack(alignment: .leading) {
                        Text(cat.name)
                            .font(.headline)
                        Text("\(cat.description)")
                            .font(.subheadline)
                    }
                }
                .navigationTitle("Cats")
            }
            .onAppear {
                Task {
                    await viewModel.fetchCats()
                }
            }
        }
    }

    struct CatView_Previews: PreviewProvider {
        static var previews: some View {
            CatView()
        }
    }


    import SwiftUI

    struct DigimonView: View {
        @StateObject private var viewModel = DigimonViewModel()
        
        var body: some View {
            NavigationView {
                List(viewModel.digimons, id: \.self) { digimon in
                    VStack(alignment: .leading) {
                    
                        Text("\(digimon.name)")
                            .font(.title)
                    }
                }
                .navigationTitle("Digimons")
            }
            .onAppear {
                Task {
                    await viewModel.fetchDigimons()
                }
            }
        }
    }

    struct DigimonView_Previews: PreviewProvider {
        static var previews: some View {
            DigimonView()
        }
    }

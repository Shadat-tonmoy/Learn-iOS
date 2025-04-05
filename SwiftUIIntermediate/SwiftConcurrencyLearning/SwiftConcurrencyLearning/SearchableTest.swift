//
//  SearchableTest.swift
//  SwiftConcurrencyLearning
//
//  Created by Shadat Tonmoy on 8/4/23.
//

import SwiftUI
import Combine


struct Resturant : Identifiable, Hashable {
    
    var id : String
    var name : String
    var cuisin : Cuisine
}

enum Cuisine : String {
    
    case american, italian, japaneese
    
}

class ResturantManager {
    
    func getAllResturant() async -> [Resturant] {
        
        var resturants = [
            Resturant(id: "1", name: "Burger Shack", cuisin: .american),
            Resturant(id: "2", name: "Pasta Palace", cuisin: .italian),
            Resturant(id: "3", name: "Sushi Heaven", cuisin: .japaneese),
            Resturant(id: "4", name: "Local Market", cuisin: .american)
        ]
        
        return resturants
    }
    
    
}


class SearchableViewModel : ObservableObject {
    
    @Published private (set) var allResturants : [Resturant] = []
    @Published private (set) var filteredResturants : [Resturant] = []
    @Published var searchText : String = ""
    private var cancellables = Set<AnyCancellable>()
    
    private var resturantManager : ResturantManager = ResturantManager()
    
    init() {
        addSubscribers()
        
    }
    
    private func addSubscribers() {
        $searchText
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .sink(receiveValue: { [weak self] updatedText in
                self?.filterResturants(searchText: updatedText)
            })
            .store(in: &cancellables)
        
    }
    
    private func filterResturants(searchText : String) {
        let textToSearch = searchText.lowercased()
        if(searchText.isEmpty) {
            filteredResturants = [] //allResturants
        } else {
            filteredResturants = allResturants.filter { resturant in
                let nameMatched = resturant.name.lowercased().contains(textToSearch)
                let cuisinMatched = resturant.cuisin.rawValue.lowercased().contains(textToSearch)
                
                return nameMatched || cuisinMatched
            }
        }
    }
    
    func isSearching() -> Bool {
        return !searchText.isEmpty
    }
    
    func getAllResturants() {
        Task {
            let result = await resturantManager.getAllResturant()
            await MainActor.run {
                allResturants = result
            }
        }
    }
    
}


struct SearchableTest: View {
    
    @StateObject private var viewModel : SearchableViewModel = SearchableViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.isSearching() ? viewModel.filteredResturants : viewModel.allResturants, id: \.self, rowContent: { resutrant in
                    ResturantRow(resturant: resutrant)
                    
                })
            }
            .navigationTitle("Resturants")
            .searchable(text: $viewModel.searchText,placement: .automatic, prompt: Text("Search For Resturant"))
            .onAppear {
                viewModel.getAllResturants()
            }
            
        }
        
        
    }
}

struct ResturantRow : View {
    
    let resturant : Resturant
    
    var body: some View {
        VStack(alignment : .leading) {
            Text(resturant.name)
                .font(.headline)
            Text(resturant.cuisin.rawValue.capitalized)
                .font(.callout)
        }
    }
}

struct SearchableTest_Previews: PreviewProvider {
    static var previews: some View {
        SearchableTest()
    }
}

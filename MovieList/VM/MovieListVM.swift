//
//  MovieListVM.swift
//  MovieList
//
//  Created by Md Zahidul Islam Mazumder on 11/3/23.
//

import Foundation

class MovieListVM:ObservableObject {
    
    var dispatchWorkItem:DispatchWorkItem?
    private var networkManager = NetworkManager()
    
    @Published var searchText = ""
    
    @Published var results:[Results] = []
    
    init(){
        getItems(query: "all")
    }
    
 
    
    func getItems (query:String) {
        dispatchWorkItem?.cancel()
        
        if query.isEmpty {
            self.results = []
            return
        }
        
        let requestWorkItem = DispatchWorkItem {[weak self] in
            
            do {
                let request = try Router.movie(query).requestURL()
                self?.networkManager.request(request) {[weak self] (result: Result<MovieDataBase, Error>) in
                    switch result {
                    case .success(let repositoryModelBase):
                        self?.results = repositoryModelBase.results ?? []
                    case .failure(let error):
                        if let error = error as? NetworkError {
                            let message = ErrorMapper(error: error).message
                            print(message)
                        } else {
                            print(error)
                        }
                    }

                }
            } catch {
                print("Errors: \(error)")
            }
        }
        
        dispatchWorkItem = requestWorkItem
        DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(400), execute: dispatchWorkItem!)
        
    }
    
}

//
//  MovieListView.swift
//  MovieList
//
//  Created by Md Zahidul Islam Mazumder on 11/3/23.
//

import SwiftUI

struct MovieListView: View {
    @StateObject var movieListVM = MovieListVM()
    var body: some View {
        NavigationStack {
            VStack {
                Text("No item avaiable")
                    .isEmpty(movieListVM.results.count != 0)
                    .padding(.top,200)
                List(movieListVM.results, id:\.id){ result in
                    MovieCellView(result: result)
                }
            }
            .navigationTitle("Movie List")
        }
        .searchable(text: $movieListVM.searchText.onChange({ value in
            movieListVM.getItems(query: value)
        }))
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}

//
//  MovieCellView.swift
//  MovieList
//
//  Created by Md Zahidul Islam Mazumder on 12/3/23.
//

import SwiftUI

struct MovieCellView: View {
    let result:Results
    var body: some View {
        HStack{
            
            VStack{
                Spacer()
                
                AsyncImage(url: URL(string: imgRoot + (result.poster_path ?? ""))){ image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 80, height: 100)

                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 5){
                Text(result.original_title ?? "")
                
                Text(result.overview ?? "")
                    .font(.caption)
                
                Spacer()
            }
            
        }
    }
}

//struct MovieCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieCellView()
//    }
//}

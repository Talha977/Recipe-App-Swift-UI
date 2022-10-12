//
//  CategoriesView.swift
//  RecipeApp
//
//  Created by Talha Asif on 02/10/2022.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        NavigationView {
            List{
            ForEach(Category.allCases) { category in
                
                NavigationLink(destination: CategoryView(category: category) , label: {
                    Text(category.rawValue + "s")
                })
            }
            }
            
              .navigationTitle("Categories")
        }
        .navigationViewStyle(.stack)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}

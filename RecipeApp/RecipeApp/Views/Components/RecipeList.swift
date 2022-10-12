//
//  RecipeList.swift
//  RecipeApp
//
//  Created by Talha Asif on 02/10/2022.
//

import SwiftUI

struct RecipeList: View {

    var recipes = [Recipe]()
    var body: some View {
        
        VStack {
            
            HStack {
                
                Text("\(recipes.count) \(recipes.count > 1 ? "recipes" : "recipe")")
                Spacer()
            }
            
            // As List only populates one view per row so we are using Grid
            LazyVGrid(columns:[GridItem(.adaptive(minimum:120), spacing: 15)],spacing: 15) {
                
                ForEach (recipes){ recipe in
                    
                    NavigationLink(destination:RecipeDetail(recipe: recipe)) {
                        RecipeCard(recipe: recipe)
                    }
                    
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
//        .padding()
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        //        ScrollView{
        RecipeList(recipes: Recipe.all)
        //        }
    }
}

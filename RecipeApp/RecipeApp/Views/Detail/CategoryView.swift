//
//  CategoryView.swift
//  RecipeApp
//
//  Created by Talha Asif on 02/10/2022.
//

import SwiftUI

struct CategoryView: View {
    var category:Category
    // An Environment object suggests that the Observable object was supplied by the parent view
    
    @EnvironmentObject var recipesVM:RecipeViewModel

    
    var recipes:[Recipe]{
        return recipesVM.recipes.filter({$0.category == category.rawValue})
    }
    
    var body: some View {
        ScrollView {
            RecipeList(recipes: recipes)
        }
        .navigationTitle(category.rawValue + "s")
    }
} 
struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Category.dessert)
            .environmentObject(RecipeViewModel())
    }
}

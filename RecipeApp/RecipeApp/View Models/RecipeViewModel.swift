//
//  RecipeViewModel.swift
//  RecipeApp
//
//  Created by Talha Asif on 12/10/2022.
//

import Foundation

class RecipeViewModel : ObservableObject {
    // To let know its subscribers that its value is changed
    // Private set is used so that no one can modify its value from another class
    @Published private(set) var recipes:[Recipe] = []
    init () {
        recipes = Recipe.all
    }
    
    func addRecipe(recipe:Recipe) {
        recipes.append(recipe )
    }

}

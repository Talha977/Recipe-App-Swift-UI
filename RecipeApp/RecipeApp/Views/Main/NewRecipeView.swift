//
//  NewRecipeView.swift
//  RecipeApp
//
//  Created by Talha Asif on 02/10/2022.
//

import SwiftUI

struct NewRecipeView: View {
    @State private var showAddRecipe = false
    var body: some View {
        NavigationView {
            Button("Add Recipe manually") {
                showAddRecipe = true
            }
            .navigationTitle("New Recipe")

        }
        .sheet(isPresented: $showAddRecipe, content: {
            AddRecipeView()
        })
        .navigationViewStyle(.stack)
    }
}

struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView()
    }
}

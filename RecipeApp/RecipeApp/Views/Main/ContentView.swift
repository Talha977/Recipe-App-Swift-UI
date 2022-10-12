//
//  ContentView.swift
//  RecipeApp
//
//  Created by Talha Asif on 02/10/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabBar()
        // To test
//        RecipeDetail(recipe: Recipe.all[0])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipeViewModel())
    }
}

//
//  RecipeAppApp.swift
//  RecipeApp
//
//  Created by Talha Asif on 02/10/2022.
//

import SwiftUI

@main
struct RecipeAppApp: App {
    
    // will be created throughout the lifecycle of the app
    @StateObject var recipesViewModel = RecipeViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipesViewModel)
        }
    }
}

//
//  AddRecipeView.swift
//  RecipeApp
//
//  Created by Talha Asif on 12/10/2022.
//

import SwiftUI

struct AddRecipeView: View {
    
    @State private var name:String = ""
    @State private var selectedCategory:Category = Category.main
    @State private var description:String = ""
    @State private var ingredients:String = ""
    @State private var directions:String = ""
    @State private var navigateToRecipe:Bool = false
    
    @EnvironmentObject var recipesVM:RecipeViewModel

    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            
            Form {
                
                Section(header:Text("Name")) {
                    
                    TextField("Name", text: $name)
                }
                
                Section(header:Text("Category")) {
                    
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(Category.allCases) { category in
                            
                            Text(category.rawValue).tag(category)
                            
                        }
                    }
                    .pickerStyle(.menu)
                    
                }
                Section(header:Text("Description")) {
                    
                    TextField("Description", text: $description)
                }
                
                Section(header:Text("Ingredients")) {
                    
                    TextField("Ingredients", text: $ingredients)
                }
                
                Section(header:Text("Directions")) {
                    
                    TextField("Directions", text: $directions)
                }
                
                
            }
            
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    }
                label: {
                    Label("Cancel", systemImage: "xmark"
                    ).labelStyle(.iconOnly)
                }
                    
                    
                }
                
                ToolbarItem {
                    NavigationLink(isActive:$navigateToRecipe) {
                        RecipeDetail(recipe: recipesVM.recipes.sorted{$0.datePublished > $1.datePublished}[0])
                            .navigationBarBackButtonHidden(true)
                    }
                    
                    
                    label :  {
                        Button {
                            saveRecipe()
                            navigateToRecipe = true
                        }
                        
                        label : {
                            Label("Done",systemImage: "checkmark")
                                .labelStyle(.iconOnly)
                        }
                    }
                    .disabled(name.isEmpty)
                }
                
            })
            
            .navigationTitle("Add Recipe")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .navigationViewStyle(.stack)
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
            .environmentObject(RecipeViewModel())
    }
}

extension AddRecipeView {
    private func saveRecipe() {
        let nowDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        let datePublished = dateFormatter.string(from: nowDate)
        
        
        let recipe = Recipe(name: name, description: description, image: "", ingredients: ingredients, directions: directions, category: selectedCategory.rawValue, datePublished: datePublished , url: "")
        recipesVM.addRecipe(recipe: recipe)
    }
}

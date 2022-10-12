//
//  RecipeCard.swift
//  RecipeApp
//
//  Created by Talha Asif on 02/10/2022.
//

import SwiftUI

struct RecipeCard: View {
    
    var recipe:Recipe
    var body: some View {
        AsyncImage(url: URL(string: recipe.image)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay(alignment:.bottom) {
                    Text(recipe.name)
                        .font(.headline)
                        .frame(maxWidth:136)
                        .shadow(color: .black, radius: 3, x: 0, y: 0)
                        .foregroundColor(.white)
                        .padding()
                    
                }
            
            
        } placeholder: {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40, alignment: .center)
                .foregroundColor(.white.opacity(0.7))
                .frame(maxWidth:.infinity,maxHeight: .infinity)
        }
        // To display an image async
        .frame(width: 130, height: 200, alignment: .top)
//        .foregroundColor(.white.opacity(0.7))
        .background(.linearGradient(colors:[
            Color.gray.opacity(0.3),Color(.gray)
        ], startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
        .shadow(color: .black.opacity(0.3), radius: 15, x: 0, y: 10)
    }
}

struct RecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCard(recipe: Recipe.all[0])
    }
}

//
//  RecipeDetail.swift
//  RecipeApp
//
//  Created by Talha Asif on 02/10/2022.
//

import SwiftUI

struct RecipeDetail: View {
    
    var recipe:Recipe
    var body: some View {
        
        ScrollView{
        
        AsyncImage(url: URL(string: recipe.image)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
            
        } placeholder: {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40, alignment: .center)
                .foregroundColor(.white.opacity(0.7))
                .frame(maxWidth:.infinity,maxHeight: .infinity)
        }
        // To display an image async
        .frame(height:200)
        //        .foregroundColor(.white.opacity(0.7))
        .background(.linearGradient(colors:[
            Color.gray.opacity(0.3),Color(.gray)
        ], startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
            
            VStack(spacing:20){
//                Text("Ingredients")
//                    .font(.headline)
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                Text(recipe.description)
                
                if !(recipe.ingredients.isEmpty) {
                VStack(spacing:20){
                    Text("Ingredients")
                        .font(.headline)
                    Text(recipe.ingredients)
                }
                }
                if !(recipe.directions.isEmpty) {

                VStack(spacing:20){
                    Text("Directions")
                        .font(.headline)
                    Text(recipe.directions)
                }

            }
            }
            .frame(maxWidth: .infinity,alignment: .leading)

            .padding(.horizontal,25)
//            .padding(.horizontal,40)
            
        }
        
        

        
//        .padding(.horizontal)

        
    }

}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetail(recipe: Recipe.all[0])
    }
}

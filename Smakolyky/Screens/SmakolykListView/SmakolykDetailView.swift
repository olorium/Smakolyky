//
//  SmakolykDetailView.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 04.09.2022.
//

import SwiftUI

struct SmakolykDetailView: View {
    
    let smakolyk: Smakolyk
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            SmakolykRemoteImage(url: smakolyk.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            VStack {
                Text(smakolyk.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(smakolyk.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories", value: smakolyk.calories)
                    NutritionInfo(title: "Carbs", value: smakolyk.carbs)
                    NutritionInfo(title: "Protein", value: smakolyk.protein)
                }
            }
            Spacer()
            Button {
                print("tapped")
            } label: {
                SMButton(title: "$\(smakolyk.price, specifier: "%.2f") - Add to Order")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(
            Button {
                isShowingDetail = false
            } label: {
                SMDismissButton()
            } ,alignment: .topTrailing)
    }
}

struct SmakolykDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SmakolykDetailView(smakolyk: MockData.sampleSmakolyk, isShowingDetail: .constant(true))
    }
}

// MARK: - Nutrition Info View
struct NutritionInfo: View {
    
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

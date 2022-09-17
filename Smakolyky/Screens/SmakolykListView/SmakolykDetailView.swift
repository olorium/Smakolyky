//
//  SmakolykDetailView.swift
//  Smakolyky
//
//  Created by Alex Vasyliev on 04.09.2022.
//

import SwiftUI

/// Detail view with big image and description for an item
struct SmakolykDetailView: View {
    
    let smakolyk: Smakolyk
    @Binding var isShowingDetail: Bool
    @EnvironmentObject var order: Order
    
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
                    NutritionInfo(title: "Calories", value: "\(smakolyk.calories)")
                    NutritionInfo(title: "Carbs", value: "\(smakolyk.carbs) g")
                    NutritionInfo(title: "Protein", value: "\(smakolyk.protein) g")
                }
            }
            Spacer()
            if #available(iOS 15.0, *) {
                Button {
                    order.items.append(smakolyk)
                    isShowingDetail = false
                } label: {
                    Text("$\(smakolyk.price, specifier: "%.2f") - Add to Order")
                }
                .modifier(StandarDButtonStyle())
                .padding(.bottom, 30)
                    
            } else {
                Button {
                    order.items.append(smakolyk)
                    isShowingDetail = false
                } label: {
                    SMButton(title: "$\(smakolyk.price, specifier: "%.2f") - Add to Order")
                }
                .padding(.bottom, 30)
            }

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
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
            Text(value)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

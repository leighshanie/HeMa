//
//  ItemDetail.swift
//  HeMa
//
//  Created by Shane Leigh on 02/07/2020.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    var item: MenuItem
    
    var body: some View {
            VStack {
                
                ZStack(alignment: .bottomTrailing) {
                    Image(item.mainImage)
                        .cornerRadius(10)
                    Text("Photo: \(item.photoCredit)")
                        .padding(4)
                        .background(Color.black)
                        .font(.caption)
                        .foregroundColor(.white)
                        .offset(x: -5, y: -5)

                }
                
                
                Text(item.description)
                    .padding()
                
                Button("Order it!") {
                    self.order.add(item: self.item)
                }
                .font(.headline)
                
                Spacer()
            }

            .navigationBarTitle(item.name, displayMode: .inline)
        
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(item: MenuItem.example)
    }
}

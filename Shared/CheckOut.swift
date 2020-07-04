//
//  CheckOut.swift
//  HeMa
//
//  Created by Shane Leigh on 02/07/2020.
//

import SwiftUI

struct CheckOut: View {
    @EnvironmentObject var order: Order
    
    static let paymentTypes = ["Cash", "Credit Card", "HeMa points"]
    @State private var paymentType = 0
    @State private var cardNo = ""
    @State private var cardHolder = ""
    @State private var pin = ""
    
    @State private var HeMaCardNo = ""
    
    @State private var name = ""
    @State private var phoneNumber = ""
    @State private var address = ""
    @State private var postcode = ""
    
    @State var showingConfirmation = false
    
    var body: some View {
        
        Form {
            Section {
                Picker("How do you like to pay?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                if paymentType == 1 {
                    Section {
                        TextField("Credit Card Number", text: $cardNo)
                        TextField("Card Holder Name", text: $cardHolder)
                        TextField("PIN", text: $pin)
                    }
                } else if paymentType == 2 {
                    Section {
                        TextField("HeMa Card Number", text: $HeMaCardNo)
                    }
                }
                
                
            }
            
            Section {
                TextField("Name", text: $name)
                TextField("Phone Number", text: $phoneNumber)
                TextField("Address", text: $address)
                TextField("Post Code", text: $postcode)
            }
            
            Section(header:
                Text("TOTAL: $\(order.total)")
                        .font(.largeTitle)
            ) {
                Button (action: {
                    showingConfirmation = true
                }) {
                    Text("Place order")
                }
            }
            
            .alert(isPresented: $showingConfirmation) {
                Alert(title: Text("Thank you!"), message: Text("You successfully paid $\(order.total)"), dismissButton: .default(Text("OK")))
                        }
        } 
        
    }
    
//    func placeOrder() {
//        guard  let encoded = try? JSONEncoder().encode(order) else {
//            print("Failed to encode order")
//            return
//        }
//
//        let url = URL(string: "https://reqres.in/api/coffee")!
//        var request = URLRequest(url: url)
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "POST"
//        request.httpBody = encoded
//
//        URLSession.shared.dataTask(with: request) {
//            guard let data = $0 else {
//                print("No data in response: \($2?.localizedDescription ?? "Unknown error").")
//                return
//            }
//
//            if let decodedOrder = try?
//                JSONDecoder().decode(Order.self, from: data) {
//                self.confirmationMessage = "Your Order for \(decodedOrder.quantity) x \(Order.types[decodedOrder.type].lowercased()) coffee is on its way"
//
//                self.showingConfirmation = true
//            } else {
//                let dataString = String(decoding: data, as: UTF8.self)
//                print("Invalid response: \(dataString)")
//            }
//        }.resume()
//    }
}

struct CheckOut_Previews: PreviewProvider {
    static var previews: some View {
        CheckOut()
    }
}

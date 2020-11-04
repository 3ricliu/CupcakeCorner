//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Eric Liu on 11/1/20.
//

import SwiftUI

struct AddressView: View {
  @ObservedObject var order: Order
  
  var body: some View {
    Form {
      Section {
        TextField("Name", text: $order.details.name)
        TextField("Street Address", text: $order.details.streetAddress)
        TextField("City", text: $order.details.city)
        TextField("Zip", text: $order.details.zip)
      }
      
      Section {
        NavigationLink(destination: CheckoutView(order: order)) {
          Text("Check out")
        }
      }
      .disabled(order.hasValidAddress == false)
    }
    
    .navigationBarTitle("Delivery Details", displayMode: .inline)
  }
}

struct AddressView_Previews: PreviewProvider {
  static var previews: some View {
    AddressView(order: Order())
  }
}

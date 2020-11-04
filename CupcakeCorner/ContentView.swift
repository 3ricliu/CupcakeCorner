//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Eric Liu on 10/31/20.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var order = Order()
  
  var body: some View {
    NavigationView {
      Form {
        Section {
          Picker("Select your cake type", selection: $order.details.type) {
            ForEach(0..<Order.types.count) {
              Text(Order.types[$0])
            }
          }
        }
        
        Stepper(value: $order.details.quantity, in: 3...20) {
          Text("Number of cakes: \(order.details.quantity)")
        }
        
        Section {
          Toggle(isOn: $order.specialRequestEnabled.animation()) {
            Text("Any special requests?")
          }
          
          if order.specialRequestEnabled {
            Toggle(isOn: $order.details.extraFrosting) {
              Text("Add Extra Frosting")
            }
            Toggle(isOn: $order.details.addSprinkles) {
              Text("Add Sprinkles")
            }
          }
        }
        
        Section {
          NavigationLink(destination: AddressView(order: order)) {
            Text("Delivery details")
          }
        }
      }
      .navigationBarTitle("Cupcake Corner")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

//
//  Order.swift
//  CupcakeCorner
//
//  Created by Eric Liu on 11/1/20.
//

import Foundation

struct OrderDetails: Codable {
  var type = 0
  var quantity = 3
  var extraFrosting = false
  var addSprinkles = false
  var name = ""
  var streetAddress = ""
  var city = ""
  var zip = ""

}

class Order: ObservableObject {
  static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
  @Published var details = OrderDetails()
  
//  enum CodingKeys: CodingKey {
//    case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
//  }
//
//  @Published var type = 0
//  @Published var quantity = 3
//
  @Published var specialRequestEnabled = false {
    didSet {
      if specialRequestEnabled == false {
        details.extraFrosting = false
        details.addSprinkles = false
      }
    }
  }
//  @Published var extraFrosting = false
//  @Published var addSprinkles = false
//
//  @Published var name = ""
//  @Published var streetAddress = ""
//  @Published var city = ""
//  @Published var zip = ""
  
  var hasValidAddress: Bool {
    if details.name.isEmpty || details.streetAddress.trimmingCharacters(in: .whitespaces).isEmpty || details.city.isEmpty || details.zip.isEmpty {
      return false
    }
    return true
  }
  
  var cost: Double {
    var cost = Double(details.quantity) * 2
    cost += Double(details.type) / 2
    
    if details.extraFrosting {
      cost += Double(details.quantity)
    }
    
    if details.addSprinkles {
      cost += Double(details.quantity) / 2
    }
    
    return cost
  }
  
//  init() { }
//
//  required init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//
//    type = try container.decode(Int.self, forKey: .type)
//
//    extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
//    addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
//
//    name = try container.decode(String.self, forKey: .name)
//    streetAddress = try container.decode(String.self, forKey: .streetAddress)
//    city = try container.decode(String.self, forKey: .city)
//    zip = try container.decode(String.self, forKey: .zip)
//
//  }
//
//  func encode(to encoder: Encoder) throws {
//    var container = encoder.container(keyedBy: CodingKeys.self)
//
//    try container.encode(type, forKey: .type)
//    try container.encode(quantity, forKey: .quantity)
//
//    try container.encode(extraFrosting, forKey: .extraFrosting)
//    try container.encode(addSprinkles, forKey: .addSprinkles)
//
//    try container.encode(name, forKey: .name)
//    try container.encode(streetAddress, forKey: .streetAddress)
//    try container.encode(city, forKey: .city)
//    try container.encode(zip, forKey: .zip)
//  }
}

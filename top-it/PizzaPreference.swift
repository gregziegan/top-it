//
//  PizzaPreference.swift
//  top-it
//
//  Created by Gregory Ziegan on 11/11/14.
//  Copyright (c) 2014 Greg Ziegan. All rights reserved.
//

import Foundation

class PizzaPreference {
    var lovedToppings : [Topping]
    var hatedToppings : [Topping]
    var mehToppings : [Topping]
    
    init(lovedToppings: [Topping], hatedToppings: [Topping], mehToppings: [Topping]) {
        self.lovedToppings = lovedToppings
        self.hatedToppings = hatedToppings
        self.mehToppings = mehToppings
    }
    
}
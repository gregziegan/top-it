//
//  Restaurant.swift
//  top-it
//
//  Created by Gregory Ziegan on 11/11/14.
//  Copyright (c) 2014 Greg Ziegan. All rights reserved.
//

import Foundation
import Realm

class Restaurant: RLMObject {
    dynamic var name : String = ""
    dynamic var availableToppings: [Topping] = []
}
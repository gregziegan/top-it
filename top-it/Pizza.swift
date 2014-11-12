//
//  Pizza.swift
//  Top it!
//
//  Created by Gregory Ziegan on 11/11/14.
//  Copyright (c) 2014 Greg Ziegan. All rights reserved.
//

import Realm

class Pizza: RLMObject {
    dynamic var toppings : [Topping] = []
}

//
//  PizzaSelector.swift
//  top-it
//
//  Created by Gregory Ziegan on 11/11/14.
//  Copyright (c) 2014 Greg Ziegan. All rights reserved.
//

import Foundation

class PizzaSelector {
    
    class func getIdealPizzas(pizzaPreferences: [PizzaPreference], numberOfPizzas: Int, includeMehToppings: Bool) -> [Pizza] {
        var idealPizzas : [Pizza] = []
        var groupedUsers = getGroupedUsersByPreference(pizzaPreferences, numberOfGroups: numberOfPizzas)
        
        for similarUsers in groupedUsers {
            var idealPizza = getIdealPizza(similarUsers, includeMehToppings: includeMehToppings)
            idealPizzas.append(idealPizza)
        }
        
        return idealPizzas
    }
    
    private class func getGroupedUsersByPreference(usersPreferences: [PizzaPreference], numberOfGroups: Int) -> [[PizzaPreference]] {
        var groupedUsers : [[PizzaPreference]] = []
        var usersWithoutAGroup : [PizzaPreference] = usersPreferences  // copied on assignment?
        
        for i in 0...numberOfGroups {
            var newGroup : [PizzaPreference] = []
            var groupIndices = getGroupCompatibleIndices(usersWithoutAGroup)
            
            for index in groupIndices {
                newGroup.append(usersPreferences[index])
                usersWithoutAGroup.removeAtIndex(index)
            }
            groupedUsers.append(newGroup)
        }
        
        return groupedUsers
    }
    
    private class func getGroupCompatibleIndices(usersPreferences: [PizzaPreference]) -> [Int] {
        var compatibleIndices : [Int] = []
        var testCandidate : PizzaPreference = usersPreferences[0]
        for i in 1...usersPreferences.count {
            var isCompatibleCandidate = true
            for topping in testCandidate.lovedToppings {
                if contains(usersPreferences[i].hatedToppings, topping) {
                    isCompatibleCandidate = false
                    break
                }
            }
            if isCompatibleCandidate {
                compatibleIndices.append(i)
            }
        }
        return compatibleIndices
    }
    
    class func getIdealPizza(allUsersPizzaPreferences: [PizzaPreference], includeMehToppings: Bool) -> Pizza {
        var idealPizza = Pizza()
        for pizzaPreference in allUsersPizzaPreferences {
            var candidateToppings = pizzaPreference.lovedToppings
            if includeMehToppings {
                candidateToppings.extend(pizzaPreference.mehToppings)
            }
            
            for topping in candidateToppings {
                if isToppingIdeal(topping: topping, usersPreferences: allUsersPizzaPreferences) {
                    idealPizza.toppings.append(topping)
                }
            }
        }
        return idealPizza
    }
    
    private class func isToppingIdeal(topping candidateTopping: Topping, usersPreferences: [PizzaPreference]) -> Bool {
        var isIdeal = true
        for pizzaPreference in usersPreferences {
            if contains(pizzaPreference.hatedToppings, candidateTopping) {
                isIdeal = false
                break
            }
        }
        
        return isIdeal
    }
    
}
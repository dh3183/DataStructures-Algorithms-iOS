import Foundation

// MARK: Array
var people = ["Brian", "Stanley", "Ringo"]

people[0] // "Brian"
people[1] // "Stanley"
people[2] // "Ringo"

people.append("Charles")
print(people) // prints ["Brian", "Stanley", "Ringo", "Charles"]

people.insert("Andy", at: 0)
// ["Andy", "Brian", "Stanley", "Ringo", "Charles"]


// MARK: Dictionary
var scores: [String: Int] = ["Eric": 9, "Mark": 12, "Wayne": 1]

scores["Andrew"] = 0

["Eric": 9, "Mark": 12, "Andrew": 0, "Wayne": 1]


// MARK: Set
var bag: Set<String> = ["Candy", "Juice", "Gummy"]
bag.insert("Candy")
print(bag) // prints ["Candy", "Juice", "Gummy"]

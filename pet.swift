//
//  pet.swift
//  Lab2
//
//  Created by Shangwe Nyota on 9/21/24.
//


class Pet {
    
    //Data
    private (set) var happinessLevel:Double
    private (set) var foodLevel:Double
    private (set) var numberOfTimesFed:Int
    private (set) var numberOfTimesPlayed:Int
    var typeOfPet:PetOptions?
    
    enum PetOptions {
        case bird
        case bunny
        case cat
        case dog
        case fish
    }
    
    //When a user clicks the play with pet button this function is called and then the update screen
    func playWithPet() {
        if (self.foodLevel > 0) {
            self.happinessLevel += 1
            self.numberOfTimesPlayed += 1
            self.foodLevel -= 1
        }
    }
    //When a user clicks the feed pet button this function is called and then the update screen
    func feedPet() {
        if (self.foodLevel < 10) {
            print(self.foodLevel)
            self.foodLevel += 1
            self.numberOfTimesFed += 1
        }
    }
    
    
    
    //Init
    init(petType: PetOptions) {
        self.typeOfPet = petType //Set the pet type to the appropriate type
    
        //Set other instance variables to 0
        self.happinessLevel = 0
        self.foodLevel = 0
        self.numberOfTimesFed = 0
        self.numberOfTimesPlayed = 0
    }
    
}

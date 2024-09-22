//
//  ViewController.swift
//  Lab2
//
//  Created by Shangwe Nyota on 9/20/24.
//

import UIKit

class ViewController: UIViewController {
    
    var currentPet: Pet? //currentPet is nil by default... will unwrap it viewdidLoad
    var dogSelected = Pet(petType: .dog)
    var catSelected = Pet(petType: .cat)
    var birdSelected = Pet(petType: .bird)
    var bunnySelected = Pet(petType: .bunny)
    var fishSelected = Pet(petType: .fish)

    
    //Outlets for the Happiness and Food level text fields
    @IBOutlet weak var hapinessTextField: UITextField!
    @IBOutlet weak var foodLevelTextField: UITextField!
    
    //Outlets for Happiness and Food Level Text Field
    @IBOutlet weak var fedTextField: UITextField!
    @IBOutlet weak var playedTextField: UITextField!
    
    //Outlet for petImage
    @IBOutlet weak var petImageView: UIImageView!
    
    //Outlets for play buttons
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var feedButton: UIButton!
    
    //Outlets for the animal buttons
    @IBOutlet weak var dogButton: UIButton!
    @IBOutlet weak var catButton: UIButton!
    @IBOutlet weak var birdButton: UIButton!
    @IBOutlet weak var bunnyButton: UIButton!
    @IBOutlet weak var fishButton: UIButton!
    
    //Outlets for the scroll bars
    @IBOutlet weak var hapinessLevelBar: DisplayView!
    @IBOutlet weak var foodLevelBar: DisplayView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Some Additional Styling
        fedTextField.textAlignment = .right;
        fedTextField.borderStyle = .none;
        playedTextField.textAlignment = .right;
        playedTextField.borderStyle = .none;
        hapinessTextField.borderStyle = .none;
        foodLevelTextField.borderStyle = .none;
        
        currentPet = dogSelected//Defaultpet object is initialized to dog
        
        updateDisplay()
        
    }
    
    
    func updateDisplay() {
        //Updated the number of times played and fed
        playedTextField.text = "Played: \((currentPet?.numberOfTimesPlayed)!)"
        fedTextField.text = "Fed: \((currentPet?.numberOfTimesFed)!)"
        
        //Update the background Image
        //Unwrap the currentPet object and switch through each case
        if let selectedPet = currentPet {
            switch selectedPet.typeOfPet {
            case .dog:
                petImageView.image = UIImage(named: "dog")
            case .bird:
                petImageView.image = UIImage(named: "bird")
            case .bunny:
                petImageView.image = UIImage(named: "bunny")
            case .cat:
                petImageView.image = UIImage(named: "cat")
            case .fish:
                petImageView.image = UIImage(named: "fish")
            case .none:
                print("No Button Selected")
            }
        }


        
        //Update the respective bars: divide by 10 to set the max of the respective bars to 10
        let happinessLevelValue = Double((currentPet?.happinessLevel)!)/10
        hapinessLevelBar.animateValue(to: CGFloat(happinessLevelValue))
        let foodLevelValue = Double((currentPet?.foodLevel)!)/10
        foodLevelBar.animateValue(to: CGFloat(foodLevelValue))
    }

    
    //Actions for play and Feed Buttons
    @IBAction func playButtonAction(_ sender: Any) {
        print("Play Button Pressed")
        currentPet?.playWithPet()
        updateDisplay()
    }
    
    @IBAction func feedButtonAction(_ sender: Any) {
        print("Action Button Pressed")
        currentPet?.feedPet()
        updateDisplay()

    }
    
    //Actions for Animal Buttons
    @IBAction func dogButtonPressed(_ sender: Any) {
        print("Dog Button Pressed")
        currentPet = dogSelected
        updateDisplay()
    }
    @IBAction func catButtonPressed(_ sender: Any) {
        print("Cat Button Pressed")
        currentPet = catSelected
        updateDisplay()
    }
    @IBAction func birdButtonPressed(_ sender: Any) {
        print("Bird Button Pressed")
        currentPet = birdSelected
        updateDisplay()
    }
    @IBAction func bunnyButtonPressed(_ sender: Any) {
        print("BunnyButton Pressed")
        currentPet = bunnySelected
        updateDisplay()
    }
    @IBAction func fishButtonPressed(_ sender: Any) {
        print("Fish Button pressed")
        currentPet = fishSelected
        updateDisplay()
    }
    
    

}


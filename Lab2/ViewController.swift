//
//  ViewController.swift
//  Lab2
//
//  Created by Shangwe Nyota on 9/20/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var currentPet: Pet? // currentPet is nil by default... will unwrap it in viewDidLoad
    var dogSelected = Pet(petType: .dog)
    var catSelected = Pet(petType: .cat)
    var birdSelected = Pet(petType: .bird)
    var bunnySelected = Pet(petType: .bunny)
    var fishSelected = Pet(petType: .fish)
    
    // Adding Animal Audio as Creative Portion https://developer.apple.com/documentation/avfoundation/
    var audioPlayer: AVAudioPlayer?

    @IBOutlet weak var mainBackgroundColor: UIView!
    
    // Outlets for the Happiness and Food level text fields
    @IBOutlet weak var hapinessTextField: UITextField!
    @IBOutlet weak var foodLevelTextField: UITextField!
    
    // Outlets for Happiness and Food Level Text Field
    @IBOutlet weak var fedTextField: UITextField!
    @IBOutlet weak var playedTextField: UITextField!
    
    // Outlet for petImage
    @IBOutlet weak var petImageView: UIImageView!
    
    // Outlets for play buttons
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var feedButton: UIButton!
    
    // Outlets for the animal buttons
    @IBOutlet weak var dogButton: UIButton!
    @IBOutlet weak var catButton: UIButton!
    @IBOutlet weak var birdButton: UIButton!
    @IBOutlet weak var bunnyButton: UIButton!
    @IBOutlet weak var fishButton: UIButton!
    
    // Outlets for the scroll bars
    @IBOutlet weak var hapinessLevelBar: DisplayView!
    @IBOutlet weak var foodLevelBar: DisplayView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup audio session
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to set up audio session: \(error)")
        }
        
        // Additional Styling
        fedTextField.textAlignment = .right
        fedTextField.borderStyle = .none
        playedTextField.textAlignment = .right
        playedTextField.borderStyle = .none
        hapinessTextField.borderStyle = .none
        foodLevelTextField.borderStyle = .none
        
        currentPet = dogSelected // Default pet object is initialized to dog
        playSound(fileName: "DogBark", fileExtension: "mp3") // Play the dog sound on initial load
        updateDisplay()
    }
    
    func updateDisplay() {
        // Update the number of times played and fed
        playedTextField.text = "Played: \((currentPet?.numberOfTimesPlayed)!)"
        fedTextField.text = "Fed: \((currentPet?.numberOfTimesFed)!)"
        
        // Update the background Image and colors based on the selected pet
        if let selectedPet = currentPet {
            switch selectedPet.typeOfPet {
            case .dog:
                petImageView.image = UIImage(named: "dog") ?? petImageView.image
                hapinessLevelBar.color = UIColor(named: "dogTheme") ?? hapinessLevelBar.color
                foodLevelBar.color = UIColor(named: "dogTheme") ?? foodLevelBar.color
                mainBackgroundColor.backgroundColor = UIColor(named: "dogTheme") ?? mainBackgroundColor.backgroundColor
            case .bird:
                petImageView.image = UIImage(named: "bird") ?? petImageView.image
                hapinessLevelBar.color = UIColor(named: "birdTheme") ?? hapinessLevelBar.color
                foodLevelBar.color = UIColor(named: "birdTheme") ?? foodLevelBar.color
                mainBackgroundColor.backgroundColor = UIColor(named: "birdTheme") ?? mainBackgroundColor.backgroundColor
            case .bunny:
                petImageView.image = UIImage(named: "bunny") ?? petImageView.image
                hapinessLevelBar.color = UIColor(named: "bunnyTheme") ?? hapinessLevelBar.color
                foodLevelBar.color = UIColor(named: "bunnyTheme") ?? foodLevelBar.color
                mainBackgroundColor.backgroundColor = UIColor(named: "bunnyTheme") ?? mainBackgroundColor.backgroundColor
            case .cat:
                petImageView.image = UIImage(named: "cat") ?? petImageView.image
                hapinessLevelBar.color = UIColor(named: "catTheme") ?? hapinessLevelBar.color
                foodLevelBar.color = UIColor(named: "catTheme") ?? foodLevelBar.color
                mainBackgroundColor.backgroundColor = UIColor(named: "catTheme") ?? mainBackgroundColor.backgroundColor
            case .fish:
                petImageView.image = UIImage(named: "fish") ?? petImageView.image
                hapinessLevelBar.color = UIColor(named: "fishTheme") ?? hapinessLevelBar.color
                foodLevelBar.color = UIColor(named: "fishTheme") ?? foodLevelBar.color
                mainBackgroundColor.backgroundColor = UIColor(named: "fishTheme") ?? mainBackgroundColor.backgroundColor
            case .none:
                print("No Button Selected")
            }
        }
        
        // Update the respective bars: divide by 10 to set the max of the respective bars to 10
        if let happinessLevel = currentPet?.happinessLevel {
            let happinessLevelValue = Double(happinessLevel) / 10
            hapinessLevelBar.animateValue(to: CGFloat(happinessLevelValue))
            
            if happinessLevelValue >= 1.0 {
                startImageRotation()
            } else {
                stopImageRotation()
            }
        }
        
        if let foodLevel = currentPet?.foodLevel {
            let foodLevelValue = Double(foodLevel) / 10
            foodLevelBar.animateValue(to: CGFloat(foodLevelValue))
        }
    }
    
    func playSound(fileName: String, fileExtension: String) {
        // Stop and release the current audio player if it exists
        if audioPlayer?.isPlaying == true {
            print("Stopping current audio player.")
            audioPlayer?.stop()
        }
        audioPlayer = nil // Set it to nil to release the previous player
        
        // Initialize and play the new audio file
        if let soundURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                print("Initializing new audio player.")
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
                print("Sound playing successfully.")
            } catch {
                print("Error: Could not initialize AVAudioPlayer with file \(fileName). Error: \(error)")
            }
        } else {
            print("Error: File \(fileName).\(fileExtension) not found.")
        }
    }
    
    // Actions for play and feed buttons
    @IBAction func playButtonAction(_ sender: Any) {
        print("Play Button Pressed")
        currentPet?.playWithPet()
        updateDisplay()
    }
    
    @IBAction func feedButtonAction(_ sender: Any) {
        print("Feed Button Pressed")
        currentPet?.feedPet()
        updateDisplay()
    }
    
    // Actions for Animal Buttons
    @IBAction func dogButtonPressed(_ sender: Any) {
        print("Dog Button Pressed")
        currentPet = dogSelected
        playSound(fileName: "DogBark", fileExtension: "mp3")
        updateDisplay()
    }
    
    @IBAction func catButtonPressed(_ sender: Any) {
        print("Cat Button Pressed")
        currentPet = catSelected
        playSound(fileName: "CatMeow", fileExtension: "wav")
        updateDisplay()
    }
    
    @IBAction func birdButtonPressed(_ sender: Any) {
        print("Bird Button Pressed")
        currentPet = birdSelected
        playSound(fileName: "BirdChirping", fileExtension: "mp3")
        updateDisplay()
    }
    
    @IBAction func bunnyButtonPressed(_ sender: Any) {
        print("Bunny Button Pressed")
        currentPet = bunnySelected
        playSound(fileName: "RabbitNoise", fileExtension: "mp3")
        updateDisplay()
    }
    
    @IBAction func fishButtonPressed(_ sender: Any) {
        print("Fish Button Pressed")
        currentPet = fishSelected
        playSound(fileName: "FishWater", fileExtension: "wav")
        updateDisplay()
    }
    
    // Function to start the rotation animation
    func startImageRotation(duration: CFTimeInterval = 1.0) {
        // Check if the animation is not already added
        if petImageView.layer.animation(forKey: "rotationAnimation") == nil {
            // Rotation Animation Documentation https://stackoverflow.com/questions/31478630/animate-rotation-uiimageview-in-swift
            let rotation = CABasicAnimation(keyPath: "transform.rotation")
            rotation.fromValue = 0.0
            rotation.toValue = CGFloat.pi * 2
            rotation.duration = duration
            rotation.repeatCount = .infinity
            petImageView.layer.add(rotation, forKey: "rotationAnimation")
        }
    }
    
    // Function to stop the rotation animation
    func stopImageRotation() {
        petImageView.layer.removeAnimation(forKey: "rotationAnimation")
    }
}


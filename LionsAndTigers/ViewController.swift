//
//  ViewController.swift
//  LionsAndTiger
//
//  Created by Joao Rosa on 01/03/15.
//  Copyright (c) 2015 Sonia Rosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    // MARK: - Properties
    var myTiger = Tiger()
    var myTigers: [Tiger] = []
    var currentIndex = 0
    
    var lions: [Lion] = []
    
    var lionCubs: [LionCub] = []
    
    var currentAnimal = (species: "Tiger", index: 0)
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myTiger = Tiger()
        myTiger.name = "Joao"
        myTiger.age = 5
        myTiger.breed = "Bengal Tiger"
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        
        myTiger.chuff()
        
        myTiger.chuffANumberOfTimes(5, isLoud: false)

        
        myTigers.append(myTiger)
        
        println("My Tiger's name is: \(myTiger.name), its's age is \(myTiger.age), its's image is \(myTiger.image)")
        
        myImageView.image = myTiger.image
        nameLabel.text = myTiger.name
        ageLabel.text = String(myTiger.age)
        breedLabel.text = myTiger.breed
        randomFactLabel.text = myTiger.randomFact()
        
        var secondTiger = Tiger()
        secondTiger.name = "Ivan"
        secondTiger.age = 4
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        secondTiger.chuff()
        
        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Sonia"
        thirdTiger.age = 5
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        thirdTiger.chuff()
        
        thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(thirdTiger.age)
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Nelson"
        fourthTiger.age = 3
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        fourthTiger.chuff()
        
        fourthTiger.age = fourthTiger.ageInTigerYearsFromAge(fourthTiger.age)
        
        myTigers += [secondTiger, thirdTiger, fourthTiger]
        
        myTiger.chuffANumberOfTimes(3)
        secondTiger.chuffANumberOfTimes(2)
        
        var lion = Lion()
        lion.name = "Jose"
        lion.age = 5
        lion.subspecies = "West African"
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        
        var lioness = Lion()
        lioness.name = "Inka"
        lioness.age = 4
        lioness.isAlphaMale = false
        lioness.subspecies = "Barbary"
        lioness.image = UIImage(named: "Lioness.jpeg")
        
        
        lion.roar()
        lioness.roar()
        
        lion.changeToAlphaMale()
        println(lion.isAlphaMale)
        
        lions += [lion, lioness]
        
        var lionCub1 = LionCub()
        lionCub1.name = "Mario"
        lionCub1.age = 1
        lionCub1.image = UIImage(named: "LionCub1.jpg")
        lionCub1.subspecies = "Masay"
        lionCub1.isAlphaMale = true
        
        lionCub1.roar()
        lionCub1.rubLionCubsBelly()
        
        
        var lionCub2 = LionCub()
        lionCub2.name = "Isis"
        lionCub2.age = 1
        lionCub2.image = UIImage(named: "LionCub2.jpeg")
        lionCub2.subspecies = "Transvaal"
        lionCub2.isAlphaMale = false
        
        
        self.lionCubs += [lionCub1, lionCub2]


        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBAction
    @IBAction func NextBarButtonItem(sender: UIBarButtonItem) {
//        println(myTigers)
//        
//        var randomIndex: Int
//        
//        do {
//             randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
//        } while currentIndex == randomIndex
//        
//        currentIndex = randomIndex
//        
//       var tiger = myTigers[randomIndex]
//      
//        UIView.transitionWithView(self.view, duration: 1.0, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
//            
//            self.myImageView.image = tiger.image
//            self.nameLabel.text = tiger.name
//            self.ageLabel.text = toString(tiger.age)
//            self.breedLabel.text = tiger.breed
//            self.randomFactLabel.text = tiger.randomFact()
//        
//            }, completion: {(fisnish: Bool) -> () in
//        })

        
        updateAnimal()
        updateView()
        
    }
    
    // MARK: - Helper Function
    func updateAnimal () {
        
        switch currentAnimal {
        case ("Tiger", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Lion", randomIndex)
        case ("Lion", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lionCubs.count)))
            currentAnimal = ("LionCub", randomIndex)
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
        }
    }
    
    func updateView() {
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            if self.currentAnimal.species == "Tiger" {
                let tiger = self.myTigers[self.currentAnimal.index]
                self.myImageView.image = tiger.image
                self.nameLabel.text = tiger.name
                self.ageLabel.text = toString(tiger.age)
                self.breedLabel.text = tiger.breed
                self.randomFactLabel.text = tiger.randomFact()
            }
            else if self.currentAnimal.species == "Lion" {
                let lion = self.lions[self.currentAnimal.index]
                self.myImageView.image = lion.image
                self.nameLabel.text = lion.name
                self.ageLabel.text = toString(lion.age)
                self.breedLabel.text = lion.subspecies
                self.randomFactLabel.text = lion.randomFact()
            }
            else if self.currentAnimal.species == "LionCub" {
                let lionCub = self.lionCubs[self.currentAnimal.index]
                self.myImageView.image = lionCub.image
                self.nameLabel.text = lionCub.name
                self.ageLabel.text = toString(lionCub.age)
                self.breedLabel.text = lionCub.subspecies
                self.randomFactLabel.text = lionCub.randomFact()
            }
        
            }, completion: {(finish: Bool) -> () in
      })
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}


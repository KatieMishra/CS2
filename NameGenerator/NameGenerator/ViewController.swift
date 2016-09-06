//
//  ViewController.swift
//  NameGenerator
//
//  Created by Katie Mishra on 9/1/16.
//  Copyright © 2016 Katie Mishra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var realName: UITextField!
    @IBOutlet weak var ninjaName: UILabel!
    var nameList = ["Katie", "Sho Sho", "Amanda", "Ann"]
    var markovChain = [Character:Array<Character>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initializeTransitionTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func generateNinjaName(sender: UIButton) {
        let realNameText = self.realName.text
        //do I need the self here?
        self.nameList.append(realNameText!)
        addToTransitionTable(realNameText!)
        //Generate a random name starting from the first character of the real name
        self.ninjaName.text = createMarkovChain(realNameText![realNameText!.startIndex], length: NSString(string: realNameText!).length)
    }
    
    //Loop over all names in initial list and break them down to put in markov dictionary
    private func initializeTransitionTable() {
        for name in self.nameList {
            addToTransitionTable(name)
        }
    }
    
    //Add name to dicionary by linking each character to its proceeding character
    private func addToTransitionTable(name: String) {
        for char in name.characters {
            var charIndex = name.characters.indexOf(char)
            if markovChain[char] != nil && name[charIndex!] != name[name.endIndex] {
                markovChain[char]?.append(name.startIndex.advancedBy(1))
            } else {
                markovChain[char] = name[nextIndex]
            }
        }
    }
    
    //Create a new name based on a given starting letter and the existing markov connections in the previously created table
    private func createMarkovChain(key: Character, length: Int) -> String {
        var ninjaName = ""
        //Key is initially the first letter in the real name
        ninjaName.append(key)
        var i = length
        while i != 0 {
            ninjaName.append(generateNextChar(key))
            i -= 1
        }
        return ninjaName
    }
    
    //Choose a random character from the values associated with a given key
    private func generateNextChar(key: Character) -> Character {
        var array = markovChain[key]
        return array![Int(arc4random_uniform(UInt32(array!.count)))]
    }

}


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
    var nameList = ["Katie"]
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
        nameList.append(realNameText!)
        addToMarkovChain(realNameText!)
        self.ninjaName.text = createName()
    }
    
    func initializeTransitionTable() {
        for name in self.nameList {
            addToMarkovChain(name)
        }
    }
    
    func addToMarkovChain(name: String) {
        
        
    }
    
    func createName() -> String {
        return "Placeholder"
    }

}


//
//  ViewController.swift
//  TicTacToe
//
//  Created by Jason Liu on 12/2/16.
//  Copyright © 2016 Jason Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var gridLabel0: GridLabel!
    @IBOutlet weak var gridLabel1: GridLabel!
    @IBOutlet weak var gridLabel2: GridLabel!
    @IBOutlet weak var gridLabel3: GridLabel!
    @IBOutlet weak var gridLabel4: GridLabel!
    @IBOutlet weak var gridLabel5: GridLabel!
    @IBOutlet weak var gridLabel6: GridLabel!
    @IBOutlet weak var gridLabel7: GridLabel!
    @IBOutlet weak var gridLabel8: GridLabel!
    @IBOutlet weak var labelOutcome: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var labelArray = [GridLabel]()
    var xTurn = true
    var gameover = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelArray.append(gridLabel0)
        labelArray.append(gridLabel1)
        labelArray.append(gridLabel2)
        labelArray.append(gridLabel3)
        labelArray.append(gridLabel4)
        labelArray.append(gridLabel5)
        labelArray.append(gridLabel6)
        labelArray.append(gridLabel7)
        labelArray.append(gridLabel8)
    }
    
    func checkForWinner() {
        if  labelArray[0].text != "" &&
            labelArray[0].text == labelArray[1].text &&
            labelArray[1].text == labelArray[2].text {
            displayWinningMessage("\(labelArray[0].text!) is the winner!")
        }
        else if  labelArray[3].text != "" &&
            labelArray[3].text == labelArray[4].text &&
            labelArray[4].text == labelArray[5].text {
            displayWinningMessage("\(labelArray[3].text!) is the winner!")
        }
        else if  labelArray[6].text != "" &&
            labelArray[6].text == labelArray[7].text &&
            labelArray[7].text == labelArray[8].text {
            displayWinningMessage("\(labelArray[6].text!) is the winner!")
        }
        else if  labelArray[0].text != "" &&
            labelArray[0].text == labelArray[1].text &&
            labelArray[1].text == labelArray[2].text {
            displayWinningMessage("\(labelArray[0].text!) is the winner!")
        }
        else if  labelArray[0].text != "" &&
            labelArray[0].text == labelArray[3].text &&
            labelArray[3].text == labelArray[6].text {
            displayWinningMessage("\(labelArray[0].text!) is the winner!")
        }
        else if  labelArray[1].text != "" &&
            labelArray[1].text == labelArray[4].text &&
            labelArray[4].text == labelArray[7].text {
            displayWinningMessage("\(labelArray[1].text!) is the winner!")
        }
        else if  labelArray[2].text != "" &&
            labelArray[2].text == labelArray[5].text &&
            labelArray[5].text == labelArray[8].text {
            displayWinningMessage("\(labelArray[2].text!) is the winner!")
        }
        else if  labelArray[0].text != "" &&
            labelArray[0].text == labelArray[4].text &&
            labelArray[4].text == labelArray[8].text {
            displayWinningMessage("\(labelArray[0].text!) is the winner!")
        }
        else if  labelArray[2].text != "" &&
            labelArray[2].text == labelArray[4].text &&
            labelArray[4].text == labelArray[6].text {
            displayWinningMessage("\(labelArray[2].text!) is the winner!")
        }
    }
    
    func checkLineForWinner(_ a: Int, b: Int, c: Int) -> Bool{
        if labelArray[a].text != "" &&
            labelArray[a].text == labelArray[b].text &&
            labelArray[b].text == labelArray[c].text {
            return true
        }
        return false
    }
    
    func displayWinningMessage(_ message:String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Play Again", style: .default) {
            (action) -> Void in self.resetGame()
        }
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        print(message)
        gameover = true
    }
    
    func resetGame() {
        for label in labelArray {
            label.text = ""
            label.canTap = true
        }
        xTurn = true
        gameover = false
    }
    
    func winningLine (){
        if labelArray[0].text != "" &&
            labelArray[0].text == labelArray[1].text &&
            labelArray[1].text == labelArray[2].text {
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTappedGridLabel(_ sender: UITapGestureRecognizer) {
        welcomeLabel.text = ""
        print("Tapped somewhere")
        if gameover {
            return
        }
        var canPlay = false
        for label in labelArray {
            if label.frame.contains(sender.location(in: backgroundView)) {
                if label.canTap {
                    if(xTurn) {
                        label.text = "X"
                    }
                    else {
                        label.text = "O"
                    }
                    xTurn = !xTurn
                    label.canTap = false
                    checkForWinner()
                }
                
            }
            if label.canTap {
                canPlay = true
            }
        }
        if !canPlay && !gameover {
            displayWinningMessage("Cat's Game")
            
        }
    }
}

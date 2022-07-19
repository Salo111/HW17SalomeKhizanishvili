//
//  ViewController.swift
//  hw17
//
//  Created by salo khizanishvili on 18.07.22.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func redRoundTapGesture(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondPage")as! SecondPage
        self.navigationController?.pushViewController(vc, animated: true)
        vc.redRoundClicked = true
       
    }
    
    
    
    @IBAction func greenRoundTapGesture(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondPage")as! SecondPage
    
        self.navigationController?.pushViewController(vc, animated: true)
        
        vc.greenRoundClicked = true
    }
    
    
    
    @IBAction func purpleTriangleTapGesture(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondPage")as! SecondPage
    
        self.navigationController?.pushViewController(vc, animated: true)
        vc.purpleTriangleisClicked = true
        
        
    }
    
    
    
    @IBAction func blackTriangleTapGesture(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondPage")as! SecondPage
    
        self.navigationController?.pushViewController(vc, animated: true)
        
        vc.blackTriangleIsClicked = true
        NotificationCenter.default.post(name: Notification.Name("colorChanged"), object: nil)
        view.backgroundColor = .red
        
        
    }
    

    
    
    var myCalendar = Calendar.current
    var date1 = Date()
    override func viewDidLoad() {
        super.viewDidLoad()
        date1 = Date()
        
    }
    
}


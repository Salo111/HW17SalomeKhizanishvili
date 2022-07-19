//
//  SecondPage.swift
//  hw17
//
//  Created by salo khizanishvili on 19.07.22.
//

import UIKit

class SecondPage: UIViewController {
     
    @IBOutlet var superView: UIView!
    @IBOutlet weak var wesAndersonMovie: UIImageView!

    
    var myCalendar = Calendar.current
    var date1 = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        date1 = Date()
        ChangeColor()
    }
    
    func ChangeColor(){
        NotificationCenter.default.addObserver(self, selector: #selector(receiveNotification), name: Notification.Name("colorChanged"), object: nil)
    }
    
    @objc func receiveNotification(){
        view.backgroundColor = .red
    }
    
   
    
    var redRoundClicked = Bool()
    var greenRoundClicked = Bool()
    var purpleTriangleisClicked = Bool()
    var blackTriangleIsClicked = Bool()
    
    @IBAction func FrenchDispTapGesture(_ sender: Any) {
        //ამის პირობა კარგად ვერ გავიგე და მიწერია როცა მეორე გვერდზე გადასვლისას ვაკლიკებთ სურათზე, დროის შუალედი გადასვლასა და დაკლიკებას შორის არის 1 წამზე ნაკლები ან მეტი. იმედია სწორად მივხვდი
        if(redRoundClicked == true){
        let date2 = Date();
        print(date2.timeIntervalSinceNow - date1.timeIntervalSinceNow)
        if(date2.timeIntervalSinceNow - date1.timeIntervalSinceNow < 1){
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
        else if(greenRoundClicked == true){
            let date2 = Date();
            print(date2.timeIntervalSinceNow - date1.timeIntervalSinceNow)
            if(date2.timeIntervalSinceNow - date1.timeIntervalSinceNow > 1){
                wesAndersonMovie.isHidden = true
            }
        }

}
    
    
    @IBAction func frenchDispSwipeGesture(_ sender: Any) {
        if(purpleTriangleisClicked == true){
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedOnView))
        rightSwipeGesture.direction = .right
        
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedOnView))
        leftSwipeGesture.direction = .left
        
        let upSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedOnView))
        upSwipeGesture.direction = .up
            
        let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedOnView))
        downSwipeGesture.direction = .down
        
        wesAndersonMovie.addGestureRecognizer(rightSwipeGesture)
        wesAndersonMovie.addGestureRecognizer(leftSwipeGesture)
        wesAndersonMovie.addGestureRecognizer(upSwipeGesture)
        wesAndersonMovie.addGestureRecognizer(downSwipeGesture)
        }
    }
    
    @objc func swipedOnView(gesture: UISwipeGestureRecognizer) {
        
        switch gesture.direction {
        case .left:
            print("left")
            let frame = CGRect(x: 10, y: 10, width: self.wesAndersonMovie.frame.width - 50, height: self.wesAndersonMovie.frame.height)
            self.wesAndersonMovie.frame = frame
        case .right:
            print("right")
            let frame = CGRect(x: 10, y: 10, width: self.wesAndersonMovie.frame.width + 50, height: self.wesAndersonMovie.frame.height)
            self.wesAndersonMovie.frame = frame
        case.up:
            print("up")
            let frame = CGRect(x: 10, y: 10, width: self.wesAndersonMovie.frame.width + 50, height: self.wesAndersonMovie.frame.height)
            self.wesAndersonMovie.frame = frame
        case.down:
            print("down")
            let frame = CGRect(x: 10, y: 10, width: self.wesAndersonMovie.frame.width - 50, height: self.wesAndersonMovie.frame.height)
            self.wesAndersonMovie.frame = frame
        default:
           print("other")
        }
        
    }
  
    
   
    
    
    @IBAction func frenchDispPinchGesture(_ sender: Any) {
        if(blackTriangleIsClicked == true){
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinched))
        wesAndersonMovie.addGestureRecognizer(pinchGesture)
            let FirstFrame = wesAndersonMovie.frame.size
           if(superView.frame.width < wesAndersonMovie.frame.width ||
               superView.frame.height < wesAndersonMovie.frame.height){
               self.wesAndersonMovie.frame.size = FirstFrame
               
            }
            
        }
    }
    
@objc func pinched(gesture: UIPinchGestureRecognizer) {
    gesture.view?.transform = (gesture.view?.transform.scaledBy(x: gesture.scale, y: gesture.scale))!
    print(gesture.scale)
    gesture.scale = 1
   
    
}
   
    

}




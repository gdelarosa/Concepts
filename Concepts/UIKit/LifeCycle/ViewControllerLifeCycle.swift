//
//  ViewControllerLifeCycle.swift
//  Concepts
//
//  Created by Gina De La Rosa on 12/2/20.
//  Source: https://developer.apple.com/documentation/uikit/uiviewcontroller

/*
 The view controller is a blank canvas that can have a layer called the “view" with various elements such as images, text, a button, etc.. These elements are controlled by code that is in the UIViewController class file to support events, animations, and what we see occur on the screen.
 
 The UIViewController class will call methods that may have custom behaviors waiting to happen. Furthermore, using these methods will allow you to set up or tear down the views being displayed as part of the lifecycle process. These methods are: viewWillAppear, viewDidAppear, viewWillDisappear, & viewDidDisappear.
 
 The viewDidLoad method is called when the view controller’s content is created and loaded from a storyboard. We use this method for our initial setup and you will always find one when you create a new view controller file.
 
 Prior to the view appearing we have the method viewWillAppear that gets called. This method is used to trigger events that need to occur before the view is presented on screen.
 
 The viewDidAppear method is called after the view controller’s content view has been added. We call this method when we need events to happen as soon as the view is presented on the screen. Some examples of this is fetching data or showing an animation. Even if we go to a different view controller and come back, we will see the animation occur again.
 
 The viewWillDisappear method is called before the view controller’s content view is removed. We use this method to perform cleanup tasks and is only called when the content view is about to be removed.
 
 The viewDidDisappear is called after the view controller’s content view has been removed. We use this method to stop tasks that do not need to be running while the view is no longer on the screen. For example, we can stop a network call or stop listening to notifications.
*/

import UIKit

class ViewControllerLifeCycle: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var pressButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view has loaded")
        catImage.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        animateButton()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    // MARK: - Button actions
    @IBAction func pressMeButton(_ sender: Any) {
        print("Blue button pressed")
        catImage.isHidden = false
    }
    
    // MARK: - Methods
    
    func animateButton() {
        print("Blue button is animating!")
        UIView.animate(withDuration: 0.6, animations: {
            self.pressButton.transform = CGAffineTransform.identity.scaledBy(x: 0.6, y: 0.6)
        }, completion: { (finish) in
            UIView.animate(withDuration: 0.6, animations: {
                self.pressButton.transform = CGAffineTransform.identity
            })
        })
    }
    
}

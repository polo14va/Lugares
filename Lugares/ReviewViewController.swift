//
//  ReviewViewController.swift
//  Mis Recetas 2
//
//  Created by Pedro Martinez on 20/9/16.
//  Copyright © 2016 Pedro Martinez. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet var backgroundImageView: UIImageView!
    
    @IBOutlet var ratingStackView: UIStackView!
    
    
    var ratingSelected : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let blurEffect =  UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
    
    
        ratingStackView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        
    
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        /*UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
                self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: nil)
        */
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    @IBAction func ratingPressed(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            ratingSelected = "No me gusta"
        case 2:
            ratingSelected = "me gusta"
        case 3:
            ratingSelected = "Me encanta"
        default:
            break
        }
        
        performSegue(withIdentifier: "unwindToDetailView", sender: sender)
    }
    
    
    
    
    
    

}

//
//  DogViewController.swift
//  dogApiAsync
//
//  Created by user221908 on 7/13/22.
//

import UIKit


class DogViewController: UIViewController {

    @IBOutlet weak var dogImg: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    var dog: DogApi?
       
       override func viewDidLoad() {
           super.viewDidLoad()

    
           nameLbl.text = dog?.localized_name
         
           
       }


}

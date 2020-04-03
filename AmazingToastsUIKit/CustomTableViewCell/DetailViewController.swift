//
//  DetailViewController.swift
//  CustomTableViewCell
//
//  Created by eleonora elefante on 03/04/2020.
//  Copyright © 2020 Antonio Mennillo. All rights reserved.
//
import UIKit


class DetailViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    var toastSelected: Int = 0
    
    @IBOutlet weak var toastImage: UIImageView!
    @IBOutlet weak var toastDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        toastImage.image = UIImage(named: toasts[toastSelected].imagecode)
        toastDescription.text = toasts[toastSelected].description
        
        navigationBar.title = toasts[toastSelected].name
     self.navigationController?.navigationBar.prefersLargeTitles = false
    }
}




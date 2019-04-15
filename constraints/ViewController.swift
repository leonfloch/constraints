//
//  ViewController.swift
//  constraints
//
//  Created by Leonardo Calderon on 4/15/19.
//  Copyright © 2019 Leonardo Calderon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bottonConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pantalla()
        
    }
    
    /**
    Detecta el tamano de la pnatalla
    **/
    func pantalla() {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                print("iphone 5 o se")
            case 1334:
                print("iphone 6 o 7")
            case 1920:
                print("iphone plus")
            case 2436:
                self.bottonConstraint.constant = 250
                print("iphone x xs")
            case 1792:
                print("iphone xr")
            case 2688:
                print("iphone x max")
            default:
                print("cualquier otro")
            }
        }
    }


}


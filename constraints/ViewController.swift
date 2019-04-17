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
    
    
    
    @IBOutlet weak var total: UILabel!
    
    @IBOutlet weak var descuento: UILabel!
    
    @IBOutlet weak var cantidadText: UITextField!
    
    @IBOutlet weak var porcentajeText: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pantalla()
        
        NotificationCenter.default.addObserver(self, selector: #selector(teclado(notificacion:)), name:
            UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(teclado(notificacion:)), name:
            UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(teclado(notificacion:)), name:
            UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func teclado(notificacion: Notification) {
        
        guard let tecladoUp = (notificacion.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        
        if notificacion.name == UIResponder.keyboardWillShowNotification {
            if UIScreen.main.nativeBounds.height == 1136 {
                self.view.frame.origin.y = -tecladoUp.height
            }
        } else {
            self.view.frame.origin.y = 0
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
    
    
    @IBAction func calcular(_ sender: UIButton) {
        self.view.endEditing(true)
        
        if cantidadText.text != "" && porcentajeText.text != "" {
            guard let numero = cantidadText.text else { return }
            guard let porc = porcentajeText.text else { return }
        
        
            let cant = (numero as NSString).floatValue
            print(cant)
            let porciento = (porc as NSString).floatValue
        
            let desc = cant * porciento / 100
            let totalFinal = cant - desc
        
            total.text = "$\(totalFinal)"
            descuento.text = "$\(desc)"
            
        } else {
            let alert = UIAlertController(title: "alerta", message: "escribe cantidad y porcentaje", preferredStyle: .alert)
            let accion = UIAlertAction(title: "ok", style: .default, handler: nil)
            alert.addAction(accion)
            present(alert, animated: true, completion: nil)
        }
        
    }
    

    @IBAction func limpiar(_ sender: UIButton) {
        self.view.endEditing(true)
        total.text = "$0.00"
        descuento.text = "$0.00"
        cantidadText.text = ""
        porcentajeText.text = ""
    }
    
}


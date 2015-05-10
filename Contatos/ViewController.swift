//
//  ViewController.swift
//  Contatos
//
//  Created by Kaue Mendes on 3/10/15.
//  Copyright (c) 2015 Fellas Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, SyncServerDelegate
{

    @IBOutlet weak var viewName: UIView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var lblFormContato: UILabel!
    @IBOutlet weak var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtName.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        println("Vai aparecer a view")
    }
    
    override func viewDidAppear(animated: Bool) {
        println("Apareceu")
    }
    
    
    @IBAction func stepperChanged(sender: UIStepper) {
        self.ageLabel.text = "\(sender.value)"
    }

    @IBAction func switchOff(sender: AnyObject) {
        
        var isOn = mySwitch.on
        
        if( isOn ){
            viewName.backgroundColor = UIColor(red: 2.5, green: 0.0, blue: 0.5, alpha: 0.3)
        } else {
            viewName.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        }
    }

    @IBAction func chooseContactForm(sender: UIButton) {
        
        var actionAlert = UIAlertController(title: "Contato", message: "Escolha a forma de contato abaixo:", preferredStyle: .ActionSheet)
        
        actionAlert.addAction(UIAlertAction(
            title: "Cancelar"
            , style: .Cancel
            , handler: nil))
        
        actionAlert.addAction(UIAlertAction(
              title: "E-mail"
            , style: UIAlertActionStyle.Default
            , handler: {
                action in
                self.lblFormContato.text = action.title
        }))
        
        actionAlert.addAction(UIAlertAction(
            title: "Telefone"
            , style: UIAlertActionStyle.Default
            , handler: {
                action in
                self.lblFormContato.text = action.title
        }))
        
        
        presentViewController(actionAlert, animated: true, completion: nil)
        
    }

    @IBAction func saveContact(sender: UIButton) {
        
        var alertMessage = UIAlertController(
              title: "Contato"
            , message: "Deseja realmente gravar este contato?"
            , preferredStyle: .Alert )
        
        alertMessage.addAction(UIAlertAction(
              title: "Não"
            , style: .Cancel
            , handler: { _ in
                println("Alert - Não")
            })
        )
        
        
        alertMessage.addAction(UIAlertAction(
            title: "Sim"
            , style: .Default
            , handler: { _ in
                // Instancia no Banco
                let sync = SyncServer();
                sync.delegate = self
                
                // SImula gravacao no BD
                println("Passou aqui no SendToBD")
                sync.SendToBD();
            })
        )
        
        presentViewController(alertMessage, animated: true, completion: nil)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        txtName.resignFirstResponder()
        
        return false;
    }
    
    func infoSaved() {
        
        var alertSaved = UIAlertController(
            title: "Sucesso"
            , message: "Suas informações foram gravadas com sucesso."
            , preferredStyle: .Alert )
        
        alertSaved.addAction(UIAlertAction(
            title: "OK"
            , style: .Default
            , handler: nil )
        )
        
        presentViewController(alertSaved, animated: true, completion: nil)
        
    }
}


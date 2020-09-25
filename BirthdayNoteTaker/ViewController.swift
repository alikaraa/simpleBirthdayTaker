//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Ali Kara on 25.09.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        //Casting as? vs as!
        
        if let newName = storedName as? String{
            nameLabel.text = "Name: \(newName)"
        }
        if let newBirthday = storedBirthday as? String{
            birthdayLabel.text = "Birthday:\(newBirthday)"
        }
        
    }

    @IBAction func buttonClicked(_ sender: Any) {
        
        
        UserDefaults.standard.set(nameTextField.text!, forKey: "name") //veri tabanina kaydetmek icin kullaniriz sonra yukarda obj tanimlariz
        UserDefaults.standard.set(birthdayTextField.text!, forKey: "birthday")
        //UserDefaults.standard.synchronize() bu kodu artik kullanmamiza gerek yok internette karsimiza flan cikarsa bilelim diye bir bilgi kendisi yapiyor artik senkroziseyi
        
        
        nameLabel.text = "Name: \(nameTextField.text!)"
        birthdayLabel.text = "Birthday: \(birthdayTextField.text!)"
        
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        // ""bos bir deger bu ama --> nil <-- bir deger bile yok birsey nil degilse bir degeri var demektir
        
        if (storedName as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name"
        }
        if (storedBirthday as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday"
        }
        
    }
    
}


//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by amit kumar mishra on 4/28/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var txtname: UITextField!
    @IBOutlet weak var txtage: UITextField!
    @IBOutlet weak var txtcollege: UITextField!
    @IBOutlet weak var txtaddress: UITextField!
    @IBOutlet weak var txtcity: UITextField!
    @IBOutlet weak var txtstate: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var agelbl: UILabel!
    @IBOutlet weak var collegelbl: UILabel!
    @IBOutlet weak var addresslbl: UILabel!
    @IBOutlet weak var citylbl: UILabel!
    @IBOutlet weak var statelbl: UILabel!
    @IBOutlet weak var countrylbl: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        

    }
    
    
    @IBAction func SetDb(_ sender: Any)
    {
        
        let CallAppDel = UIApplication.shared.delegate as! AppDelegate
        let context = CallAppDel.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Home", in: context)
        let newEntity = NSManagedObject(entity: entity!, insertInto: context)
        
        newEntity.setValue(txtname.text!, forKey: "name")
        newEntity.setValue(txtage.text!, forKey: "age")
        newEntity.setValue(txtcollege.text!, forKey: "college")
        //newEntity.setValue(txtaddress.text!, forKey: "address")
//        newEntity.setValue(txtcity.text!, forKey: "city")
//        newEntity.setValue(txtstate.text!, forKey: "state")
//        newEntity.setValue(txtCountry.text!, forKey: "country")


        
        
        
        do
        {
            try context.save()
        }
        catch
        {
            print("error")
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Home")
        
        request.returnsObjectsAsFaults = false
        
        do
        {
            let result = try context.fetch(request)
            
            for data in result as! [NSManagedObject]
            {
                print(data.value(forKey: "name") as! String)
                print(data.value(forKey: "age") as! String)
                print(data.value(forKey: "college") as! String)
                
                let GetUserName: String = data.value(forKey: "name") as! String
                let GetUserAge: String = data.value(forKey: "age") as! String
                let GetUserCollege: String = data.value(forKey: "college") as! String
               // let GetUserAddress: String = data.value(forKey: "address") as! String
//                let GetUserCity: String = data.value(forKey: "city") as! String
//                let GetUserState: String = data.value(forKey: "state") as! String
//                let GetUserCountry: String = data.value(forKey: "country") as! String
                
                namelbl.text = GetUserName as String
                agelbl.text = GetUserAge as String
                collegelbl.text = GetUserCollege as String
               // addresslbl.text = GetUserAddress as String
//                citylbl.text = GetUserCity as String
//                statelbl.text = GetUserState as String
//                countrylbl.text = GetUserCountry as String
            }
        }
        catch
        {
            print("error")
        }

        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


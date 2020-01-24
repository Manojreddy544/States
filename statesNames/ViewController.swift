//
//  ViewController.swift
//  statesNames
//
//  Created by VENNAPUSA MANOJ KUMAR REDDY on 3/22/19.
//  Copyright © 2019 VENNAPUSA MANOJ KUMAR REDDY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Creating Variables for Request and Response
    
    var URLReq:URLRequest!
    var dataTask:URLSessionDataTask!
    
   

   

    override func viewDidLoad() {
        super.viewDidLoad()
//        var button = UIButton()
        
//        Calling the methods
        creatingButton()
//        getStates()
//        getCities()
//        stateLabel()
//        cityLabel()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = #colorLiteral(red: 0.9845941663, green: 0.8211564422, blue: 0.01834700815, alpha: 1) // It displays the simulator background
    }
    func creatingButton()
        {
    
    let button:UIButton = UIButton(frame: CGRect(x: 150, y: 800, width: 100, height: 50))
    button.backgroundColor = .black
    button.setTitle("Click Here", for: .normal)
            
    button.addTarget(self, action:#selector(self.buttonClicked), for: UIControl.Event.touchUpInside)
    self.view.addSubview(button)
    }
    @objc func buttonClicked() {
        print("Button Clicked")
         getStates()
        stateLabel()
        getCities()
        cityLabel()
    }
    
    
    //creating method for displaying state label
    func stateLabel()
    {
        var stateSymbolLabel = UILabel()//Intiating label
        stateSymbolLabel.frame = CGRect(x: 30, y: 55, width: 150, height: 30)//setting  frame position
        stateSymbolLabel.textAlignment = .center
        stateSymbolLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)//Label background
        stateSymbolLabel.numberOfLines = 0
        //It increase or decreases the label font size
        stateSymbolLabel.font = stateSymbolLabel.font.withSize(20)
        stateSymbolLabel.text = "STATES"
        view.addSubview(stateSymbolLabel)//Displaying the label
        
        
    }
    //creating method for displaying city label
    func cityLabel()
    {
        var citySymbolLabel = UILabel()//Intiating label
        citySymbolLabel.frame = CGRect(x: 230, y: 55, width: 150, height: 30)//setting  frame position
        citySymbolLabel.textAlignment = .center
        citySymbolLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)//Label background
        citySymbolLabel.numberOfLines = 0
        //It increase or decreases the label font size
        citySymbolLabel.font = citySymbolLabel.font.withSize(20)
        citySymbolLabel.text = "CITIES"
        view.addSubview(citySymbolLabel)//Displaying the label
        
        
    }
    
    
    
    

    func getStates()
    {
        //Requesting through URL GET method
        
        URLReq = URLRequest(url: URL(string: "https://www.brninfotech.com/tws/IndiaDetails.php?type=states&quantity=15")!)
        dataTask = URLSession.shared.dataTask(with: URLReq, completionHandler: { (data, response, error) in
            print("Got the data from servers")//Getting the data from server
            print(data!)
            
            do{
                
            
            //converting data into swift language using JSON
                
                var statesData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String]
                print(statesData)
                
                var a = 0
                for i in 0..<statesData.count
                {
                    var statesLabel = UILabel()
//                    DispatchQueue.main.async {
                        statesLabel.frame = CGRect(x: 20, y: 90+a, width: 185, height: 40)
                        statesLabel.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
                    statesLabel.numberOfLines = 0
                    statesLabel.textAlignment = .center
                        statesLabel.font = statesLabel.font.withSize(20);                   statesLabel.text = statesData[i]
                        self.view.addSubview(statesLabel)//Displaying the states
                    
//                }
                
              a += 45
                
            }
                
            }
            catch{
                print("Error occured")
            }
        })
        dataTask.resume()//ready to proceed
        
        
    }
    
    
    func getCities()
    {
        //Requesting through URL GET method
        URLReq = URLRequest(url: URL(string: "https://www.brninfotech.com/tws/IndiaDetails.php?type=cities&quantity=15")!)
        dataTask = URLSession.shared.dataTask(with: URLReq, completionHandler: { (data, response, error) in
            print("Got the data from servers")//Getting the data from server
            print(data!)
            
            do{
                
                
                //converting data into swift language using JSON
                var citiesData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String]
                print(citiesData)
                
                var a = 0
                for i in 0..<citiesData.count
                {
                    var citiesLabel = UILabel()
                    //                    DispatchQueue.main.async {
                    citiesLabel.frame = CGRect(x: 220, y: 90+a, width: 185, height: 40)
                    citiesLabel.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                    citiesLabel.numberOfLines = 0
                    citiesLabel.textAlignment = .center
                    citiesLabel.font = citiesLabel.font.withSize(20);                   citiesLabel.text = citiesData[i]
                    self.view.addSubview(citiesLabel)//Displaying the states
                    
                    //                }
                    
                    a += 45
                    
                }
                
            }
            catch{
                print("Error occured")
            }
        })
        dataTask.resume()//ready to proceed
        
        
    }
    
    
    

}


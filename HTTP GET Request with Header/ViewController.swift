//
//  ViewController.swift
//  HTTP GET Request with Header
//
//  Created by Macbook Air 2017 on 20. 12. 2023..
//

import UIKit

let GET_ENDPOINT = "https://jsonplaceholder.typicode.com/todos/1"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getRequest()
    }

    func getRequest() {
        
        // Create URL
        guard let url = URL(string: GET_ENDPOINT) else {
            return
        }
        
        // Create URL Request
        var urlRequest = URLRequest(url: url)
        
        // Specify HTTP Method
        urlRequest.httpMethod = "GET"
        
        // Set HTTP Request Header
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        // We can set more than one header
        urlRequest.setValue("Basic htu574kfj584kfnd84kdlwut92jayebgpylg8md72msgrk", forHTTPHeaderField: "Authorization")
        
        // Send HTTP Request
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                print("Error took place.")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
        })
        task.resume()
    }
}


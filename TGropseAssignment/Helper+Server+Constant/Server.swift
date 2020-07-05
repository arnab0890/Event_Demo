//
//  Server.swift
//  TestSwiftApp
//
//  Created by Surbhi on 21/10/16.
//  Copyright © 2016 Neuronimbus. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class Server: NSObject {
    
    static func getRequestWithURL(_ urlString: String, completionHandler:@escaping (_ response: Dictionary <String, Any>?) -> Void) {
        
        let defaultConfigObject = URLSessionConfiguration.default
        defaultConfigObject.timeoutIntervalForRequest = 240.0
        defaultConfigObject.timeoutIntervalForResource = 240.0
        let defaultSession = URLSession(configuration: defaultConfigObject, delegate: nil, delegateQueue: nil)
        
        let urlRequest = NSMutableURLRequest(url: NSURL(string: urlString)! as URL)
        urlRequest.httpMethod = "GET"
        urlRequest.timeoutInterval = 120.0
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
      //  urlRequest.setValue(Constants.AuthorisationStr, forHTTPHeaderField: "Authorization")
        
        let task = defaultSession.dataTask(with: urlRequest as URLRequest) { ( data, response, error) -> Void in
            
            if error != nil {
                print("Error occurred: "+(error?.localizedDescription)!)
                completionHandler(nil)
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: Any] {
                    completionHandler(json as Dictionary<String, Any>)
                }
            }
            catch let error {
                print(error.localizedDescription)
                completionHandler([:])
            }
            
            
        }
        task.resume()
    }
    
    class func postMultiPartMultiImage(param: [String:Any], urlStr: String , imageArray:[UIImage] , imageNameArray: [String], completion: @escaping (_ response: Dictionary <String, Any>) -> Void ) {
        
        Alamofire.upload(multipartFormData:{ multipartFormData in
            for (key, value) in param {
                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
           
            var i=0
            for img in imageArray{
            if let data = img.pngData(){
                multipartFormData.append(data, withName: "image", fileName: "\(imageNameArray[i]).png", mimeType: "image/png")
            }
                i = i + 1
            }
            
        }, usingThreshold:UInt64.init(),  to:urlStr,  method:.post,
           //headers:["Authorization": Constants.AuthorisationStr],
           encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    do {
                        if let json = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as? [String: Any] {
                           // json.printJson()
                            completion(json as Dictionary<String, Any>)
                        }
                    }
                    catch let error {
                        print(error.localizedDescription)
                        completion([:])
                    }
                    
                }
            case .failure(let encodingError):
                print(encodingError)
                completion([:])
            }
        })
        
        
    }
    
    
    class func postMultiPartdata(param: [String:Any], urlStr: String , image:UIImage , imageName: String, completion: @escaping (_ response: Dictionary <String, Any>) -> Void ) {
        
        
        Alamofire.upload(multipartFormData:{ multipartFormData in
            for (key, value) in param {
                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
            
            if let data = image.pngData(){
                multipartFormData.append(data, withName: "image", fileName: "\(imageName).png", mimeType: "image/png")
            } 
            
        }, usingThreshold:UInt64.init(),  to:urlStr,  method:.post,
       // headers:["Authorization": Constants.AuthorisationStr],
                         encodingCompletion: { encodingResult in
                            switch encodingResult {
                            case .success(let upload, _, _):
                                upload.responseJSON { response in
                                    do {
                                        if let json = try JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers) as? [String: Any] {
                                           // json.printJson()
                                            completion(json as Dictionary<String, Any>)
                                        }
                                    }
                                    catch let error {
                                        print(error.localizedDescription)
                                        completion([:])
                                    }
                                    
                                }
                            case .failure(let encodingError):
                                print(encodingError)
                                 completion([:])
                            }
        })
      
        
    }
    static  func PostDataInDictionary(_ urlString: String, paramterDic: Dictionary <String, Any>, completionHandler:@escaping (_ response: Dictionary <String, Any>) -> Void) {
        
        let defaultConfigObject = URLSessionConfiguration.default
        defaultConfigObject.timeoutIntervalForRequest = 240.0
        defaultConfigObject.timeoutIntervalForResource = 240.0
        let defaultSession = URLSession(configuration: defaultConfigObject, delegate: nil, delegateQueue: nil)
        
        let urlRequest = NSMutableURLRequest(url: NSURL(string: urlString)! as URL)
        urlRequest.httpMethod = "POST"
        urlRequest.timeoutInterval = 100.0
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
      //  urlRequest.setValue(Constants.AuthorisationStr, forHTTPHeaderField: "Authorization")
        
        if paramterDic.count > 0{
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: paramterDic, options: .prettyPrinted)
                urlRequest.httpBody = jsonData
             //  print(jsonData)
            }
            catch {
                print(error)
            }
        }
        
        let task = defaultSession.dataTask(with: urlRequest as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                completionHandler([:])
                return
            }
            guard let data = data else {
                completionHandler([:])
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    // print(json)
                   // json.printJson()
                    completionHandler(json as Dictionary<String, Any>)
                }
            }
            catch let error {
                print(error.localizedDescription)
                completionHandler([:])
            }
        })
        
        task.resume()
    }
    
    static  func PUTDataInDictionary(_ urlString: String, dateString: String, source : String, paramterDic: Dictionary <String, Any>, completionHandler:@escaping (_ response: Dictionary <String, Any>) -> Void) {
        
        let defaultConfigObject = URLSessionConfiguration.default
        defaultConfigObject.timeoutIntervalForRequest = 240.0
        defaultConfigObject.timeoutIntervalForResource = 240.0
        let defaultSession = URLSession(configuration: defaultConfigObject, delegate: nil, delegateQueue: nil)
        
        
        let urlRequest = NSMutableURLRequest(url: NSURL(string: urlString)! as URL)
        urlRequest.httpMethod = "PUT"
        urlRequest.timeoutInterval = 100.0
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: paramterDic, options: .prettyPrinted)
            urlRequest.httpBody = jsonData
            //print(jsonData)
        }
        catch {
           // print(error)
        }
        
        let task = defaultSession.dataTask(with: urlRequest as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                completionHandler([:])
                return
            }
            guard let data = data else {
                completionHandler([:])
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                  //  json.printJson()
                    completionHandler(json as Dictionary<String, Any>)
                }
            }
            catch let error {
                print(error.localizedDescription)
                completionHandler([:])
            }
        })
        
        task.resume()
    }
    static func postRequestWithURL(_ urlString: String, paramString: String, completionHandler:@escaping (_ response: Dictionary <String, AnyObject>) -> Void) {
            
            
            let defaultConfigObject = URLSessionConfiguration.default
            let defaultSession = URLSession(configuration: defaultConfigObject, delegate: nil, delegateQueue: nil)
            
            let urlRequest = NSMutableURLRequest(url: NSURL(string: urlString)! as URL)
            urlRequest.httpMethod = "POST"
            urlRequest.httpBody = paramString.data(using: String.Encoding.utf8)
            
            // Handling Basic HTTPS Authorization
//            let authValue = "Basic bWFteXBva29wYW50c0BnbWFpbC5jb206TmV1cm9AMTIz"
//            urlRequest.setValue(authValue, forHTTPHeaderField: "Authorization")
            
            let task = defaultSession.dataTask(with: urlRequest as URLRequest, completionHandler: { data, response, error in
                
                guard error == nil else {
                    return
                }
                
                guard let data = data else {
                    return
                }
                
                do {
                    
                    //create json object from data
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        print(json)
                        completionHandler(json as Dictionary<String, AnyObject>)
                        // handle json...
                        
                    }
                    
                } catch let error {
//                    Constants.appDel.stopLoader()
//                    PKSAlertController.alert("Error", message: error.localizedDescription)
                   print(error.localizedDescription)
                }
            })
            
    //        let task = defaultSession.dataTask(with: urlRequest as URLRequest) { ( data, response, error) -> Void in
    //
    //            if error != nil {
    //                print("Error occurred: "+(error?.localizedDescription)!)
    //                //                Constants.appDelegate.stopIndicator()
    //                return;
    //            }
    //            do {
    //                let responseObjc = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: AnyObject]
    //                completionHandler(responseObjc)
    //            }
    //            catch {
    //                print("Error occurred parsing data: \(error)")
    //                completionHandler([:])
    //            }
    //        }
            task.resume()
        }
}

    


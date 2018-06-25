//
//  RequestManager.swift
//  FlowerPower
//
//  Created by Andrei Bungiu on 18/06/2018.
//  Copyright © 2018 Andrei Bungiu. All rights reserved.
//

import UIKit

struct appUrl {
    
     struct Domains {
        static let mockDomainUrl = "http://demo4219278.mockable.io/flowerList"
    }
}

let mockDomainUrl = appUrl.Domains.mockDomainUrl;

class RequestManager: NSObject {
    
    func fetchOrdersWithCompletionBlock(completionHandler: @escaping (_ flowerOrders: [Flower], _ error: NSError?) -> Void) -> Void {
        let url = NSURL(string: mockDomainUrl)
        var flowerArray = [Flower]()
        
        _ = URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                print(jsonObj!.value(forKey: "flowerOrder" )!)
                
                if let flowerOrdersArray = jsonObj!.value(forKey: "flowerOrder") as? NSArray {
                    for flower in flowerOrdersArray {
                        if let flowerDict = flower as? NSDictionary {
                            let fl = Flower()
                            if let deliverTo = flowerDict.value(forKey: "deliver_to") {
                                fl.deliver_to = deliverTo as! String
//                                flowerArray.append((name as? String)!)
                            }
                            if let id = flowerDict.value(forKey: "id") {
                                fl.id = id as! Int
                            }
                            if let description = flowerDict.value(forKey: "description") {
                                fl.desc = description as! String
                            }
                            if let price = flowerDict.value(forKey: "price") {
                                fl.price = price as! Int
                            }
                            flowerArray.append(fl)
                        }
                    }
                }
                
                completionHandler(flowerArray, error as NSError?)
            }
        }).resume()
    }
}

//: Playground - noun: a place where people can play

import UIKit
import Foundation

let dictionary:[NSString: AnyObject] =
    ([
        "First name" : "Anthony",
        "Last name" : "Robbins",
        "Age" : 15,
        "Children" : [
            "Anhtony's Son1",
            "Anthony's Daughter 1"
        ],
        ] as AnyObject) as! [NSString : AnyObject]

/*
 do {
 if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSDictionary {
 print(jsonResult)
 }
 } catch let error as NSError {
 print(error.localizedDescription)
 }
 */



//var error = Error.self
////let jsonData = JSONSerialization.data(withJSONObject: dictionary,
////                                      options: .prettyPrinted, error: &error)
//if let data = jsonData {
//    if data.length > 0 && error = nil {
//        print("successfully serialazed")
//        let jsonString = (data: data, encoding: UTF8)
//        print("JSON String = \(jsonString)")
//    }
//    else if data.length == 0 && error == nil {
//        print("No Data")
//    }
//    else if error != nil {
//        print("An error happened\(error)")
//    }
//}
//

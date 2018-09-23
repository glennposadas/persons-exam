//
//  Person.swift
//  PersonsExam
//
//  Created by Glenn Von C. Posadas on 23/09/2018.
//  Copyright © 2018 Glenn Von C. Posadas. All rights reserved.
//

import Foundation
import SwiftyJSON


class Person : NSObject, NSCoding{
    
    var address : String!
    var birthdate : String!
    var contactPerson : String!
    var contactPersonPhoneNumber : String!
    var email : String!
    var firstName : String!
    var id : String!
    var lastName : String!
    var mobileNumber : String!
    var picture : String!
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        address = json["address"].stringValue
        birthdate = json["birthdate"].stringValue
        contactPerson = json["contactPerson"].stringValue
        contactPersonPhoneNumber = json["contactPersonPhoneNumber"].stringValue
        email = json["email"].stringValue
        firstName = json["firstName"].stringValue
        id = json["id"].stringValue
        lastName = json["lastName"].stringValue
        mobileNumber = json["mobileNumber"].stringValue
        picture = json["picture"].stringValue
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if address != nil{
            dictionary["address"] = address
        }
        if birthdate != nil{
            dictionary["birthdate"] = birthdate
        }
        if contactPerson != nil{
            dictionary["contactPerson"] = contactPerson
        }
        if contactPersonPhoneNumber != nil{
            dictionary["contactPersonPhoneNumber"] = contactPersonPhoneNumber
        }
        if email != nil{
            dictionary["email"] = email
        }
        if firstName != nil{
            dictionary["firstName"] = firstName
        }
        if id != nil{
            dictionary["id"] = id
        }
        if lastName != nil{
            dictionary["lastName"] = lastName
        }
        if mobileNumber != nil{
            dictionary["mobileNumber"] = mobileNumber
        }
        if picture != nil{
            dictionary["picture"] = picture
        }
        return dictionary
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        address = aDecoder.decodeObject(forKey: "address") as? String
        birthdate = aDecoder.decodeObject(forKey: "birthdate") as? String
        contactPerson = aDecoder.decodeObject(forKey: "contactPerson") as? String
        contactPersonPhoneNumber = aDecoder.decodeObject(forKey: "contactPersonPhoneNumber") as? String
        email = aDecoder.decodeObject(forKey: "email") as? String
        firstName = aDecoder.decodeObject(forKey: "firstName") as? String
        id = aDecoder.decodeObject(forKey: "id") as? String
        lastName = aDecoder.decodeObject(forKey: "lastName") as? String
        mobileNumber = aDecoder.decodeObject(forKey: "mobileNumber") as? String
        picture = aDecoder.decodeObject(forKey: "picture") as? String
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    func encode(with aCoder: NSCoder)
    {
        if address != nil{
            aCoder.encode(address, forKey: "address")
        }
        if birthdate != nil{
            aCoder.encode(birthdate, forKey: "birthdate")
        }
        if contactPerson != nil{
            aCoder.encode(contactPerson, forKey: "contactPerson")
        }
        if contactPersonPhoneNumber != nil{
            aCoder.encode(contactPersonPhoneNumber, forKey: "contactPersonPhoneNumber")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if firstName != nil{
            aCoder.encode(firstName, forKey: "firstName")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if lastName != nil{
            aCoder.encode(lastName, forKey: "lastName")
        }
        if mobileNumber != nil{
            aCoder.encode(mobileNumber, forKey: "mobileNumber")
        }
        if picture != nil{
            aCoder.encode(picture, forKey: "picture")
        }
        
    }
    
}

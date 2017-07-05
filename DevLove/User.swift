//
//  User.swift
//  DevLove
//
//  Created by Daniel Ny on 2017-07-05.
//  Copyright © 2017 Daniel Ny. All rights reserved.
//
/*
 Bild
 E-post
 Lösenord
 Förnamn
 Efternamn
 Publikt namn
 Land/Stad.
 Språk?
 Jobb?
 Hemsida/portfolio.
 Kunnande 3ds, c#, ljud osv.
 Söker? Om du vill engagera dig i nått projekt.
 Grupp/er? - ansluta sig till grupper inom comunityt
 Översättning - ange om du kan översätta mellan olika språk?
 */

import Foundation

class User {
    var _email: String!
    var _password: String!
    var _firstName: String!
    var _lastName: String!
    var _publicName: String!
    var _city: String!
    
    var email: String {
        if _email == nil {
            _email = ""
        }
        return _email
    }
    
    var password: String {
        if _password == nil {
            _password = ""
        }
        return _password
    }
    
    var firstName: String {
        if _firstName == nil {
            _firstName = ""
        }
        return _firstName
    }
    
    var lastName: String {
        if _lastName == nil {
            _lastName = ""
        }
        return _lastName
    }
    
    var publicName: String {
        if _publicName == nil {
            _publicName = ""
        }
        return _publicName
    }
    
    var city: String {
        if _city == nil {
            _city = ""
        }
        return _city
    }
    
    
}

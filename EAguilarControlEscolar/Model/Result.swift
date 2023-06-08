//
//  Result.swift
//  EAguilarControlEscolar
//
//  Created by MacBookMBA17 on 06/06/23.
//

import Foundation

struct Result<T: Codable> : Codable
{
    var Object : T?
    var ErrorMessage : String?
    var Correct : Bool?
    var Objects : [T]?
    //var Ex : Error
    
    init()
    {
        self.Object = nil
        self.ErrorMessage = ""
        self.Correct = false
        self.Objects = []
        //self.Ex =
    }
}

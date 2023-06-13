//
//  AlumnoController.swift
//  EAguilarControlEscolar
//
//  Created by MacBookMBA17 on 06/06/23.
//

import Foundation
class AlumnoViewModel
{
    
    var IdAlumno = 0
    
    static func Get(response1 : @escaping(Result<Alumno>?,Error?)->Void)
    {
        let url = URL(string: "http://192.168.0.52/api/alumno")!
        URLSession.shared.dataTask(with: url){data,
            response, error in
            
            if let dataSource = data
            {
                let decoder = JSONDecoder()
                let result = try!
                decoder.decode(Result<Alumno>.self, from: dataSource)
                response1(result,nil)
            }
            if let errorSource = error
            {
                response1(nil, errorSource)
            }
            
        }.resume()
    }
    
    static func GetById(idAlumno : Int, response1 : @escaping(Result<Alumno>?,Error?)->Void)
    {
        let url = URL(string: "http://192.168.0.52/api/alumno/\(idAlumno)")!
        URLSession.shared.dataTask(with: url){data,
            response, error in
            
            if let dataSource = data
            {
                let decoder = JSONDecoder()
                let result = try!
                decoder.decode(Result<Alumno>.self, from: dataSource)
                response1(result,nil)
            }
            if let errorSource = error
            {
                response1(nil, errorSource)
            }
            
        }.resume()
    }
    
    static func Add(alumno :  Alumno)
    {
        let urlString = "http://192.168.0.52/api/alumno"
        let url = URL(string: urlString)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try! JSONEncoder().encode(alumno)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request)
        {
            data, response, error in
            
            if let dataSource = data{
               let decoder = JSONDecoder()
                let jsonString = String(data: dataSource, encoding: String.Encoding.utf8)
                let result = try! decoder.decode(Result<Alumno>.self, from: dataSource)
            }
            if let resultSource = error
            {
                
            }
        }.resume()
    }
    
    static func Update(alumno : Alumno)
    {
        let urlString = "http://192.168.0.52/api/alumno/\(alumno.IdAlumno)"
        let url = URL(string : urlString)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = try! JSONEncoder().encode(alumno)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request)
        {data, response, error in
            
            if let dataSource = data{
               let decoder = JSONDecoder()
                let jsonString = String(data: dataSource, encoding: String.Encoding.utf8)
                let result = try! decoder.decode(Result<Alumno>.self, from: dataSource)
            }
            if let resultSource = error
            {
                
            }
        }.resume()
    }
    
    static func Delete(idAlumno : Int )
    {
        let urlString = "http://192.168.0.52/api/alumno/\(idAlumno)"
        let url = URL(string : urlString)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request)
        {data, response, error in
            
            if let dataSource = data{
               let decoder = JSONDecoder()
                let jsonString = String(data: dataSource, encoding: String.Encoding.utf8)
                let result = try! decoder.decode(Result<Alumno>.self, from: dataSource)
            }
            if let resultSource = error
            {
                
            }
        }.resume()
    }
}

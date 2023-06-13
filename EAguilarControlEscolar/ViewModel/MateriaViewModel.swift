//
//  MateriaViewModel.swift
//  EAguilarControlEscolar
//
//  Created by MacBookMBA17 on 06/06/23.
//

import Foundation


class MateriaViewModel
{
    
    var IdMateria = 0
    
    static func Get(response1 : @escaping(Result<Materia>?, Error?)->Void)
    {
        let url = URL(string: "http://192.168.0.52/api/materia")!
        URLSession.shared.dataTask(with: url){data,
            response, error in
            
            if let dataSource = data
            {
                let decoder = JSONDecoder()
                let result = try! decoder.decode(Result<Materia>.self, from: dataSource)
                response1(result, nil)
            }
            if let errorSource = error
            {
                response1(nil, errorSource)
            }
            
        }.resume()
    }
    
    
    static func GetById(idMateria : Int, response1 : @escaping(Result<Materia>?,Error?)->Void)
    {
        let url = URL(string: "http://192.168.0.52/api/materia/\(idMateria)")!
        URLSession.shared.dataTask(with: url){data,
            response, error in
            
            if let dataSource = data
            {
                let decoder = JSONDecoder()
                let result = try!
                decoder.decode(Result<Materia>.self, from: dataSource)
                response1(result,nil)
            }
            if let errorSource = error
            {
                response1(nil, errorSource)
            }
            
        }.resume()
    }
    
    static func Add(materia :  Materia)
    {
        let urlString = "http://192.168.0.52/api/materia"
        let url = URL(string: urlString)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try! JSONEncoder().encode(materia)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request)
        {
            data, response, error in
            
            if let dataSource = data{
               let decoder = JSONDecoder()
                let jsonString = String(data: dataSource, encoding: String.Encoding.utf8)
                let result = try! decoder.decode(Result<Materia>.self, from: dataSource)
            }
            if let resultSource = error
            {
                
            }
        }.resume()
    }
    
    static func Update(materia : Materia)
    {
        let urlString = "http://192.168.0.52/api/materia/\(materia.IdMateria)"
        let url = URL(string : urlString)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = try! JSONEncoder().encode(materia)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request)
        {data, response, error in
            
            if let dataSource = data{
               let decoder = JSONDecoder()
                let jsonString = String(data: dataSource, encoding: String.Encoding.utf8)
                let result = try! decoder.decode(Result<Materia>.self, from: dataSource)
            }
            if let resultSource = error
            {
                
            }
        }.resume()
    }
    
    static func Delete(idMateria : Int )
    {
        let urlString = "http://192.168.0.52/api/materia/\(idMateria)"
        let url = URL(string : urlString)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request)
        {data, response, error in
            
            if let dataSource = data{
               let decoder = JSONDecoder()
                let jsonString = String(data: dataSource, encoding: String.Encoding.utf8)
                let result = try! decoder.decode(Result<Materia>.self, from: dataSource)
            }
            if let resultSource = error
            {
                
            }
        }.resume()
    }
    
}

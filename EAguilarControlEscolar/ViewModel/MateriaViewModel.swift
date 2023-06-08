//
//  MateriaViewModel.swift
//  EAguilarControlEscolar
//
//  Created by MacBookMBA17 on 06/06/23.
//

import Foundation


class MateriaViewModel
{
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
}

//
//  MateriasAsignadas.swift
//  EAguilarControlEscolar
//
//  Created by MacBookMBA17 on 12/06/23.
//

import Foundation

struct AlumnoMateria : Codable
{
    var IdAlumnoMateria : Int?
    var Alumno : Alumno?
    var Materia : Materia?
    
    init()
    {
        self.IdAlumnoMateria = 0
        self.Alumno = EAguilarControlEscolar.Alumno()
        self.Materia = EAguilarControlEscolar.Materia()
    }
}

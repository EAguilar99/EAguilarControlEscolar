//
//  AlumnoController.swift
//  EAguilarControlEscolar
//
//  Created by MacBookMBA17 on 06/06/23.
//

import UIKit

class AlumnoController: UITableViewController {
    
    var alumnos : [Alumno] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "AlumnoCell", bundle: .main), forCellReuseIdentifier: "AlumnoCell")
        
        var alumno = Alumno()
        alumno.IdAlumno = 0
        alumno.Nombre = "Eric Daniel.a"
        alumno.ApellidoPaterno = "Hernandez"
        alumno.ApellidoMaterno = "Aguilar"
        alumno.FechaNacimiento  = "02/09/1999"
        alumno.Genero = "M"
        alumno.Telefono = "23453421524"
        AlumnoViewModel.Add(alumno: alumno)
        
    
        
        
        AlumnoViewModel.Get{result, error in
            if let resultSource = result {
                
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                if result!.Correct == true
                {
                    for objAlumno in result!.Objects!
                    {
                        let alumno = objAlumno as! Alumno
                        self.alumnos.append(alumno)
                        
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                else
                {
                    let alert = UIAlertController(title: "Error", message: "Ocurrio un error al realizar la consulta", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .default)
                    alert.addAction(action)
                    self.present(alert, animated: true)
                }
            }
            
        }
    }

        
        // MARK: - Table view data source
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return alumnos.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AlumnoCell", for: indexPath) as! AlumnoCell
            
            cell.lblNombreOutlet.text = ("Nobmre:  \(alumnos[indexPath.row].Nombre)")
            cell.lblApellidoPaternoOutlet.text = ("Apellido Paterno:   \(alumnos[indexPath.row].ApellidoPaterno)")
            cell.lblApellidoMaternoOutlet.text = ("Apellido Materno:   \(alumnos[indexPath.row].ApellidoMaterno)")
            cell.lblFechaNacimientoOutlet.text = ("Fecha Nacimiento:   \(alumnos[indexPath.row].FechaNacimiento!)")
            cell.lblTelefonoOutlet.text = ("Telefono:   \(alumnos[indexPath.row].Telefono)")
            cell.lblGeneroOutlet.text = ("Genero:   \(alumnos[indexPath.row].Genero)")
            
            // Configure the cell...
            
            
            return cell
        }
    }



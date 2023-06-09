//
//  AlumnoController.swift
//  EAguilarControlEscolar
//
//  Created by MacBookMBA17 on 06/06/23.
//

import UIKit
import SwipeCellKit

class AlumnoController: UITableViewController {
    
    var  idAlumno = 0
    var alumnos : [Alumno] = []
    
    @IBOutlet weak var txtNombreOutlet: UITextField!
    
    @IBOutlet weak var txtApellidoPaternoOutlet: UITextField!
    
    @IBOutlet weak var txtNombreApellidoMaternoOutlet: UITextField!
    @IBOutlet weak var DatepickerOutlet: UIDatePicker!
    @IBOutlet weak var txtGeneroOutlet: UITextField!
    @IBOutlet weak var txtTelefonoOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "AlumnoCell", bundle: .main), forCellReuseIdentifier: "AlumnoCell")
        
    /*    var alumno = Alumno()
        alumno.Nombre = "Eric Daniel.a"
        alumno.ApellidoPaterno = "Hernandez"
        alumno.ApellidoMaterno = "Aguilar"
        alumno.FechaNacimiento  = "02/09/1999"
        alumno.Genero = "M"
        alumno.Telefono = "23453421524"
        AlumnoViewModel.Add(alumno: alumno)
        
    
        */
        
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
            
            cell.delegate = self
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

//MARK: swipe cell kit

extension AlumnoController : SwipeTableViewCellDelegate{
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeCellKit.SwipeActionsOrientation) -> [SwipeCellKit.SwipeAction]?
    {
        
        if orientation == .right
        {
            let deleteAction = SwipeAction(style: .destructive, title: "Delete")
            {
                action, indexPath in
                print(indexPath.row)
                
                print("Se ejecuto la funcion de borrar")
                //CODIGO A EJECUTAR
                
                //AlumnoViewModel.Delete(idAlumno : 2)
                AlumnoViewModel.Delete(idAlumno: self.idAlumno)
                
                //let result  = UsuarioViewModel.Delete(idUsuario: self.usuarios[indexPath.row].IdUsuario!)
                AlumnoViewModel.Delete(idAlumno: self.alumnos[indexPath.row].IdAlumno)
               /*
                
                let result =
                if result.Correct!
                {
                    self.updateUI()
                }
                else
                {
                    print("Ocurrio un error")
                }*/
                
            }
            return [deleteAction]
        }
        if orientation == .left {
            let updateAction = SwipeAction(style: .default, title: "Update") { action, indexPath in
                
                //self.IdUsuario = self.usuarios[indexPath.row].IdUsuario!
                //self.performSegue(withIdentifier: "FormController", sender: self)
                
                
                print("Se ejecuto la funcion de update")
                //CODIGO A EJECUTAR
                //
            }
            return [updateAction]
        }
        return nil
    }
}

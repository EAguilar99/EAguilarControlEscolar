//
//  AlumnoMateriaGetAllController.swift
//  EAguilarControlEscolar
//
//  Created by MacBookMBA17 on 09/06/23.
//

import UIKit

class AlumnoMateriaGetAllController: UIViewController {
    
    var alumnos : [Alumno] = []
    var IdAlumno : Int = 0


    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        tableViewOutlet.register(UINib(nibName: "AlumnoCell", bundle: .main), forCellReuseIdentifier: "AlumnoCell")

        
    }
}


//MARK: table view

extension AlumnoMateriaGetAllController : UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.alumnos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlumnoCell", for: indexPath) as! AlumnoCell
        
        
        cell.lblNombreOutlet.text = ("Nobmre:  \(alumnos[indexPath.row].Nombre)")
        cell.lblApellidoPaternoOutlet.text = ("Apellido Paterno:   \(alumnos[indexPath.row].ApellidoPaterno)")
        cell.lblApellidoMaternoOutlet.text = ("Apellido Materno:   \(alumnos[indexPath.row].ApellidoMaterno)")
        cell.lblFechaNacimientoOutlet.text = ("Fecha Nacimiento:   \(alumnos[indexPath.row].FechaNacimiento!)")
        cell.lblTelefonoOutlet.text = ("Telefono:   \(alumnos[indexPath.row].Telefono)")
        cell.lblGeneroOutlet.text = ("Genero:   \(alumnos[indexPath.row].Genero)")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //IdAlumno = alumnos[indexPath.row].IdAlumno
        //self.IdAlumno = self.alumnos[indexPath.row].IdAlumno
        
        self.IdAlumno = self.alumnos[indexPath.row].IdAlumno!
        self.performSegue(withIdentifier: "alumnomateria", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue , sender : Any?)
    {
        if segue.identifier == "alumnomateria"
        {
            let formControl = segue.destination as!  AlumnoMateriaController
            formControl.IdAlumno  = self.IdAlumno
        }
    }
    
    func updateUI(){
        AlumnoViewModel.Get{result, error in
            if let resultSource = result {
                DispatchQueue.main.async {
                    self.tableViewOutlet.reloadData()
                }
                if result!.Correct == true
                {
                    for objAlumno in result!.Objects!
                    {
                        let alumno = objAlumno as! Alumno
                        self.alumnos.append(alumno)
                        
                    }
                    DispatchQueue.main.async {
                        self.tableViewOutlet.reloadData()
                    }
                }
            }
        }
    }
    
}

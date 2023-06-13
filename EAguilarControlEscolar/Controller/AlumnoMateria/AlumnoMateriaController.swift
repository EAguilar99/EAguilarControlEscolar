//
//  AlumnoMateriaController.swift
//  EAguilarControlEscolar
//
//  Created by MacBookMBA17 on 12/06/23.
//

import UIKit
import SwipeCellKit

class AlumnoMateriaController: UIViewController {
    var IdMateria : Int = 0
    var IdAlumno  : Int = 0
    var IdAlumnoMAteria : Int = 0
    
    var alumnoMateria : [AlumnoMateria] = []
    
    @IBOutlet weak var lblInformacionAlumnoOutlet: UILabel!
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        tableViewOutlet.register(UINib(nibName: "MateriaCell", bundle: .main), forCellReuseIdentifier: "MateriaCell")

    }
}

extension AlumnoMateriaController : UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.alumnoMateria.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MateriaCell", for: indexPath) as! MateriaCell
        
        cell.lblNombreOutlet.text = alumnoMateria[indexPath.row].Materia!.Nombre
        return cell
    }
    
    
    func updateUI(){
        AlumnoMateriaViewModel.Get(IdAlumno: IdAlumno){result, error in
            if let resultSource = result {
                DispatchQueue.main.async {
                    self.tableViewOutlet.reloadData()
                }
                if result!.Correct == true
                {
                    for objAlumnoMateria in result!.Objects!
                    {
                        let alumnomateria = objAlumnoMateria as! AlumnoMateria
                        self.alumnoMateria.append(alumnomateria)
                        
                    }
                    DispatchQueue.main.async {
                        self.tableViewOutlet.reloadData()
                    }
                }
            }
        }  
    }
}



//MARK: swipe cell

extension AlumnoMateriaController : SwipeTableViewCellDelegate
{
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeCellKit.SwipeActionsOrientation) -> [SwipeCellKit.SwipeAction]? {
        if orientation == .right
        {
            let deleteAction = SwipeAction(style: .destructive, title: "Delete")
            {
                action, indexPath in
                print(indexPath.row)
                
                print("Se ejecuto la funcion de borrar")
                //CODIGO A EJECUTAR
                //MateriaViewModel.Delete(idMateria: self.IdMateria)
                AlumnoMateriaViewMode
                
                //MateriaViewModel.Delete(idMateria: self.materias[indexPath.row].IdMateria!)
                self.updateUI()
                
            }
            return [deleteAction]
        }
        return nil
        
    }
}


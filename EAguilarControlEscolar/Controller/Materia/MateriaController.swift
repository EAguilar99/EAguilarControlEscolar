//
//  MateriaController.swift
//  EAguilarControlEscolar
//
//  Created by MacBookMBA17 on 08/06/23.
//

import UIKit
import SwipeCellKit

class MateriaController: UIViewController{
    
    var IdMateria : Int  = 0
    
    var materias : [Materia] = []
    
    @IBOutlet weak var TableViewControllerOutlet: UITableView!
    
   override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //updateUI()
        
        TableViewControllerOutlet.delegate = self
        TableViewControllerOutlet.dataSource = self
        TableViewControllerOutlet.register(UINib(nibName: "MateriaCell", bundle: .main), forCellReuseIdentifier: "MateriaCell")
        
    }
}

//MARK: table view

extension MateriaController  : UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.materias.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MateriaCell", for: indexPath) as! MateriaCell
        
        cell.delegate = self
        
        cell.lblNombreOutlet.text = materias[indexPath.row].Nombre
        cell.lblCostoOultet.text = String(materias[indexPath.row].Costo!)
        
        print("el index actual es \(indexPath.row)")
        
        return cell
    }
}




//MARK: swipecell

extension MateriaController : SwipeTableViewCellDelegate
{
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
                //MateriaViewModel.Delete(idMateria: self.IdMateria)
                
                MateriaViewModel.Delete(idMateria: self.materias[indexPath.row].IdMateria!)
                self.updateUI()
                
            }
            return [deleteAction]
        }
        if orientation == .left {
            let updateAction = SwipeAction(style: .default, title: "Update") { action, indexPath in
                
                self.IdMateria = self.materias[indexPath.row].IdMateria!
                self.performSegue(withIdentifier: "FormMateriaController", sender: self)
                
                print("Se ejecuto la funcion de update")
                //CODIGO A EJECUTAR
                //
            }
            return [updateAction]
        }
        return nil
    }
    
    
    func updateUI()
    {
        MateriaViewModel.Get{result, error in
            if let resultSource = result{
                DispatchQueue.main.async {
                    self.TableViewControllerOutlet.reloadData()
                }
                if result!.Correct == true
                {
                    for objMateria in result!.Objects!
                    {
                        let materia = objMateria as! Materia
                        self.materias.append(materia)
                    }
                    DispatchQueue.main.async {
                        self.TableViewControllerOutlet.reloadData()
                    }
                }
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue , sender : Any?)
    {
        
        if segue.identifier == "FormMateriaController"
        {
            let formControl = segue.destination as!  FromMateriaController
            formControl.IdMateria  = self.IdMateria
        }
    }
    
    
}


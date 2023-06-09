//
//  MateriaController.swift
//  EAguilarControlEscolar
//
//  Created by MacBookMBA17 on 08/06/23.
//

import UIKit
import SwipeCellKit

class MateriaController: UIViewController{
    
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
        
        cell.lblNombreOutlet.text = materias[indexPath.row].Nombre
        cell.lblCostoOultet.text = String(materias[indexPath.row].Costo!)
        
        print("el index actual es \(indexPath.row)")
        
        return cell
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
    
}

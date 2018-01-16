//
//  VTEStateController.swift
//  Spin
//
//  Created by Mohamed Salah on 1/28/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit
//SubtitleCell
class VTEStateController  {
    //MARK:- variables 
    static var total : Int = 0
    static var calcType : VTETypes = .antenatal
    static var reloadTotal: Bool = false
    
    let vteTerms : VTETerms = VTETerms()
    var calcDelegate : CalculateDelegate!
    
    //MARK:- init 
    init(delegate : CalculateDelegate) {
        calcDelegate = delegate
    }
    
    func reloadData() {
        for term in vteTerms.terms {
            term.selected = false
        }
        
        VTEStateController.total = 0
        VTEStateController.reloadTotal = true
    }

    //MARK:- Cell Creation
    func createCell(tableView: UITableView, indexPath : IndexPath) -> UITableViewCell {
        if indexPath.row < vteTerms.terms.count {
            //regular cell
            return createRegularCell(tableView: tableView, indexPath: indexPath)
        } else if indexPath.row == vteTerms.terms.count {
            //total cell
            return createTotalCell(tableView: tableView, indexPath: indexPath)
        } else {
            //calc buttons cell
            return createButtonsCell(tableView: tableView, indexPath: indexPath)
        }
    }
    
    private func createRegularCell (tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalcTermTableViewCell", for: indexPath) as! CalcTermTableViewCell
        
        cell.item = self.vteTerms.terms[indexPath.row]
        
        cell.labelTerm.text = self.vteTerms.terms[indexPath.row].term
        cell.imageTerm.image = UIImage(named: self.vteTerms.terms[indexPath.row].termImage)
        cell.layer.cornerRadius = 1.0
        cell.btnCheckbox.layer.borderWidth = 4.0
        cell.btnCheckbox.layer.borderColor = cell.item.color.cgColor
        
        cell.parentTable = tableView
        cell.setButtonImage()
        
        if indexPath.row == 0 {
            cell.headerHeight.constant = cell.defualtHeaderHeight
            cell.headerLabelTwo.text = "Pre-existing risk factors"
            
        } else if indexPath.row == 12 {
            cell.headerHeight.constant = cell.defualtHeaderHeight
            cell.headerLabelTwo.text = "Obstetric risk factors"
            
        } else if indexPath.row == 22 {
            cell.headerHeight.constant = cell.defualtHeaderHeight
            cell.headerLabelTwo.text = "Transient risk factors"
            
        } else {
            cell.headerHeight.constant = 0.0
        }
        
        return cell
    }
    
    private func createTotalCell (tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TotalTableViewCell", for: indexPath) as! TotalTableViewCell
        
        if VTEStateController.reloadTotal {
            cell.labelTotal.text = "\(VTEStateController.total)"
            VTEStateController.reloadTotal = false
        }
        
        return cell
    }
    
    private func createButtonsCell (tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalcButtonsTableViewCell", for: indexPath) as! CalcButtonsTableViewCell
        
        cell.delegate = calcDelegate
        return cell
    }
}

//
//  ListDetailViewController.swift
//  Checklists
//
//  Created by Joseph Goldberg on 8/19/18.
//  Copyright © 2018 Joseph Goldberg. All rights reserved.
//

import Foundation
import UIKit

protocol ListDetailViewControllerDelegate: class {
    func listDetailViewControllerDidCancel(_ controller: ListDetailViewController)
    func listDetailViewController(_ controller: ListDetailViewController, didFinishAdding checklist: Checklist)
    func listDetailViewController(_ controller: ListDetailViewController, didFinisheEditing checklist: Checklist)
}

class ListDetailViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: ListDetailViewControllerDelegate?
    var checklistToEdit: Checklist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        if let checklist = checklistToEdit {
            title = "Edit Checklist"
            textField.text = checklist.name
            doneBarButton.isEnabled = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    // MARK: - Actions
    @IBAction func cancel() {
        delegate?.listDetailViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        if let checklist = checklistToEdit {
            if let text = textField.text {
                checklist.name = text
            }
            delegate?.listDetailViewController(self, didFinisheEditing: checklist)
        } else {
            if let text = textField.text {
                let checklist = Checklist(name: text)
                delegate?.listDetailViewController(self, didFinishAdding: checklist)
            } else {
                let checklist = Checklist(name: "Unnamed Checklist")
                delegate?.listDetailViewController(self, didFinishAdding: checklist)
            }
        }
    }
    
    // MARK: - TableView Delegates
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    // MARK: - UITextField Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let oldText = textField.text, let stringRange = Range(range, in:oldText) {
            let newText = oldText.replacingCharacters(in: stringRange, with: string)
            doneBarButton.isEnabled = !newText.isEmpty
            return true
        } else {
            return false
        }
    }
    
}

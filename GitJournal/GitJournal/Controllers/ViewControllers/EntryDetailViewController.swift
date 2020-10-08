//
//  EntryDetailViewController.swift
//  GitJournal
//
//  Created by Maxwell Poffenbarger on 10/8/20.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextField!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Properties
    var entry: Entry? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let entryTitle = titleTextField.text, let entryBody = bodyTextView.text else {return}
        if let entry = entry {
            EntryController.sharedInstance.update(entry: entry, title: entryTitle, text: entryBody)
        } else {
            EntryController.sharedInstance.addEntryWith(title: entryTitle, text: entryBody)
        }
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
    }
    
    func updateViews() {
        loadViewIfNeeded()
        if let storedEntry = entry {
            titleTextField.text = storedEntry.title
            bodyTextView.text = storedEntry.text
        }
    }
}//End of class

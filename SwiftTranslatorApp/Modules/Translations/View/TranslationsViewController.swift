//
//  TranslationsTranslationsViewController.swift
//  SwiftTranslatorApp
//
//  Created by Kate Systerova on 26/01/2019.
//  Copyright © 2019 katesysterova. All rights reserved.
//

import UIKit

class TranslationsViewController: UIViewController, TranslationsViewInput, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pickerBarButton: UIBarButtonItem!
    
    var data: [Word] = [Word]()

    var output: TranslationsViewOutput!
    let configurator: TranslationsModuleConfigurator = TranslationsModuleConfigurator()

    let selfToLanguagesSegueName = "MainToLanguagesSegue"

    // MARK: Life cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configurator.configureModuleForViewInput(viewInput: self)
        output.viewIsReady()
    }

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        output.reloadBarButtonTitle()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadBarButton), name: Notification.Name.currentLanguageChanged, object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: TranslationsViewInput
    func setupInitialState() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.white
        self.tableView.tableFooterView = UIView(frame: CGRect.zero);
        
        self.textField.delegate = self
        self.searchBar.delegate = self
    }
    
    func setList(of words: [Word]) {
        
        self.data = words
        self.tableView.reloadData()
    }
    
    func setBarButtonTitle(with text: String) {
        
        self.pickerBarButton.title = String("На \(text)")
    }
    
    
    // MARK: TranslationsViewOutput

    @IBAction func translate(_ sender: UIButton) {
        
        self.textField.resignFirstResponder()
        self.searchBar.resignFirstResponder()
        self.searchBar.text = ""
        
        if  let word = self.textField.text {
            output.translate(word: word)
        }
    }
    
    @IBAction func showList(_ sender: UIBarButtonItem) {
        
        output.openLanguageList()
    }

    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TranslationCell", for: indexPath) as UITableViewCell
        
        let word = data[indexPath.row]
        
        cell.textLabel?.text = word.nativeWord
        cell.detailTextLabel?.text = word.translatedWord
        cell.textLabel?.textColor = UIColor.black
        cell.detailTextLabel?.textColor = UIColor.black
        cell.backgroundColor = UIColor.white
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.detailTextLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.numberOfLines = 0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            let word = data[indexPath.row]
            output.remove(word: word)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }

    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    // MARK: UITextFieldDelegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
        self.textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    
        self.textField.endEditing(true)
        return true
    }

    
    // MARK: UISearchBarDelegate

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            output.showAllWords()
        } else {
            output.filterWords(by: searchText)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        self.searchBar.resignFirstResponder()
        if let searchText = self.searchBar.text {
            output.filterWords(by: searchText)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        self.searchBar.resignFirstResponder()
        self.searchBar.text = ""
        output.showAllWords()
    }

    // MARK: Actions
    
    @objc func keyboardDidShow(_ notification: Notification) {
        
        self.adjustKeyboardShow(true, notification: notification)
    }
    
    @objc func keyboardDidHide(_ notification: Notification) {

        self.adjustKeyboardShow(false, notification: notification)
    }

    @objc func reloadBarButton() {
        
        output.reloadBarButtonTitle()
    }

    func adjustKeyboardShow(_ open: Bool, notification: Notification) {
        
        let userInfo = notification.userInfo ?? [:]
        let keyboardFrame = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let height = (keyboardFrame.height + 20) * (open ? 1 : -1)
        self.tableView.contentInset.bottom += height
        self.tableView.scrollIndicatorInsets.bottom += height
    }
}

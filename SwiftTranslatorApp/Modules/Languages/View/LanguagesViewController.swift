//
//  LanguagesLanguagesViewController.swift
//  SwiftTranslatorApp
//
//  Created by Kate Systerova on 26/01/2019.
//  Copyright © 2019 katesysterova. All rights reserved.
//

import UIKit

class LanguagesViewController: UIViewController, LanguagesViewInput, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var data: [Language] = [Language]()
    
    var output: LanguagesViewOutput!
    let configurator: LanguagesModuleConfigurator = LanguagesModuleConfigurator()

    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configureModuleForViewInput(viewInput: self)
        output.viewIsReady()
        
    }

    
    // MARK: LanguagesViewInput
    func setupInitialState() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = UIColor.white
        
    }
    
    func setList(of languages: [Language]) {
        
        self.data = languages
        self.tableView.reloadData()
    }
    
    
    // MARK: LanguagesViewOutput

    @IBAction func done(_ sender: UIBarButtonItem) {
        output.closeButtonClicked()
    }
    
    
    // MARK: UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageCell", for: indexPath)
        
        let language = data[indexPath.row]
        cell.textLabel?.text = language.name
        cell.textLabel?.textColor = UIColor.black;
        cell.backgroundColor = UIColor.white;
        cell.selectionStyle = UITableViewCell.SelectionStyle.none;
        
        if language.isCurrent {
            cell.backgroundColor = UIColor.orange;
            cell.textLabel?.textColor = UIColor.white;
        }
        
        return cell
    }
    
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let object = data[indexPath.row]
        output.languagePicked(with: object)
        tableView.reloadData()
    }

    
}

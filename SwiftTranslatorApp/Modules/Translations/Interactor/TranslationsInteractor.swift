//
//  TranslationsTranslationsInteractor.swift
//  SwiftTranslatorApp
//
//  Created by Kate Systerova on 26/01/2019.
//  Copyright © 2019 katesysterova. All rights reserved.
//

class TranslationsInteractor: TranslationsInteractorInput {

    weak var output: TranslationsInteractorOutput!

    func translateWord(with nativeText: String) {
        
        DataService.sharedInstance.createWord(nativeWord: nativeText)
        output.showList(of: DataService.sharedInstance.getAllWords())
        
        TranslationService.sharedInstance.translation(nativeWord: nativeText) { (success, error) in
            
            self.output.showList(of: DataService.sharedInstance.getAllWords())
        }
    }
    
    func remove(_ word: Word) {
        
        DataService.sharedInstance.removeWord(object: word)
        output.showList(of: DataService.sharedInstance.getAllWords())
    }
    
    func getAllWords() {
        
        output.showList(of: DataService.sharedInstance.getAllWords())
    }
    
    func getAllWords(with searchText: String) {
        
        output.showList(of: DataService.sharedInstance.getAllWords(searchText: searchText))
    }
    
    func getCurrentLanguageName() -> String {
        
        return DataService.sharedInstance.getCurrentLanguage().name.lowercased()
    }
}

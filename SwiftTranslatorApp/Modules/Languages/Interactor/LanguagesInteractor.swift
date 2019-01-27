//
//  LanguagesLanguagesInteractor.swift
//  SwiftTranslatorApp
//
//  Created by Kate Systerova on 26/01/2019.
//  Copyright © 2019 katesysterova. All rights reserved.
//

class LanguagesInteractor: LanguagesInteractorInput {

    weak var output: LanguagesInteractorOutput!

    func setCurrentLanguage(with language: Language) {
        
        DataService.sharedInstance.setCurrentLanguage(newCurrentLanguage: language)
    }
    
    func getAllLanguages() {
        
        output.showLanguagesList(languages: DataService.sharedInstance.getAllLanguages())
        
        TranslationService.sharedInstance.updateLanguages { (success, error) in
            
            self.output.showLanguagesList(languages: DataService.sharedInstance.getAllLanguages())
        }
    }
}

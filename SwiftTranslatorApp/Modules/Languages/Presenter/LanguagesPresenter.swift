//
//  LanguagesLanguagesPresenter.swift
//  SwiftTranslatorApp
//
//  Created by Kate Systerova on 26/01/2019.
//  Copyright © 2019 katesysterova. All rights reserved.
//

class LanguagesPresenter: LanguagesModuleInput, LanguagesViewOutput, LanguagesInteractorOutput {

    weak var view: LanguagesViewInput!
    var interactor: LanguagesInteractorInput!
    var router: LanguagesRouterInput!

    func viewIsReady() {
        
        view.setupInitialState()
        interactor.getAllLanguages()
    }
    
    func showLanguagesList(languages: [Language]) {
        
        view.setList(of: languages)
    }
    
    func closeButtonClicked() {
        router.closeCurrentViewController()
    }
    
    func languagePicked(with language: Language) {
        
        interactor.setCurrentLanguage(with: language)
    }
}

//
//  TranslationsTranslationsPresenter.swift
//  SwiftTranslatorApp
//
//  Created by Kate Systerova on 26/01/2019.
//  Copyright © 2019 katesysterova. All rights reserved.
//

class TranslationsPresenter: TranslationsModuleInput, TranslationsViewOutput, TranslationsInteractorOutput {

    weak var view: TranslationsViewInput!
    var interactor: TranslationsInteractorInput!
    var router: TranslationsRouterInput!

    func viewIsReady() {
        
        view.setupInitialState()
        interactor.getAllWords()
    }
    
    func translate(word: String) {
        
        interactor.translateWord(with: word)
    }
    
    func filterWords(by searchText: String) {
        
        interactor.getAllWords(with: searchText)
    }
    
    func showAllWords() {
        
        interactor.getAllWords()
    }
    
    func remove(word: Word) {
        
        interactor.remove(word)
    }
    
    func openLanguageList() {
        
        router.showLanguageList()
    }
    
    func showList(of words: [Word]) {
        
        view.setList(of: words)
    }
    
    func reloadBarButtonTitle() {
        
        view.setBarButtonTitle(with: interactor.getCurrentLanguageName())
    }
}

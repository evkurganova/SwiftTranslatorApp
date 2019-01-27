//
//  TranslationsTranslationsViewOutput.swift
//  SwiftTranslatorApp
//
//  Created by Kate Systerova on 26/01/2019.
//  Copyright © 2019 katesysterova. All rights reserved.
//

protocol TranslationsViewOutput {

    /**
        @author Kate Systerova
        Notify presenter that view is ready
    */

    func viewIsReady()
    func translate(word: String)
    func filterWords(by searchText: String)
    func showAllWords()
    func remove(word: Word)
    func openLanguageList()
    func reloadBarButtonTitle()

}

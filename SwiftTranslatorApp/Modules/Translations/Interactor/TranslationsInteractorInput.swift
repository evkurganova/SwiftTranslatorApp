//
//  TranslationsTranslationsInteractorInput.swift
//  SwiftTranslatorApp
//
//  Created by Kate Systerova on 26/01/2019.
//  Copyright © 2019 katesysterova. All rights reserved.
//

import Foundation

protocol TranslationsInteractorInput {

    func translateWord(with nativeText: String)
    func remove(_ word: Word)
    func getAllWords()
    func getAllWords(with searchText: String)
    func getCurrentLanguageName() -> String

}

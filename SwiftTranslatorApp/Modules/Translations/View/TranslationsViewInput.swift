//
//  TranslationsTranslationsViewInput.swift
//  SwiftTranslatorApp
//
//  Created by Kate Systerova on 26/01/2019.
//  Copyright © 2019 katesysterova. All rights reserved.
//

protocol TranslationsViewInput: class {

    /**
        @author Kate Systerova
        Setup initial state of the view
    */

    func setupInitialState()
    func setList(of words: [Word])
    func setBarButtonTitle(with text:String)
}

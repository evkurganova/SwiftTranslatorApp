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

    }
}

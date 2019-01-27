//
//  TranslationsTranslationsRouter.swift
//  SwiftTranslatorApp
//
//  Created by Kate Systerova on 26/01/2019.
//  Copyright © 2019 katesysterova. All rights reserved.
//

class TranslationsRouter: TranslationsRouterInput {

    weak var viewController: TranslationsViewController!

    func showLanguageList() {
        viewController.performSegue(withIdentifier: viewController.selfToLanguagesSegueName, sender: nil)
    }

}

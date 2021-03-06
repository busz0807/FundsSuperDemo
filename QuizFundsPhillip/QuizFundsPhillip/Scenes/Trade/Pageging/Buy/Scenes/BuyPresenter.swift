//
//  BuyPresenter.swift
//  QuizFundsPhillip
//
//  Created by BUSSNQ TH on 8/2/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol BuyPresentationLogic {
    func presentdomoney(response: Buy.FetchMoneyData.Response)
}

class BuyPresenter: BuyPresentationLogic {
   
    
  weak var viewController: BuyDisplayLogic?
  
  // MARK: Do something
    func presentdomoney(response: Buy.FetchMoneyData.Response) {
        let viewModel =  Buy.FetchMoneyData.ViewModel(money: response.money)
        viewController?.displaymoneyfunds(viewModel: viewModel)
    }
}

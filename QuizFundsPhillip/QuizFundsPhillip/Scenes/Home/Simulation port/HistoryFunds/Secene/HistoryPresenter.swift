//
//  HistoryPresenter.swift
//  QuizFundsPhillip
//
//  Created by BUSSNQ TH on 16/3/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HistoryPresentationLogic
{
  func presentSomething(response: History.Something.Response)
}

class HistoryPresenter: HistoryPresentationLogic
{
  weak var viewController: HistoryDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: History.Something.Response)
  {
    let viewModel = History.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
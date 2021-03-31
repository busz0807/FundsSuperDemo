//
//  CalendarPresenter.swift
//  QuizFundsPhillip
//
//  Created by BUSSNQ TH on 16/2/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CalendarPresentationLogic {
  func presentSomething(response: Calendar.Something.Response)
}

class CalendarPresenter: CalendarPresentationLogic {
  weak var viewController: CalendarDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Calendar.Something.Response) {
    let viewModel = Calendar.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
//
//  SecondSearchInteractor.swift
//  QuizFundsPhillip
//
//  Created by BUSSNQ TH on 19/2/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SecondSearchBusinessLogic {
  func doSomething(request: SecondSearch.Something.Request)
}

protocol SecondSearchDataStore {
  var searchfunds: ReealmFundsListMobile? { get set }
}

class SecondSearchInteractor: SecondSearchBusinessLogic, SecondSearchDataStore {
  var presenter: SecondSearchPresentationLogic?
  var worker: SecondSearchWorker?
    var searchfunds: ReealmFundsListMobile?
 
  // MARK: Do something
  
  func doSomething(request: SecondSearch.Something.Request) {
    worker = SecondSearchWorker()
    worker?.doSomeWork()
    
    let response = SecondSearch.Something.Response(searchfunds: searchfunds)
//        print("Data", response.fundsList?._change ?? "")
    presenter?.presentSomething(response: response)
  }
}

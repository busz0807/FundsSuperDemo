//
//  SaveBuySellInteractor.swift
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

protocol SaveBuySellBusinessLogic
{
  func doSomething(request: SaveBuySell.Something.Request)
}

protocol SaveBuySellDataStore
{
  //var name: String { get set }
}

class SaveBuySellInteractor: SaveBuySellBusinessLogic, SaveBuySellDataStore
{
  var presenter: SaveBuySellPresentationLogic?
  var worker: SaveBuySellWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: SaveBuySell.Something.Request)
  {
    worker = SaveBuySellWorker()
    worker?.doSomeWork()
    
    let response = SaveBuySell.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
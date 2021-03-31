//
//  AddSimulationPortInteractor.swift
//  QuizFundsPhillip
//
//  Created by BUSSNQ TH on 9/3/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol AddSimulationPortBusinessLogic
{
  func doSomething(request: AddSimulationPort.Something.Request)
}

protocol AddSimulationPortDataStore
{
    var searchfunds: ReealmFundsListMobile? { get set }
}

class AddSimulationPortInteractor: AddSimulationPortBusinessLogic, AddSimulationPortDataStore
{
    var searchfunds: ReealmFundsListMobile?
  var presenter: AddSimulationPortPresentationLogic?
  var worker: AddSimulationPortWorker?
  //var name: String = ""
  
  // MARK: Do something
  
    func doSomething(request: AddSimulationPort.Something.Request) {
      worker = AddSimulationPortWorker()
      worker?.doSomeWork()
      
      let response = AddSimulationPort.Something.Response(searchfunds: searchfunds)
  //        print("Data", response.fundsList?._change ?? "")
      presenter?.presentSomething(response: response)
    }
}
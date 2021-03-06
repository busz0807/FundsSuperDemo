//
//  PaymentInteractor.swift
//  QuizFundsPhillip
//
//  Created by BUSSNQ TH on 18/2/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol PaymentBusinessLogic
{
  func doSomething(request: Payment.Something.Request)
}

protocol PaymentDataStore
{
  var picefunds: String { get set }
    var enName: String { get set }
    var thName: String { get set }
    var risk: String { get set }
    var date: String { get set }
}

class PaymentInteractor: PaymentBusinessLogic, PaymentDataStore
{
  var presenter: PaymentPresentationLogic?
  var worker: PaymentWorker?
    var picefunds: String = ""
    
    var   enName:  String = ""
    var   thName: String = ""
    var  risk:  String = ""
    var  date:  String = ""
  // MARK: Do something
  
  func doSomething(request: Payment.Something.Request)
  {
    worker = PaymentWorker()
    worker?.doSomeWork()
    
    let response = Payment.Something.Response(picefunds: picefunds,enName: enName, thName: thName, risk: risk, date: date)
    presenter?.presentSomething(response: response)
  }
}

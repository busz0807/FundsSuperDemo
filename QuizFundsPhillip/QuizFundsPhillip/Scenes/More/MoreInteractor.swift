//
//  MoreInteractor.swift
//  QuizFundsPhillip
//
//  Created by BUSSNQ TH on 28/1/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MoreBusinessLogic
{
  func doSomething(request: More.FetchAnalystReportDataStore.Request)
}

protocol MoreDataStore
{
  //var name: String { get set }
}

class MoreInteractor: MoreBusinessLogic, MoreDataStore
{
  var presenter: MorePresentationLogic?
  var worker: MoreWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: More.FetchAnalystReportDataStore.Request) {
    let nameFunds = request.nameAnalystReport
    worker = MoreWorker()
    worker?.doFetchAnalystReport(nameFunds: nameFunds) { (analystReport ,error )in
        if error != nil {
        let response = More.FetchAnalystReportDataStore.Response(analystReportData: nil, error: error)
        self.presenter?.presentSomething(response: response)
        return
    }
    
    let response = More.FetchAnalystReportDataStore.Response(analystReportData: analystReport, error: nil)
    self.presenter?.presentSomething(response: response)
}

}
}

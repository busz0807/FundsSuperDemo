//
//  TradePresenter.swift
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

protocol TradePresentationLogic
{
  func presentSomething(response: Trade.Something.Response)
}

class TradePresenter: TradePresentationLogic
{
  weak var viewController: TradeDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Trade.Something.Response)
  {


}
}

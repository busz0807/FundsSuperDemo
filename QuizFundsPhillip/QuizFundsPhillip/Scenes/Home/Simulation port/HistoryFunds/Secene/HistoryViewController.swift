//
//  HistoryViewController.swift
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
import Parchment
protocol HistoryDisplayLogic: class
{
  func displaySomething(viewModel: History.Something.ViewModel)
}

class HistoryViewController: UIViewController, HistoryDisplayLogic
{
    @IBOutlet weak var viewPaging: UIView!
    var interactor: HistoryBusinessLogic?
  var router: (NSObjectProtocol & HistoryRoutingLogic & HistoryDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = HistoryInteractor()
    let presenter = HistoryPresenter()
    let router = HistoryRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
    
    
    // MARK:Pagging
 
    
    let saveBuySell  = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SaveBuySellViewController") as! SaveBuySellViewController
    let saveDividend = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SaveDividendViewController") as! SaveDividendViewController
            let viewControllers = [
    
                saveBuySell,
                saveDividend
            ]
            
            let pagingViewController = PagingViewController(viewControllers: viewControllers)
            
            // Make sure you add the PagingViewController as a child view
            // controller and constrain it to the edges of the view.
            addChild(pagingViewController)
        self.viewPaging.addSubview(pagingViewController.view)
   
      //      view.constrainToEdges(pagingViewController.view)
             pagingViewController.didMove(toParent: self)
        pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pagingViewController.view.topAnchor.constraint(equalTo: self.viewPaging.topAnchor),
              pagingViewController.view.bottomAnchor.constraint(equalTo: self.viewPaging.bottomAnchor),
              pagingViewController.view.leadingAnchor.constraint(equalTo: self.viewPaging.leadingAnchor),
              pagingViewController.view.trailingAnchor.constraint(equalTo: self.viewPaging.trailingAnchor),
        ])
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = History.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: History.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}

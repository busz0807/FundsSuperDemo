//
//  BuyAndSaleViewController.swift
//  QuizFundsPhillip
//
//  Created by BUSSNQ TH on 15/3/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol BuyAndSaleDisplayLogic: class
{
  func displaySomething(viewModel: BuyAndSale.Something.ViewModel)
}

class BuyAndSaleViewController: UIViewController, BuyAndSaleDisplayLogic
{
    @available(iOS 14.0, *)
    @IBAction func btnChangeColorstar(_ sender: Any) {
       
      
        if self.setbtnstar.tintColor?.accessibilityName == "white" {
            let image = UIImage(named: "star")
            let tintImage = image?.withRenderingMode(.alwaysTemplate)
            setbtnstar.setImage(tintImage, for: .normal)
            setbtnstar.tintColor = .systemYellow
         
        } else if self.setbtnstar.tintColor?.accessibilityName == "vibrant yellow" {
            self.setbtnstar.tintColor = .white
            let image = UIImage(named: "unstar")
            let tintImage = image?.withRenderingMode(.alwaysTemplate)
            setbtnstar.setImage(tintImage, for: .normal)
            self.setbtnstar.tintColor = .white
        }
    }
    @IBAction func btnback(_ sender: Any) {
    }
    @IBAction func btngoToRisk(_ sender: Any) {
    }
    @IBAction func btngotoDelete(_ sender: Any) {
        
    }
    @IBAction func btngoToHistory(_ sender: Any) {
        
    }
    @IBOutlet weak var lbcost: UILabel!
    @IBOutlet weak var lbvalue: UILabel!
    @IBOutlet weak var setbtnstar: UIButton!
    @IBOutlet weak var setviewfund: UIView!
    @IBOutlet weak var setviewbuy: UIView!
    @IBOutlet weak var setviewsell: UIView!
    @IBOutlet weak var setviewbuy1: UIView!
    @IBOutlet weak var setviewsell1: UIView!
    @IBOutlet weak var setview1m: UIView!
    @IBOutlet weak var setview3m: UIView!
    @IBOutlet weak var setview6m: UIView!
    @IBOutlet weak var setview1y: UIView!
    @IBOutlet weak var setview3y: UIView!
    @IBOutlet weak var setview5y: UIView!
    @IBOutlet weak var setbtn1m: UIButton!
    @IBOutlet weak var setbtn3m: UIButton!
    @IBOutlet weak var setbtn6m: UIButton!
    @IBOutlet weak var setbtn1y: UIButton!
    @IBOutlet weak var setbtn3y: UIButton!
    @IBOutlet weak var setbtn5y: UIButton!
    @available(iOS 14.0, *)
    @IBAction func btbActionValue(_ sender: Any) {
      
        if  self.lbvalue.textColor.accessibilityName == "green" {
            self.lbcost.textColor = .red
            self.lbvalue.textColor = .red
            self.lbcost.text = " - 1,175.74"
            self.lbvalue.text = " -8.84%"
            self.lbcost.font = UIFont.systemFont(ofSize: 15)
            self.lbvalue.font = UIFont.systemFont(ofSize: 15)
            self.setviewfund.backgroundColor = .systemGray5
        }
      
        else if self.lbvalue.textColor.accessibilityName == "dark red" {
            self.lbcost.textColor = .green
            self.lbvalue.textColor = .green
            self.lbcost.font = UIFont.boldSystemFont(ofSize: 16.0)
            self.lbvalue.font = UIFont.boldSystemFont(ofSize: 16.0)
            self.setviewfund.backgroundColor = .systemGroupedBackground
        }else if  self.lbvalue.textColor.accessibilityName == "vibrant green" {
            self.lbcost.textColor = .red
            self.lbvalue.textColor = .red
            self.lbcost.font = UIFont.systemFont(ofSize: 15)
            self.lbvalue.font = UIFont.systemFont(ofSize: 15)
            self.setviewfund.backgroundColor = .systemGray5
        }
        print("",self.lbvalue.textColor.accessibilityName)
        
    }
    @IBAction func setbtn1m(_ sender: Any) {
        self.setview1m.clipsToBounds = true
        self.setview1m.layer.cornerRadius = 15
        self.setview1m.layer.shadowRadius = 50
        self.setview1m.layer.masksToBounds = false
        self.setview1m.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        self.setbtn1m.setTitleColor(.systemBlue, for: .normal)
        self.setbtn3m.setTitleColor(.darkGray, for: .normal)
        self.setbtn6m.setTitleColor(.darkGray, for: .normal)
        self.setbtn1y.setTitleColor(.darkGray, for: .normal)
        self.setbtn3y.setTitleColor(.darkGray, for: .normal)
        self.setbtn5y.setTitleColor(.darkGray, for: .normal)
        self.setview3m.backgroundColor = .white
        self.setview6m.backgroundColor = .white
        self.setview1y.backgroundColor = .white
        self.setview3y.backgroundColor = .white
        self.setview5y.backgroundColor = .white
    }
    @IBAction func setbtn3m(_ sender: Any) {
        self.setview3m.clipsToBounds = true
        self.setview3m.layer.cornerRadius = 15
        self.setbtn3m.setTitleColor(.darkGray, for: .normal)
        self.setview3m.layer.shadowRadius = 50
        self.setview3m.layer.masksToBounds = false
        self.setview3m.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        self.setbtn3m.setTitleColor(.systemBlue, for: .normal)
        self.setbtn1m.setTitleColor(.darkGray, for: .normal)
        self.setbtn6m.setTitleColor(.darkGray, for: .normal)
        self.setbtn1y.setTitleColor(.darkGray, for: .normal)
        self.setbtn3y.setTitleColor(.darkGray, for: .normal)
        self.setbtn5y.setTitleColor(.darkGray, for: .normal)
        self.setview1m.backgroundColor = .white
        self.setview6m.backgroundColor = .white
        self.setview1y.backgroundColor = .white
        self.setview3y.backgroundColor = .white
        self.setview5y.backgroundColor = .white
    }
    @IBAction func setbtn6m(_ sender: Any) {
        self.setview6m.clipsToBounds = true
        self.setview6m.layer.cornerRadius = 15
        self.setview6m.layer.shadowRadius = 50
        self.setview6m.layer.masksToBounds = false
        self.setview6m.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        self.setbtn1m.setTitleColor(.darkGray, for: .normal)
        self.setbtn6m.setTitleColor(.systemBlue, for: .normal)
        self.setbtn3m.setTitleColor(.darkGray, for: .normal)
        self.setbtn1m.setTitleColor(.darkGray, for: .normal)
        self.setbtn1y.setTitleColor(.darkGray, for: .normal)
        self.setbtn3y.setTitleColor(.darkGray, for: .normal)
        self.setbtn5y.setTitleColor(.darkGray, for: .normal)
        self.setview3m.backgroundColor = .white
        self.setview1m.backgroundColor = .white
        self.setview1y.backgroundColor = .white
        self.setview3y.backgroundColor = .white
        self.setview5y.backgroundColor = .white
        
    }
    @IBAction func setbtn1y(_ sender: Any) {
        self.setview1y.clipsToBounds = true
        self.setview1y.layer.cornerRadius = 15
        self.setview1y.layer.shadowRadius = 50
        self.setview1y.layer.masksToBounds = false
        self.setview1y.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        self.setbtn1y.setTitleColor(.systemBlue, for: .normal)
        self.setbtn3m.setTitleColor(.darkGray, for: .normal)
        self.setbtn6m.setTitleColor(.darkGray, for: .normal)
        self.setbtn1m.setTitleColor(.darkGray, for: .normal)
        self.setbtn3y.setTitleColor(.darkGray, for: .normal)
        self.setbtn5y.setTitleColor(.darkGray, for: .normal)
        self.setview3m.backgroundColor = .white
        self.setview6m.backgroundColor = .white
        self.setview1m.backgroundColor = .white
        self.setview3y.backgroundColor = .white
        self.setview5y.backgroundColor = .white
    }
    @IBAction func setbtn3y(_ sender: Any) {
        self.setview3y.clipsToBounds = true
        self.setview3y.layer.cornerRadius = 15
        self.setview3y.layer.shadowRadius = 50
        self.setview3y.layer.masksToBounds = false
        self.setview3y.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        self.setbtn3y.setTitleColor(.systemBlue, for: .normal)
        self.setbtn3m.setTitleColor(.darkGray, for: .normal)
        self.setbtn6m.setTitleColor(.darkGray, for: .normal)
        self.setbtn1y.setTitleColor(.darkGray, for: .normal)
        self.setbtn1m.setTitleColor(.darkGray, for: .normal)
        self.setbtn5y.setTitleColor(.darkGray, for: .normal)
        self.setview3m.backgroundColor = .white
        self.setview6m.backgroundColor = .white
        self.setview1y.backgroundColor = .white
        self.setview1m.backgroundColor = .white
        self.setview5y.backgroundColor = .white
    }
    @IBAction func setbtn5y(_ sender: Any) {
        self.setview5y.clipsToBounds = true
        self.setview5y.layer.cornerRadius = 15
        self.setview5y.layer.shadowRadius = 50
        self.setview5y.layer.masksToBounds = false
        self.setview5y.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        self.setbtn5y.setTitleColor(.systemBlue, for: .normal)
        self.setbtn3m.setTitleColor(.darkGray, for: .normal)
        self.setbtn6m.setTitleColor(.darkGray, for: .normal)
        self.setbtn1y.setTitleColor(.darkGray, for: .normal)
        self.setbtn3y.setTitleColor(.darkGray, for: .normal)
        self.setbtn1m.setTitleColor(.darkGray, for: .normal)
        self.setview3m.backgroundColor = .white
        self.setview6m.backgroundColor = .white
        self.setview1y.backgroundColor = .white
        self.setview3y.backgroundColor = .white
        self.setview1m.backgroundColor = .white
    }
    var interactor: BuyAndSaleBusinessLogic?
  var router: (NSObjectProtocol & BuyAndSaleRoutingLogic & BuyAndSaleDataPassing)?

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
    let interactor = BuyAndSaleInteractor()
    let presenter = BuyAndSalePresenter()
    let router = BuyAndSaleRouter()
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
    self.lbcost.font = UIFont.boldSystemFont(ofSize: 16.0)
    self.lbvalue.font = UIFont.boldSystemFont(ofSize: 16.0)
          self.setviewbuy.clipsToBounds = true
          self.setviewbuy.layer.cornerRadius = 5
          self.setviewbuy.layer.shadowColor = UIColor.systemGray.cgColor
          self.setviewbuy.layer.shadowOpacity = 0.5
          self.setviewbuy.layer.shadowRadius = 6
          self.setviewbuy.layer.masksToBounds = false
    
    self.setviewsell.clipsToBounds = true
    self.setviewsell.layer.cornerRadius = 5
    self.setviewsell.layer.shadowColor = UIColor.systemGray.cgColor
    self.setviewsell.layer.shadowOpacity = 0.5
    self.setviewsell.layer.shadowRadius = 6
    self.setviewsell.layer.masksToBounds = false
    
    self.setviewbuy1.clipsToBounds = true
    self.setviewbuy1.layer.cornerRadius = 5
    self.setviewbuy1.layer.shadowColor = UIColor.systemGray.cgColor
    self.setviewbuy1.layer.shadowOpacity = 0.5
    self.setviewbuy1.layer.shadowRadius = 6
    self.setviewbuy1.layer.masksToBounds = false

self.setviewsell1.clipsToBounds = true
self.setviewsell1.layer.cornerRadius = 5
self.setviewsell1.layer.shadowColor = UIColor.systemGray.cgColor
self.setviewsell1.layer.shadowOpacity = 0.5
self.setviewsell1.layer.shadowRadius = 6
self.setviewsell1.layer.masksToBounds = false
    
    self.setviewfund.clipsToBounds = true
    self.setviewfund.layer.cornerRadius = 5
    self.setviewfund.layer.shadowColor = UIColor.systemGray.cgColor
    self.setviewfund.layer.shadowOpacity = 0.5
    self.setviewfund.layer.shadowRadius = 6
    self.setviewfund.layer.masksToBounds = false
    
    self.setview1m.clipsToBounds = true
    self.setview1m.layer.cornerRadius = 15
//    self.setView.layer.shadowOpacity = 0.3
    self.setview1m.layer.shadowRadius = 50
    self.setview1m.layer.masksToBounds = false
    self.setview1m.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = BuyAndSale.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: BuyAndSale.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}

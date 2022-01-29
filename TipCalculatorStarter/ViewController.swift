//
//  ViewController.swift
//  TipCalculatorStarter
//
//  Created by Michelle K on 1/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties

      // keeps bool of whether to show dark or light status bar
      var isDefaultStatusBar = true

      // override the preferredStatusBarStyle (this is inherited from superclass)
    // use isDefaultStatusBar (var we create to keep track) to set view controller's status bar
      override var preferredStatusBarStyle: UIStatusBarStyle {
          return isDefaultStatusBar ? .default : .lightContent
      }
    // variables!! //
    
    // variables for header
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var themeSwitch: UISwitch!
    
    // variables for input card
    
    @IBOutlet weak var inputCardView: UIView!
    @IBOutlet weak var billAmountTextField: BillAmountTextField!
    @IBOutlet weak var tipPercentSegmentedControl: UISegmentedControl!
    
    // variables for output card
    
    @IBOutlet weak var outputCardView: UIView!
    @IBOutlet weak var tipAmountTitleLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountTitleLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    // variable for button
    @IBOutlet weak var resetButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setTheme(isDark: false)

           billAmountTextField.calculateButtonAction = {
               self.calculate()
           }
        
        
    }
    
    // functions !! //
    
    func calculate() {
        // dismiss keyboard
        if self.billAmountTextField.isFirstResponder {
            self.billAmountTextField.resignFirstResponder()
        }
        
        

        guard let billAmountText = self.billAmountTextField.text,
            let billAmount = Double(billAmountText) else {
                clear()
                return
        }

        let roundedBillAmount = (100 * billAmount).rounded() / 100

        let tipPercent: Double
            switch tipPercentSegmentedControl.selectedSegmentIndex {
            case 0:
                tipPercent = 0.15
            case 1:
                tipPercent = 0.18
            case 2:
                tipPercent = 0.20
            default:
                preconditionFailure("Unexpected index.")
            }
        
        let tipAmount = roundedBillAmount * tipPercent
        let roundedTipAmount = (100 * tipAmount).rounded() / 100

        let totalAmount = roundedBillAmount + roundedTipAmount

        // Update UI
        self.billAmountTextField.text = String(format: "%.2f", roundedBillAmount)
        self.tipAmountLabel.text = String(format: "%.2f", roundedTipAmount)
        self.totalAmountLabel.text = String(format: "%.2f", totalAmount)
    }
    
    //reset
    
    func clear() {
        billAmountTextField.text = nil
        tipPercentSegmentedControl.selectedSegmentIndex = 0
        tipAmountLabel.text = "$0.00"
        totalAmountLabel.text = "$0.00"
    }
    
    // UIView object has property of type CALayer
    // configuring layer can do more things with the UI!
    
    func setupViews() {
        
        // header shadow
        
        headerView.layer.shadowOffset = CGSize(width: 0, height: 1)
            headerView.layer.shadowOpacity = 0.05
            headerView.layer.shadowColor = UIColor.black.cgColor
            headerView.layer.shadowRadius = 35
        
        //input card rounded corners
        
        inputCardView.layer.cornerRadius = 8
        inputCardView.layer.masksToBounds = true
        
        //output card
        
        //rounded corners
        
        outputCardView.layer.cornerRadius = 8
        outputCardView.layer.masksToBounds = true
        
        //adding a hot pink border
        
        outputCardView.layer.borderWidth = 1
        outputCardView.layer.borderColor = UIColor.tcHotPink.cgColor
        
        //reset button rounded corners
        resetButton.layer.cornerRadius = 8
        resetButton.layer.masksToBounds = true
    }
    
    func setTheme(isDark: Bool) {
        let theme = isDark ? ColourTheme.dark : ColourTheme.light

          view.backgroundColor = theme.viewControllerBackgroundColor

          headerView.backgroundColor = theme.primaryColor
          titleLabel.textColor = theme.primaryTextColor

          inputCardView.backgroundColor = theme.secondaryColor

          billAmountTextField.tintColor = theme.accentColor
          tipPercentSegmentedControl.tintColor = theme.accentColor

          outputCardView.backgroundColor = theme.primaryColor
          outputCardView.layer.borderColor = theme.accentColor.cgColor

          tipAmountTitleLabel.textColor = theme.primaryTextColor
          totalAmountTitleLabel.textColor = theme.primaryTextColor

          tipAmountLabel.textColor = theme.outputTextColor
          totalAmountLabel.textColor = theme.outputTextColor

          resetButton.backgroundColor = theme.secondaryColor
        
        isDefaultStatusBar = theme.isDefaultStatusBar
           setNeedsStatusBarAppearanceUpdate()
    }
    
    @IBAction func tipPercentChanged(_ sender: UISegmentedControl) {
        calculate()
     }
     
    @IBAction func themeToggled(_ sender: UISwitch) {
        setTheme(isDark: sender.isOn)
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        clear()
    }

    
}


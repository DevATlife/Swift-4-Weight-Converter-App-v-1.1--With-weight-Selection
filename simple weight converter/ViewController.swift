
import UIKit

  /*--------------UITextFieldDelegate being added to hide keyboard once click away -----------------*/
class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
/*-------------1-----------------*/
    @IBOutlet weak var jinputField: UITextField!
    
    @IBOutlet weak var grams: UILabel!
    @IBOutlet weak var kgrams: UILabel!
    @IBOutlet weak var ounces: UILabel!
    @IBOutlet weak var pounds: UILabel!
    
    @IBOutlet weak var button1: UIButton!
   
    
    
    
    /*------------3--------------------*/
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    /*-- it is important to difine this variable (selectedWeight) at the top out side of the picker so you can use it to pass the value of pickerView[row] to both switch one with picker and the other one with the button ----*/
    
    var selectedWeight: String?  // ? means defaults to nil
    
    
   
    let weight = ["Pounds", "Grams", "Kilograms", "Ounces"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    

 
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = weight[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
        return myTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return weight[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return weight.count
    }
    
    /*--- this is trigger when user select an option ----*/
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        print(weight[row])
        
        selectedWeight = weight[row]
        
        switch selectedWeight{
        case weight[0]:
            check_input()
            pound_func()
            
            
        case weight[1]:
            check_input()
            grams_func()
            
        case weight[2]:
            check_input()
            kgrams_func()
            
            
        case weight[3]:
            check_input()
            ounces_func()
        default:
            check_input()
            pound_func()
        }
        
        
    }
    
 
  
    
    /*--------------5 linking the buttons ----------------------------------*/
    
    @IBAction func convert_Btn(_ sender: Any) {
        switch selectedWeight{
        case weight[0]:
            check_input()
            pound_func()
            
            
        case weight[1]:
            check_input()
            grams_func()
            
        case weight[2]:
            check_input()
            kgrams_func()
            
            
        case weight[3]:
            check_input()
            ounces_func()
        default:
            check_input()
            pound_func()
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.


  /*--------- linking the class with the input variable to hide keyboard once click away -----------------*/
  self.jinputField.delegate = self
    }


    
    /*---------------4------------------*/
      //Pounds converter
    func pound_func() {
        //to avoid the App fro crash an empty value
        if   jinputField.text == "" {
            jinputField.text! = "1"    // ! is for saying the variable will never return nil (input field empty) but if it does then the app will crash
            // so to solve that I pass 1 as defult value by checking if the input field nil or not then excuting check_input() function
            
        }
        print(jinputField.text!)
        let gramsValue = Double(jinputField.text!)! / 0.0022046
        grams.text = String("Grams: \(gramsValue) ")
        let KilogramsValue = Double(jinputField.text!)! / 2.2046
        kgrams.text = String("Kilograms: \(KilogramsValue) ")
        let ouncesValue = Double(jinputField.text!)!  * 16
        ounces.text = String("Ounces: \(ouncesValue) ")
        grams.isHidden = false
        kgrams.isHidden = false
        ounces.isHidden = false
        pounds.isHidden = false
        pounds.text = String("Pounds: \(jinputField.text!)")
    }
    
    
    //Grams converter
    func  grams_func() {
       print(jinputField.text!)
        let poundsValue1 = Double(jinputField.text!)! * 0.0022046
        pounds.text = String("Pounds: \(poundsValue1) ")
        let KilogramsValue1 = Double(jinputField.text!)! / 1000
        kgrams.text = String("Kilograms: \(KilogramsValue1) ")
        let ouncesValue1 = Double(jinputField.text!)!  / 28.3495
        ounces.text = String("Ounces: \(ouncesValue1) ")
        kgrams.isHidden = false
        ounces.isHidden = false
        pounds.isHidden = false
        grams.isHidden = false
        grams.text = String("Grams: \(jinputField.text!)")
    }
    
    
    //Kilograms converter
    func kgrams_func() {
       print(jinputField.text!)
        let gramsValue2 = Double(jinputField.text!)! * 1000
        grams.text = String("Grams: \(gramsValue2) ")
        let ouncesValue2 = Double(jinputField.text!)! * 35.274
        ounces.text = String("Ounces: \(ouncesValue2) ")
        let poundsValue2 = Double(jinputField.text!)!  * 2.20462
        pounds.text = String("Pounds \(poundsValue2) ")
        grams.isHidden = false
        kgrams.isHidden =  false
        ounces.isHidden = false
        pounds.isHidden = false
        kgrams.text = String("Kilograms: \(jinputField.text!)")
    }
    
    
    
    //ounces converter 
    func ounces_func() {
        print(jinputField.text!)
        let gramsValue3 = Double(jinputField.text!)! * 28.3495
        grams.text = String("Grams: \(gramsValue3) ")
        let KilogramsValue3 = Double(jinputField.text!)! * 0.028349500000294
        kgrams.text = String("Kilograms: \(KilogramsValue3) ")
        let poundsValue3 = Double(jinputField.text!)! * 0.0625
        pounds.text = String("pounds: \(poundsValue3) ")
        grams.isHidden = false
        kgrams.isHidden =  false
        ounces.isHidden = false
        pounds.isHidden = false
        ounces.text = String("Ounces: \(jinputField.text!)")
    }
/*---------------------------------------------------------*/
    
   
    //to perevent the App crashing when there is an empty value 
    func check_input(){
        if   jinputField.text == "" {
            jinputField.text! = "1"
        }
    }
    /*---------------------------------------------------------*/
    
    
   /*---------to hide keyboard once click away or click return buttun on letter keyboard -----------------*/
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        jinputField.resignFirstResponder()
        return (true)
    }
} /*--------End of ViewController class ---------*/


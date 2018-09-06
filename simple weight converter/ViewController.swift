
import UIKit
class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
/*-------------1-----------------*/
    @IBOutlet weak var jinputField: UITextField!
    
    @IBOutlet weak var grams: UILabel!
    @IBOutlet weak var kgrams: UILabel!
    @IBOutlet weak var ounces: UILabel!
    @IBOutlet weak var pounds: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    
    
    /*------------3--------------------*/
    @IBOutlet weak var pickerView: UIPickerView!
    
    
   
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
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        print(weight[row])
        
        
        
        
        if weight[row] == weight[0] {
            check_input()
            pound_func()
            button1.isHidden = false
            button2.isHidden = true
            button3.isHidden = true
            button4.isHidden = true
        }
            
        else if weight[row] == weight[1] {
            check_input()
            grams_func()
            button1.isHidden = true
            button2.isHidden = false
            button3.isHidden = true
            button4.isHidden = true
        }
            
        else if weight[row] == weight[2] {
            check_input()
            kgrams_func()
            button1.isHidden = true
            button2.isHidden = true
            button3.isHidden = false
            button4.isHidden = true
        }
            
        else if weight[row] == weight[3] {
           check_input()
           ounces_func()
            button1.isHidden = true
            button2.isHidden = true
            button3.isHidden = true
            button4.isHidden = false
        }
    
    }  /*--------------End of pickerView func ----------------------------------*/
    
    
    
    /*--------------5 linking the buttons ----------------------------------*/
    
    @IBAction func convert_Btn(_ sender: Any) {
            pound_func()
            check_input()
    }
 
    @IBAction func convert_btn2(_ sender: Any) {
         grams_func()
        check_input()
    }
    
    @IBAction func convert_btn3(_ sender: Any) {
        kgrams_func()
        check_input()
    }
    
    @IBAction func convert_btn(_ sender: Any) {
        ounces_func()
        check_input()
    }
    
/*-----------------------------------------------*/
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
  /*-------------2--optional---------------*/
        //jinputField.text = "Enter the pound value you want to convert here" hard coded
        grams.isHidden = true
        kgrams.isHidden = true
        ounces.isHidden = true
        pounds.isHidden = true
        
        button2.isHidden = true
        button3.isHidden = true
        button4.isHidden = true
  /*-------------------------------*/
    }


    
    /*---------------4------------------*/
      //Pounds converter
    func pound_func() {
        //to avoid the App fro crash an empty value
        if   jinputField.text == "" {
            jinputField.text! = "1"
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
} /*--------End of ViewController class ---------*/


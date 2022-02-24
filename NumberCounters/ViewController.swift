import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var main_tvNumber: UILabel!
    //Variable The Number
    var x = 0
    //User Defaults
    var currentData = UserDefaults.standard.integer(forKey:"currentData")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //V Number
        x = currentData
        
        // If Else Current Data
        if (currentData != 0){
            main_tvNumber.text = "\(currentData)"
        }else{
            main_tvNumber.text = "0"
        }
    }
    
    //Image Button
    @IBAction func main_buImage(_ sender: UIButton) {
        x += 1
        main_tvNumber.text = "\(x)"
    }
    
    //Button Save
    @IBAction func main_buSave(_ sender: Any) {
        UserDefaults.standard.set(main_tvNumber.text!, forKey: "currentData")
        showToast(message: "Save Complete", seconds: 0.5)
    }
    
    //Button Delete
    @IBAction func main_buClear(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "currentData")
        x = 0
        main_tvNumber.text = "\(x)"
        showToast(message: "Clear Complete", seconds: 0.5)
    }
    
    //Toast Function
    func showToast(message:String, seconds:Double){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.white
        alert.view.alpha = 1.5
        alert.view.layer.cornerRadius = 24
        self.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds){
            alert.dismiss(animated: true)
        }
    }
}


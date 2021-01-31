

import UIKit
import FirebaseAuth
class loginViewViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewc = storyboard.instantiateViewController(identifier: "signup")
        viewc.modalPresentationStyle = .overFullScreen
        present(viewc, animated:true)
    }
    
    @IBAction func loginTapped(_ sender: Any) {
    }
    
    func validateLogin(){
        if email.text?.isEmpty == true {
            print("no email")
            return
        }
        if password.text?.isEmpty == true {
            print("no password")
            return
        }
        login()
    }
    func login(){
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (authResult, error) in
    }
}

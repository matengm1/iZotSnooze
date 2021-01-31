

import UIKit
import Firebase
import FirebaseAuth

class SignUpView: UIViewController {

    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginbutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupTapped(_ sender: Any) {
       // if no email then break
        if email.text?.isEmpty == true {
            print("no  email")
            return
        }
        if password.text?.isEmpty == true {
            print("no password")
            return
        }
        
        if firstname.text?.isEmpty == true {
            print("no first name")
            return
        }
        
        if lastname.text?.isEmpty == true {
            print("no last name")
            return
        }
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewc = storyboard.instantiateViewController(identifier: "login")
        viewc.modalPresentationStyle = .overFullScreen
        present(viewc, animated:true)
    }
    
    func signUP(){
        //unwrap email/password incase
        //check authResult to see if user was created; if not, print the error
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (authResult, error) in
            guard let user = authResult?.user, error == nil else{
                print("Error \(error?.localizedDescription)")
                return
            }
                // if successful; navigate user to home screen
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewc = storyboard.instantiateViewController(identifier: "mainView")
                viewc.modalPresentationStyle = .overFullScreen
                self.present(viewc, animated:true)
        }
    }
    
}

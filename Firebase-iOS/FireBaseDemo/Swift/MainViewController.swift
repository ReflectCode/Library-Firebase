
import UIKit


import Firebase
import Firebase
import FirebaseAuth
import FirebaseDatabase
import Firebase
import CodableFirebase

public class MainViewController : BaseViewController{

    @IBOutlet weak var fieldEmailOutlet: UITextField!
    @IBOutlet weak var fieldPasswordOutlet: UITextField!
    @IBOutlet weak var buttonSignUpOutlet: UIButton!
    @IBOutlet weak var buttonSignInOutlet: UIButton!
    @IBOutlet weak var logMSGOutlet: UILabel!


    @IBAction func SignupClick(_ v: UIView?){
        logMSG!.text = "signUp clicked"
        if !( validateForm() ) {
            return
        }

        showProgressBar()
        var email : String? = mEmailField!.text!
        var password : String? = mPasswordField!.text!

        mAuth!.createUser(withEmail: email!, password: password!, completion: { (task, error) in

            self.logMSG!.text = ("createUser : onComplete = \(task != nil)")
            print("\(MainViewController.TAG!) : Result = \(task?.description)")
            self.hideProgressBar()

            if task != nil {
                self.onAuthSuccess(task!.user)
            }
            else {
                self.logMSG!.text = "createUser : Sign Up Failed !!"
            }
        }
    )
}


    @IBAction func SigninClick(_ v: UIView?){
        logMSG!.text = "signIn called"
        if !( validateForm() ) {
            return
        }

        showProgressBar()
        var email : String? = mEmailField!.text!
        var password : String? = mPasswordField!.text!

        mAuth!.signIn(withEmail: email!, password: password!, completion: { (task, error) in

            self.logMSG!.text = ("signIn : onComplete = \(task != nil)")
            self.hideProgressBar()

            if task != nil {
                self.onAuthSuccess(task!.user)
            }
            else {
                self.logMSG!.text = "signIn : Sign In Failed !!"
            }
        }
    )
}

    private static let TAG : String? = "RC"

    private var mDatabase : DatabaseReference?
    private var mAuth : Auth?

    private var mEmailField : UITextField? = nil
    private var mPasswordField : UITextField? = nil
    private var mSignInButton : UIButton? = nil
    private var mSignUpButton : UIButton? = nil
    private var logMSG : UILabel? = UILabel()


    // Note - source android method is onCreate()
    // Rc ToDo : Any code refering to UI should be moved to viewDidAppear()
    override public func viewDidLoad(){
        var savedInstanceState = UserDefaults.standard.dictionaryRepresentation()
        super.viewDidLoad()

        mDatabase = Database.database().reference()
        mAuth = Auth.auth()

        mEmailField = fieldEmailOutlet
        mPasswordField = fieldPasswordOutlet
        mSignInButton = buttonSignInOutlet
        mSignUpButton = buttonSignUpOutlet
        logMSG = logMSGOutlet

    }


    //  Note - source android method is onStart()
    override public func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)

        // Check auth on Activity start
        if mAuth!.currentUser != nil {
            onAuthSuccess(mAuth!.currentUser!)
        }
    }


    private func onAuthSuccess(_ user: Firebase.User?) -> Void {
        var username : String? = usernameFromEmail(user!.email)
        // Write new user
        writeNewUser(user!.providerID, username!, user!.email)

    }

    // [START basic_write]

    private func writeNewUser(_ userId: String?, _ name: String?, _ email: String?) -> Void {
        var user : aUser? = aUser(name!, email!)
//RC ToDo-0001 : Class 'aUser' needs to comply 'Codable' protocol
        do{
            try mDatabase!.child("users").child(userId!).setValue(FirebaseEncoder().encode(user!))
        } catch let error as NSError? {
            print("Error: \(error!.localizedDescription)")
        }
    }
    // [END basic_write]


    private func usernameFromEmail(_ email: String?) -> String?{
        if email!.contains("@") {
            return email!.split(separator: "@")[0].description
        }
        else {
            return email!
        }
    }


    private func validateForm() -> Bool{
        var result : Bool = true
        if mEmailField!.text!.isEmpty {
            mEmailField?.background = UIImage(named: "RC_text_field_underline_error")
            mEmailField?.placeholder = "Required"
            result = false
        }
        else {
            mEmailField?.background = UIImage(named: "RC_text_field_underline")
            mEmailField?.placeholder = ""
        }

        if mPasswordField!.text!.isEmpty {
            mPasswordField?.background = UIImage(named: "RC_text_field_underline_error")
            mPasswordField?.placeholder = "Required"
            result = false
        }
        else {
            mPasswordField?.background = UIImage(named: "RC_text_field_underline")
            mPasswordField?.placeholder = ""
        }

        return result
    }
}

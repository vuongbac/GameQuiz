
// Swift
//
// Add this to the header of your file, e.g. in ViewController.swift

import FBSDKLoginKit
import GoogleSignIn
import FirebaseAuth
import Firebase
import FirebaseFirestore

class ViewController: UIViewController, GIDSignInDelegate {
    @IBOutlet weak var btnG: UIButton!
    @IBOutlet weak var btnF: UIButton!
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnF.layer.cornerRadius = 25
        btnG.layer.cornerRadius = 25
        
        GIDSignIn.sharedInstance()?.delegate = self
        if AccessToken.current != nil{
            firebaseFaceBookLogin(token: AccessToken.current!.tokenString)
        }
    }
    
    @IBAction func btnFacebook(_ sender: Any) {
        facebooklogin()
    }
    
    @IBAction func btnGoogle(_ sender: Any) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        print("co chay vao day ")
        
        let userId = user.userID
        let email1 = user.profile.email
        let fullName = user.profile.name
        
        ref = Database.database().reference()
        let a = Int.random(in: 0..<10)
        self.ref.child("ListUser").child("user\(a)").updateChildValues(["id" : userId , "email":email1 , "name": fullName]) { (error,reference) in
            if error != nil{
                print("error")
            }
            print("a")
        }
    }
    
    
    func facebooklogin() {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: [Permission.publicProfile], viewController : self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login")
            case .success(let grantedPermissions,let declinedPermissions,let accessToken):
                print("Logged in")
                self.returnUserData()
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "menu") as! MenuViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion:nil)
            }
        }
    }
    
    
    
    func firebaseFaceBookLogin(token:String)  {
        let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if error != nil {
                print("error Login")
                return
            }
            print("Login Done")
            if Auth.auth().currentUser != nil{
            }
        }
    }
    
    // get info get user ] facebook
    func returnUserData() {
        if(AccessToken.current) != nil{
            GraphRequest(graphPath: "me", parameters: ["file":"id, email, name"]).start { (connection, result, errer) in
                if(errer == nil){
                    let dict = result as! [String: AnyObject]
                    print("result")
                    let picotreDic = dict as NSDictionary
                    
                    let name = picotreDic.object(forKey: "name") as! String
                    let id = picotreDic.object(forKey: "id") as! String
                    
                    print("name is :\(name)")
                    print(id)
                    
                    self.ref = Database.database().reference()
                    var a = Int.random(in: 0..<10)
                    self.ref.child("ListUser").child("user\(a)").updateChildValues(["id" : id , "name":name]) { (error,reference) in
                        if error != nil{
                            print("error")
                        }
                        print("a")
                    }
                    
                }
            }
        }
        
        
    }
}



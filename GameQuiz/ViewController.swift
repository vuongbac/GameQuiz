
// Swift
//
// Add this to the header of your file, e.g. in ViewController.swift

import FBSDKLoginKit
import GoogleSignIn
import FirebaseAuth
import Firebase

class ViewController: UIViewController, GIDSignInDelegate {
    
    @IBOutlet weak var btnG: UIButton!
    @IBOutlet weak var btnF: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnF.layer.cornerRadius = 25
        btnG.layer.cornerRadius = 25
        
        GIDSignIn.sharedInstance()?.delegate = self
        if let token = AccessToken.current{
            
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
        if let error = error {
            return
        }
        let email1 = user.profile.email
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if error != nil {
                print("a")
                } else {
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "menu") as! MenuViewController
                vc.modalPresentationStyle = .fullScreen
                vc.email = email1!
                self.present(vc, animated: true, completion:nil)                }
            }
            return
        }
    
    
    
    func facebooklogin() {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: [Permission.publicProfile], viewController : self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login")
            case .success(let grantedPermissions,
                          let declinedPermissions,
                          let accessToken):
                print("Logged in")
                self.returnUserData()
            }
        }
    }
    
//    func loginButton(_ loginButton: FBLoginButton!, didCompleteWith result: LoginManagerLoginResult!, error: Error!) {
//        if let error = error {
//        print(error.localizedDescription)
//        return
//      }
//        let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
//
//        Auth.auth().signIn(with: credential) { (authResult, error) in
//            if error != nil {
//                print("a")
//                } else {
//                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "menu") as! MenuViewController
//                vc.modalPresentationStyle = .fullScreen
//               // vc.email = email1!
//                self.present(vc, animated: true, completion:nil)                }
//            }
//            return
//        }
    
    
    func firebaseFaceBookLogin(token:String)  {
        let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
        Auth.auth().signIn(with: credential) { (authResult, error) in
        if let error = error {
            print("error Login")
            
        return
            }
            print("Login Done")
            if let user = Auth.auth().currentUser{
                print("ok")
                
            }
    }
    }
    
        
    
    
    func returnUserData() {
        let graphRequest : GraphRequest = GraphRequest(graphPath: "me", parameters: ["fields":"email,name"])
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            if ((error) != nil) {
                // Process error
                print(error)
            } else {
                let resultDic = result as! NSDictionary
                if (resultDic.value(forKey:"name") != nil) {
                    let userName = resultDic.value(forKey:"name")! as! String as NSString?
                }
                if (resultDic.value(forKey:"email") != nil) {
                    let userEmail = resultDic.value(forKey:"email")! as! String as NSString?
                    
                }
            }
        })
    }
}



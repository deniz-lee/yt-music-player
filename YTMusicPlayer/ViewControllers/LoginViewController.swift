//
//  ViewController.swift
//  YTMusicPlayer
//
//  Created by younggi.lee on 2022/09/20.
//
import GoogleSignIn

class LoginViewController: ViewController
{
    @IBOutlet internal weak var label: Label?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.label?.value = "mymy"
        self.label?.textColor = Color.color(red: 120/255.0, green: 220/255.0, blue: 220/255.0)
        self.label?.font = Font.font(ofSize: 32)
        
        
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        let signInConfig = GIDConfiguration(clientID: "876108117124-7jev2j567b5u4ua0tii23jm1s3dobmqt.apps.googleusercontent.com")
        
        
        if let window = self.view.window
        {
            GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: window) { user, error in
                guard error == nil else { return }

                // If sign in succeeded, display the app's main content View.
              }
        }
    }
}

extension LoginViewController
{
    private func configureLogin()
    {
        NetworkManager.shared()
    }
}

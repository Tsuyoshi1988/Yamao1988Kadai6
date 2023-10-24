import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var hanteiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        random()
    }

    @IBAction func hantei(_ sender: Any) {
        let message: String
        if hanteiLabel.text == "\(Int(slider.value))" {
            message = "正解！あなたの値は\(Int(slider.value))"
        } else {
            message = "ハズレ！あなたの値は\(Int(slider.value))"
        }
        presentAlert(message: message)
    }

    func random () {
        let index:Int = Int(arc4random_uniform(100) + 1)
        hanteiLabel.text = "\(index)"
    }

    private func presentAlert(message: String) {
        let title = "結果"
        let alert = UIAlertController(title: title, message: message,preferredStyle: .alert)
        // OKボタンを作成＆追加
        let ok = UIAlertAction(title: "再挑戦", style: .default, handler:{
            action in self.random()
        })
        alert.addAction(ok)
        // アラートを表示
        present(alert, animated: true, completion: nil)
    }
}

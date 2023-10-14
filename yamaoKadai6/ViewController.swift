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
        if hanteiLabel.text == "\(Int(slider.value))" {
            let title = "結果"
            let message = "正解！あなたの値は\(Int(slider.value))"
            let alert = UIAlertController(title: title, message: message,preferredStyle: .alert)
            // OKボタンを作成＆追加
            let ok = UIAlertAction(title: "再挑戦", style: .default, handler:{
                action in self.random()
            })
            alert.addAction(ok)
            // アラートの表示
            present(alert, animated: true, completion: nil)
        } else {
            let title = "結果"
            let message = "ハズレ！あなたの値は\(Int(slider.value))"
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
    func random () {
        for _ in 0...1 {
            let index:Int = Int(arc4random_uniform(100))
            hanteiLabel.text = "\(index)"
        }
    }
}

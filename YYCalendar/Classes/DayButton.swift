//
//  DayButton.swift
//  Pods
//
//  Created by DevYeom on 20/06/2019.
//

import Foundation

@available(iOS 10.0, *)
class DayButton: UIButton {
	let todayIconImage: UIImage? = UIImage(named: "today_icon", in: Bundle(for: DayButton.self), compatibleWith: nil)
	let selectedDayColor: UIColor = Useful.getUIColor(55, 137, 220)
	var beforeTextColor: UIColor = Useful.getUIColor(51, 51, 51)
	var todayIconImageView: UIImageView!

	override init(frame: CGRect) {
		super.init(frame: frame)

		setupTodayIcon()
		setupAutoLayout()

		self.todayIconImageView.isHidden = true
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	override var isHighlighted: Bool {
		willSet {
			beforeTextColor = titleLabel?.textColor ?? Useful.getUIColor(51, 51, 51)
		}

		didSet {
			backgroundColor = isHighlighted ? selectedDayColor : UIColor.white
			titleLabel?.textColor = isHighlighted ? UIColor.white : beforeTextColor
		}
	}

	func setupTodayIcon() {
		todayIconImageView = UIImageView.init()
		todayIconImageView.image = todayIconImage

		self.addSubview(todayIconImageView)
	}

	func setupAutoLayout() {
		self.titleLabel?.translatesAutoresizingMaskIntoConstraints = false
		self.todayIconImageView.translatesAutoresizingMaskIntoConstraints = false

		self.titleLabel?.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
		self.titleLabel?.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
		self.todayIconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
		self.todayIconImageView.topAnchor.constraint(equalTo: (self.titleLabel?.bottomAnchor)!, constant: 2).isActive = true
		self.todayIconImageView.heightAnchor.constraint(equalToConstant: 5).isActive = true
		self.todayIconImageView.widthAnchor.constraint(equalTo: self.todayIconImageView.heightAnchor).isActive = true
	}
}

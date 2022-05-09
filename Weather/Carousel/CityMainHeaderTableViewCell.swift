//
//  CityMainHeaderTableViewCell.swift
//  Weather
//
//  Created by GiN Eugene on 9/5/2022.
//

import UIKit

class CityMainHeaderTableViewCell: UITableViewCell {
//MARK: - props
    
    static let cellId = "CityMainHeaderTableViewCell"
//MARK: - subviews
    
    private let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(rgb: 0x204EC7)
        view.layer.cornerRadius = 5
        
        return view
    }()
    //MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - setupViews

extension CityMainHeaderTableViewCell {
    private func setupViews() {
        contentView.addSubview(headerView)
        contentView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            headerView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            headerView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 212)
        ])
    }
}






class ArcsView: UIView {
    
    struct Arc {
        var color: UIColor
        var angle: CGFloat
    }

    override func draw(_ rect: CGRect) {
        
        let arcsCount = 5
        let arcsWidth: CGFloat = 40.0
        let spaceWidth: CGFloat = 10.0
        
        let innerArcRadius = rect.width / 2.0 - arcsWidth
        let outerArcRadius = rect.width / 2.0
        
        // определяем расстояния (углы) между секторами по формуле треугольника, зная длины всех сторон
        
        let innerSpaceAngle = acos((pow(innerArcRadius, 2) + pow(innerArcRadius, 2) - pow(spaceWidth, 2)) / (2 * innerArcRadius * innerArcRadius))
        let outerSpaceAngle = acos((pow(outerArcRadius, 2) + pow(outerArcRadius, 2) - pow(spaceWidth, 2)) / (2 * outerArcRadius * outerArcRadius))
        let arcsAngle = CGFloat.pi * 2 / CGFloat(arcsCount)
        
        // заполняем массив для примера
        
        let arcs = [
            Arc(color: .red, angle: arcsAngle),
            Arc(color: .orange, angle: arcsAngle),
            Arc(color: .yellow, angle: arcsAngle),
            Arc(color: .green, angle: arcsAngle),
            Arc(color: .blue, angle: arcsAngle)
        ]
        
        // поворачиваем сектора для симметрии
        
        var angle: CGFloat = -arcsAngle / 4
        
        arcs.forEach {
            
            // добавляем дуги, которые сами соединяются линией и затем замыкаем контур
            
            let path = UIBezierPath()
            path.lineWidth = 2

            path.addArc(withCenter: CGPoint(x: rect.midX, y: rect.midY),
                        radius: innerArcRadius,
                        startAngle: angle + innerSpaceAngle / 2,
                        endAngle: angle + $0.angle - innerSpaceAngle / 2,
                        clockwise: true)

            path.addArc(withCenter: CGPoint(x: rect.midX, y: rect.midY),
                        radius: outerArcRadius,
                        startAngle: angle + $0.angle - outerSpaceAngle / 2,
                        endAngle: angle + outerSpaceAngle / 2,
                        clockwise: false)

            path.close()

            $0.color.setFill()
            path.fill()

            angle += $0.angle
        }
    
    }

}

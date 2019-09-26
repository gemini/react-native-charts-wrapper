//  Created by xudong wu on 24/02/2017.
//  Copyright wuxudong
//

import Charts
import SwiftyJSON

class RNLineChartView: RNBarLineChartViewBase, UIGestureRecognizerDelegate {
    let _chart: LineChartView;
    let _dataExtract : LineDataExtract;

    override var chart: LineChartView {
        return _chart
    }

    override var dataExtract: DataExtract {
        return _dataExtract
    }

    override init(frame: CoreGraphics.CGRect) {

        self._chart = LineChartView(frame: frame)
        self._dataExtract = LineDataExtract()

        super.init(frame: frame);

        self._chart.delegate = self
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        recognizer.delegate = self
        self._chart.addGestureRecognizer(recognizer)
        self.addSubview(_chart);

    }

    func handlePan(_ recognizer: UIPanGestureRecognizer) {
        if (recognizer.state == .began) {
            self.chart.drawMarkers = true
            if (self.onPanStart != nil) {
                self.onPanStart!(nil)
             }
            self.chart.notifyDataSetChanged()
        }else if (recognizer.state == .ended) {
            self.chart.drawMarkers = false
            if (self.onPanEnd != nil) {
                self.onPanEnd!(nil)
            }
            self.chart.notifyDataSetChanged()
        }

    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

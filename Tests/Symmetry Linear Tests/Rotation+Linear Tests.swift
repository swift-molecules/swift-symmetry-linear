import Linear
import Symmetry
import Testing

@testable import Symmetry_Linear

@Suite
struct `Rotation Linear Tests` {

    @Test
    func `Linear conversion produces correct matrix`() {
        let rotation = Rotation<2, Double>(cos: 0.6, sin: 0.8)
        let linear: Linear<Double, Void>.Matrix<2, 2> = rotation.linear()

        #expect(linear.a == 0.6)
        #expect(linear.b == -0.8)
        #expect(linear.c == 0.8)
        #expect(linear.d == 0.6)
    }
}

import Linear
import Symmetry
import Testing

@testable import Symmetry_Linear

@Suite
struct `Shear Linear Tests` {

    @Test
    func `Linear conversion produces correct matrix`() {
        let shear = Shear<2, Double>(x: 0.5, y: 0.3)
        let linear: Linear<Double, Void>.Matrix<2, 2> = shear.linear()

        #expect(linear.a == 1)
        #expect(linear.b == 0.5)
        #expect(linear.c == 0.3)
        #expect(linear.d == 1)
    }

    @Test
    func `Identity linear conversion produces identity matrix`() {
        let shear = Shear<2, Double>.identity
        let linear: Linear<Double, Void>.Matrix<2, 2> = shear.linear()

        #expect(linear.a == 1)
        #expect(linear.b == 0)
        #expect(linear.c == 0)
        #expect(linear.d == 1)
    }

    @Test
    func `Horizontal shear linear conversion`() {
        let shear = Shear<2, Double>(x: 0.7, y: 0)
        let linear: Linear<Double, Void>.Matrix<2, 2> = shear.linear()

        #expect(linear.a == 1)
        #expect(linear.b == 0.7)
        #expect(linear.c == 0)
        #expect(linear.d == 1)
    }

    @Test
    func `Vertical shear linear conversion`() {
        let shear = Shear<2, Double>(x: 0, y: 0.4)
        let linear: Linear<Double, Void>.Matrix<2, 2> = shear.linear()

        #expect(linear.a == 1)
        #expect(linear.b == 0)
        #expect(linear.c == 0.4)
        #expect(linear.d == 1)
    }
}

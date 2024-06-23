/// Module: calculator
module calculator::calculator {
    public fun add(a: u64, b: u64): u64 {
        a + b
    }

    public fun sub(a: u64, b: u64): u64 {
        assert!(a >= b, 1);
        a - b
    }

    public fun mul(a: u64, b: u64): u64 {
        a * b
    }

    public fun div(a: u64, b: u64): u64 {
        assert!(b > 0, 2);
        a / b
    }
}

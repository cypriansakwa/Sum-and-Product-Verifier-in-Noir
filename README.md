# Sum and Product Verifier in Noir

This Noir program checks whether three input `Field` elements satisfy given sum and product constraints. It is useful as a basic arithmetic constraint example in zero-knowledge proof systems.

## Overview

This circuit performs the following:

- Computes the **sum** and **product** of a list of three field elements.
- Verifies the computed values against publicly provided `expected_sum` and `expected_product`.

If the assertions pass, the circuit generates a valid proof. If not, the proof generation fails.

## Circuit Structure

### `check_sum_and_product(values: [Field; 3], expected_sum: Field, expected_product: Field)`

This function:

- Computes the sum and product of the input array.
- Uses `assert` statements to verify:
  - `sum == expected_sum`
  - `product == expected_product`

### `main(values: [Field; 3], expected_sum: pub Field, expected_product: pub Field)`

- Entry point of the circuit.
- Inputs:
  - `values`: an array of 3 private field elements.
  - `expected_sum` and `expected_product`: public values to be verified against.
- Calls `check_sum_and_product`.

### Test

```rust
#[test]
fn check_valid_sum_product() {
    let values = [5, 3, 6];
    let expected_sum = 14;
    let expected_product = 90;
    check_sum_and_product(values, expected_sum, expected_product);
}
```
## Test Description

This test proves that:

- $5 + 3 + 6 = 14$
- $5 \times 3 \times 6 = 90$
---

## Running the Circuit

### 1. Create a new Noir project (if not already created)

```bash
nargo new sum_product_verifier
cd sum_product_verifier
```
### 2. Replace src/main.nr with your circuit code
```rust
fn check_sum_and_product(values: [Field; 3], expected_sum: Field, expected_product: Field) {
    let mut sum = 0;
    let mut product = 1;

    for i in 0..3 {
        sum += values[i];
        product *= values[i];
    }

    assert(sum == expected_sum);
    assert(product == expected_product);
}

fn main(values: [Field; 3], expected_sum: pub Field, expected_product: pub Field) {
    check_sum_and_product(values, expected_sum, expected_product);
}

#[test]
fn check_valid_sum_product() {
    let values = [5, 3, 6];
    let expected_sum = 14;
    let expected_product = 90;
    check_sum_and_product(values, expected_sum, expected_product);
}
```
### 3. Compile and run tests
```bash
nargo test
```
You should see output confirming that the test passed.
## Inputs and Outputs

### 🔒 Private Inputs

- `values: [Field; 3]` — the values whose sum and product are being checked.

### 🌐 Public Inputs

- `expected_sum: Field`
- `expected_product: Field`

### ✅ Output

- A proof that the private `values` sum and multiply to the expected public results.


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

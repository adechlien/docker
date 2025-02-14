use std::fs::File;
use std::io::Write;
use std::time::Instant;

fn counting_sort(arr: &mut Vec<i32>) {
    if arr.is_empty() {
        return;
    }

    let max = *arr.iter().max().unwrap() as usize;

    let mut count = vec![0; max + 1];
    let mut output = vec![0; arr.len()];

    for &i in arr.iter() {
        count[i as usize] += 1;
    }

    for i in 1..=max {
        count[i] += count[i - 1];
    }

    let len = arr.len();
    for i in (0..len).rev() {
        let current = arr[i] as usize;
        output[count[current] - 1] = arr[i];
        count[current] -= 1;
    }

    for i in 0..len {
        arr[i] = output[i];
    }
}

fn main() {
    let mut data = vec![8, 9, 3, 1, 4, 6, 11, 15, 19, 16, 14, 3, 25, 23];

    let start = Instant::now();
    counting_sort(&mut data);
    let duration = start.elapsed();

    let duration_ms = duration.as_secs_f64() * 1000.0;

    let mut file = File::create("rust_output.txt").unwrap();
    for num in data {
        writeln!(file, "{}", num).unwrap();
    }

    println!("{}", duration_ms);
}

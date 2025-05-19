use std::env;
use std::fs::{read_to_string, File};
use std::io::Write;

fn main()
{
    let args: Vec<String> = env::args().collect();
    if args.len() != 4
    {
        eprintln!("Usage: csvmerge <input1.csv> <input2.csv> <output.csv>");
        std::process::exit(1);
    }

    let input1 = &args[1];
    let input2 = &args[2];
    let output = &args[3];

    let text1 = read_to_string(input1)
        .unwrap_or_else(|e| panic!("Failed to read '{}' : '{}'", input1, e));
    let text2 = read_to_string(input2)
        .unwrap_or_else(|e| panic!("Failed to read '{}' : '{}'", input2, e));

    let lines1 = text1.lines();
    let lines2 = text2.lines();

    let mut out = File::create(output)
        .unwrap_or_else(|e| panic!("Failed to create '{}' : '{}'", output, e));

    for (l1, l2) in lines1.zip(lines2)
    {
        writeln!(out, "{},{}", l1, l2)
            .unwrap_or_else(|e| panic!("Failed to write to '{}' : '{}'", output, e));
    }
}
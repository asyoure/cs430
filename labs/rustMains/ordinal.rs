fn ordinal (n: u32) -> String
{
    let suffix = match n % 100 // get the last two digits out
    {
        11 | 12 | 13 => "th",
        _ => match n % 10
        {
            1 => "st",
            2 => "nd",
            3 => "rd",
            _ => "th"
        },
    };
    format!("{}{}", n, suffix)
}

fn main()
{
    for n in 1..=130
    {
        println!("{}", ordinal(n));
    }
}
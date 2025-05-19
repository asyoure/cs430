use std::env;

fn main()
{
    let verb = env::args().nth(1)
        .unwrap_or_else(||
        {
            eprintln!("Usage: verb <infinitive-verb>"); // rust makes me do error checking (lame)
            std::process::exit(1); // failure
        });

    let (stem, endings) = if let Some(stem) = verb.strip_suffix("ar")
    {
        (stem, ["o", "as", "a", "amos", "an"])
    }
    else if let Some(stem) = verb.strip_suffix("er")
    {
        (stem, ["o", "es", "e", "emos", "en"])
    }
    else if let Some(stem) = verb.strip_suffix("ir")
    {
        (stem, ["o", "es", "e", "imos", "en"])
    }
    else
    {
        eprintln!("Error: '{}' is not a regular -ar, -er, or -ir verb", verb);
        std::process::exit(1); // indicate failure
    };

    for ending in endings
    {
        println!("{}{}", stem, ending);
    }
}
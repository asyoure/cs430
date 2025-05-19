use std::fs;

#[derive(Debug)]
struct Country
{
    country:            String,
    capital:            String,
    _latitude:          f64,
    _longitude:         f64,
    capital_population: u64,
    area:               f64,
    population_1960:    u64,
    population_2021:    u64,
}

fn main()
{
    let data = fs::read_to_string("countries.csv").unwrap();

    let countries: Vec<Country> = data
        .lines()
        .skip(1) // ignore first line
        .map(|line|
        {
            let mut fields = line.split(",");
                Country
                {
                    country:            fields.next().unwrap().to_string(),
                    capital:            fields.next().unwrap().to_string(),
                    _latitude:          fields.next().unwrap().parse().unwrap(),
                    _longitude:         fields.next().unwrap().parse().unwrap(),
                    capital_population: fields.next().unwrap().parse().unwrap(),
                    area:               fields.next().unwrap().parse().unwrap(),
                    population_1960:    fields.next().unwrap().parse().unwrap(),
                    population_2021:    fields.next().unwrap().parse().unwrap(),
                }
        })
        .collect();

    // QnA

    // Q1: Which countries have the largest and smallest areas?
    let largest_area = countries
        .iter()
        .max_by(|a, b| a.area.partial_cmp(&b.area).unwrap())
        .unwrap();
    println!("Largest area: {} ({} sq km)", largest_area.country, largest_area.area);

    let smallest_area = countries
        .iter()
        .min_by(|a, b| a.area.partial_cmp(&b.area).unwrap())
        .unwrap();
    println!("Smallest area: {} ({} sq km)", smallest_area.country, smallest_area.area);

    // Q2: Which countries have the largest and smallest capital populations?
    let biggest_capital = countries
        .iter()
        .max_by_key(|c| c.capital_population)
        .unwrap();
    println!("Largest capital population: {} ({})", biggest_capital.capital, biggest_capital.capital_population);

    let smallest_capital = countries
        .iter()
        .min_by_key(|c| c.capital_population)
        .unwrap();
    println!("Smallest capital population: {} ({})", smallest_capital.capital, smallest_capital.capital_population);

    // Q3: Which country saw the highest percent growth from 1960 to 2021?
    let fastest_growth = countries
        .iter()
        .map(|c| {
            let growth = (c.population_2021 as f64 - c.population_1960 as f64)
                / c.population_1960 as f64;
            (c, growth)
        })
        .max_by(|a, b| a.1.partial_cmp(&b.1).unwrap())
        .unwrap();
    println!(
        "Fastest percent growth: {} ({:.1}% increase)",
        fastest_growth.0.country,
        fastest_growth.1 * 100.0
    );
}
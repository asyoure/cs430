#![allow(dead_code)]

use std::fmt::Display;
use std::ops::RangeInclusive;

enum Tree<T> {
    Empty,
    Node {
        value: T,
        left:  Box<Tree<T>>,
        right: Box<Tree<T>>,
    },
}

impl<T: PartialOrd> Tree<T> {
    fn contains(&self, target: T) -> bool {
        match self {
            Tree::Empty => false,
            Tree::Node { value, left, right } => {
                if target < *value {
                    left.contains(target)
                } else if target > *value {
                    right.contains(target)
                } else {
                    true
                }
            }
        }
    }

    fn add(&mut self, new_value: T) {
        match self {
            Tree::Empty => {
                *self = Tree::Node {
                    value: new_value,
                    left:  Box::new(Tree::Empty),
                    right: Box::new(Tree::Empty),
                };
            }
            Tree::Node { value, left, right } => {
                if new_value < *value {
                    left.add(new_value);
                } else if new_value > *value {
                    right.add(new_value);
                }
            }
        }
    }
}

impl<T> Tree<T>
{
    fn len(&self) -> usize
    {
        match self
        {
            Tree::Empty => 0,
            Tree::Node { left, right, .. } => 1 + left.len() + right.len(),
        }
    }
}

impl<T: Display> Tree<T>
{
    fn print(&self)
    {
        match self
        {
            Tree::Empty => {}
            Tree::Node { value, left, right } => 
            {
                left.print();
                println!("{}", value);
                right.print();
            }
        }
    }
}

impl<T: PartialOrd + Copy> Tree<T> 
{
    fn between(&self, range: &RangeInclusive<T>, out: &mut Vec<T>) 
    {
        match self 
        {
            Tree::Empty => {}
            Tree::Node { value, left, right } => 
            {
                if *value < *range.start() 
                {
                    right.between(range, out);
                }
                else if *value > *range.end() 
                {
                    left.between(range, out);
                }
                else 
                {
                    left.between(range, out);
                    out.push(*value);
                    right.between(range, out);
                }
            }
        }
    }
}

fn main() 
{
    let mut tree = Tree::Empty;
    tree.add(7);
    tree.add(4);
    tree.add(9);
    tree.add(13);
    tree.add(5);
    tree.add(12);

    println!("len: {}", tree.len());

    // test print()
    println!("in-order traversal:");
    tree.print();

    // test between()
    let mut v = Vec::new();
    tree.between(&(5..=12), &mut v);
    println!("between 5 and 12: {:?}", v);
}
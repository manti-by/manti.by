use lazy_static::lazy_static;
use std::collections::HashMap;
use std::env;
use std::fs::File;
use std::io::BufReader;

use crate::images::Images;
use crate::releases::Releases;
use crate::tags::{Tag, Tags};

lazy_static! {
    pub static ref DATA: Data = Data::new();
}

fn get_content_reader(file_name: &str) -> BufReader<File> {
    let mut current_path = env::current_dir().unwrap();
    current_path.pop();
    current_path.push("content");
    current_path.push(file_name);

    let file = File::open(current_path).unwrap();
    BufReader::new(file)
}

pub struct Data {
    pub tags: Tags,
    pub popular_tags: Vec<Tag>,
    pub images: Images,
    pub releases: Releases,
}

impl Default for Data {
    fn default() -> Self {
        // Read data from files
        let reader = get_content_reader("tags.json");
        let tags: Tags = serde_json::from_reader(reader).unwrap();

        let reader = get_content_reader("gallery.json");
        let mut images: Images = serde_json::from_reader(reader).unwrap();
        images.images = images.images.iter().rev().cloned().collect();

        let reader = get_content_reader("releases.json");
        let mut releases: Releases = serde_json::from_reader(reader).unwrap();
        releases.releases = releases.releases.iter().rev().cloned().collect();

        // Calculate popular tags
        let mut scores: HashMap<String, i16> = HashMap::new();
        let tags_list: Vec<Vec<String>> = releases
            .releases
            .iter()
            .map(|p| p.tags.iter().cloned().collect())
            .collect();
        let release_tags: Vec<&String> = tags_list.iter().flatten().collect();

        for tag in release_tags {
            *scores.entry(tag.to_owned()).or_insert(0) += 1;
        }

        let mut sorted_scores: Vec<_> = scores.iter().collect();
        sorted_scores.sort_by_key(|x| -x.1);

        let sorted_tags: Vec<String> = sorted_scores.into_iter().map(|x| x.0).cloned().collect();
        let mut popular_tags: Vec<Tag> = Vec::new();
        for tag in sorted_tags {
            match tags.tags.iter().find(|&x| x.slug == tag) {
                Some(x) => popular_tags.push(x.to_owned()),
                None => eprintln!("Tag not found {:?}", &tag),
            };
        }

        Data {
            tags,
            popular_tags,
            images,
            releases,
        }
    }
}

impl Data {
    pub fn new() -> Self {
        Data::default()
    }
}

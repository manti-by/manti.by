use lazy_static::lazy_static;
use std::fs::File;
use std::io::BufReader;

use crate::images::Images;
use crate::releases::Releases;
use crate::tags::Tags;

lazy_static! {
    pub static ref DATA: Data = Data::new();
}

pub struct Data {
    pub tags: Tags,
    pub images: Images,
    pub releases: Releases,
}

impl Default for Data {
    fn default() -> Self {
        let file = File::open("../content/tags.json").unwrap();
        let reader = BufReader::new(file);
        let tags: Tags = serde_json::from_reader(reader).unwrap();

        let file = File::open("../content/gallery.json").unwrap();
        let reader = BufReader::new(file);
        let images: Images = serde_json::from_reader(reader).unwrap();

        let file = File::open("../content/releases.json").unwrap();
        let reader = BufReader::new(file);
        let releases: Releases = serde_json::from_reader(reader).unwrap();

        Data {
            tags,
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

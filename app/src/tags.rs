use crate::DATA;
use serde::{Deserialize, Serialize};
use std::collections::HashMap;

#[derive(Serialize, Deserialize, Clone)]
pub struct Tag {
    pub slug: String,
    pub name: String,
}

#[derive(Serialize, Deserialize)]
pub struct Tags {
    pub tags: Vec<Tag>,
}

impl Tags {
    pub fn popular(&self) -> Vec<Tag> {
        let mut scores: HashMap<String, i16> = HashMap::new();
        let tags_list: Vec<Vec<String>> = DATA
            .releases
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

        let tags: Vec<String> = sorted_scores.into_iter().map(|x| x.0).cloned().collect();

        let mut tag_objects: Vec<Tag> = Vec::new();
        for tag in tags {
            match DATA.tags.tags.iter().find(|&x| x.slug == tag) {
                Some(x) => tag_objects.push(x.to_owned()),
                None => eprintln!("Tag not found {:?}", &tag),
            };
        }
        tag_objects
    }
}

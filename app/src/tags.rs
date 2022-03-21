use serde::{Deserialize, Serialize};

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
        self.tags.iter().rev().cloned().collect()
    }
}

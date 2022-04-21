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

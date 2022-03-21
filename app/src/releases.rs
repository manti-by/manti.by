use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize, Clone)]
pub struct Attachment {
    pub mp3: String,
    pub ogg: String,
}

#[derive(Serialize, Deserialize, Clone)]
pub struct Cover {
    pub original: String,
    pub display: String,
    pub preview: String,
    pub thumbnail: String,
}

#[derive(Serialize, Deserialize, Clone)]
pub struct Release {
    pub id: String,
    pub slug: String,
    pub name: String,
    pub created_at: String,
    pub summary: String,
    pub description: String,
    pub catnum: String,
    pub quality: String,
    pub length: String,
    pub tracklist: String,
    pub viewed: u16,
    pub genres: Vec<String>,
    pub tags: Vec<String>,
    pub related: Vec<String>,
    pub original: String,
    pub release: Attachment,
    pub preview: Attachment,
    pub cover: Cover,
}

impl Release {
    pub fn tags(&self) -> Vec<String> {
        self.tags.iter().rev().cloned().collect()
    }
}

#[derive(Serialize, Deserialize)]
pub struct Releases {
    pub releases: Vec<Release>,
}

impl Releases {
    pub fn featured(&self) -> Vec<Release> {
        let featured = String::from("featured");
        self.releases
            .iter()
            .filter(|x| x.tags.contains(&featured))
            .cloned()
            .collect()
    }

    pub fn front(&self) -> Vec<Release> {
        let front = String::from("front");
        self.releases
            .iter()
            .filter(|x| x.tags.contains(&front))
            .cloned()
            .collect()
    }

    pub fn latest(&self) -> Vec<Release> {
        self.releases.iter().rev().cloned().collect()
    }
}

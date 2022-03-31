use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize, Clone)]
pub struct FeaturedImage {
    pub display: String,
    pub thumbnail: String,
}

#[derive(Serialize, Deserialize, Clone)]
pub struct Image {
    pub id: i16,
    pub original: String,
    pub display: String,
    pub preview: String,
    pub thumbnail: String,
}

#[derive(Serialize, Deserialize)]
pub struct Images {
    pub images: Vec<Image>,
}

impl Images {
    pub fn latest(&self) -> Vec<Image> {
        self.images.iter().rev().cloned().collect()
    }
}

use crate::{Tag, DATA};
use chrono::NaiveDate;
use serde::ser::SerializeStruct;
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

#[derive(Deserialize, Clone)]
pub struct Release {
    pub id: String,
    pub slug: String,
    pub name: String,
    pub created_at: NaiveDate,
    pub cover: Cover,
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
}

#[derive(Deserialize, Clone)]
pub struct RelatedRelease {
    pub id: String,
    pub slug: String,
    pub name: String,
    pub created_at: NaiveDate,
    pub cover: Cover,
    pub genres: Vec<String>,
    pub tags: Vec<String>,
}

trait ReleaseTags {
    fn get_tags(&self) -> Vec<String>;
    fn get_genres(&self) -> Vec<String>;

    fn get_tags_objects(&self) -> Vec<Tag> {
        DATA.tags
            .tags
            .iter()
            .filter(|x| self.get_tags().contains(&x.slug))
            .cloned()
            .collect()
    }
    fn get_genres_objects(&self) -> Vec<Tag> {
        DATA.tags
            .tags
            .iter()
            .filter(|x| self.get_genres().contains(&x.slug))
            .cloned()
            .collect()
    }
}

trait ReleaseRelated {
    fn get_related(&self) -> Vec<String>;

    fn get_related_objects(&self) -> Vec<RelatedRelease> {
        DATA.releases
            .releases
            .iter()
            .filter(|x| self.get_related().contains(&x.id))
            .map(|x| RelatedRelease::from(x.clone()))
            .collect()
    }
}

impl ReleaseTags for Release {
    fn get_tags(&self) -> Vec<String> {
        self.tags.clone()
    }
    fn get_genres(&self) -> Vec<String> {
        self.genres.clone()
    }
}

impl ReleaseRelated for Release {
    fn get_related(&self) -> Vec<String> {
        self.related.clone()
    }
}

impl ReleaseTags for RelatedRelease {
    fn get_tags(&self) -> Vec<String> {
        self.tags.clone()
    }
    fn get_genres(&self) -> Vec<String> {
        self.genres.clone()
    }
}

impl serde::ser::Serialize for Release {
    fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
    where
        S: serde::ser::Serializer,
    {
        let mut state = serializer.serialize_struct("Release", 3)?;
        state.serialize_field("id", &self.id)?;
        state.serialize_field("slug", &self.slug)?;
        state.serialize_field("name", &self.name)?;
        state.serialize_field("created_at", &self.created_at)?;
        state.serialize_field("summary", &self.summary)?;
        state.serialize_field("description", &self.description)?;
        state.serialize_field("catnum", &self.catnum)?;
        state.serialize_field("quality", &self.quality)?;
        state.serialize_field("length", &self.length)?;
        state.serialize_field("tracklist", &self.tracklist)?;
        state.serialize_field("viewed", &self.viewed)?;
        state.serialize_field("original", &self.original)?;
        state.serialize_field("release", &self.release)?;
        state.serialize_field("preview", &self.preview)?;
        state.serialize_field("cover", &self.cover)?;
        state.serialize_field("tags", &self.get_tags_objects())?;
        state.serialize_field("genres", &self.get_genres_objects())?;
        state.serialize_field("related", &self.get_related_objects())?;
        state.end()
    }
}

impl From<Release> for RelatedRelease {
    fn from(r: Release) -> Self {
        Self {
            id: r.id,
            slug: r.slug,
            name: r.name,
            created_at: r.created_at,
            cover: r.cover,
            genres: r.genres,
            tags: r.tags,
        }
    }
}

impl serde::ser::Serialize for RelatedRelease {
    fn serialize<S>(&self, serializer: S) -> Result<S::Ok, S::Error>
    where
        S: serde::ser::Serializer,
    {
        let mut state = serializer.serialize_struct("Release", 3)?;
        state.serialize_field("id", &self.id)?;
        state.serialize_field("slug", &self.slug)?;
        state.serialize_field("name", &self.name)?;
        state.serialize_field("created_at", &self.created_at)?;
        state.serialize_field("cover", &self.cover)?;
        state.serialize_field("tags", &self.get_tags_objects())?;
        state.serialize_field("genres", &self.get_genres_objects())?;
        state.end()
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

    pub fn get(&self, slug: String) -> Option<Release> {
        self.releases.iter().find(|x| x.slug == slug).cloned()
    }
}

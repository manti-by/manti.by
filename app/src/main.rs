#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate rocket;

use rocket::response::content;
use rocket_contrib::templates::Template;
use serde::{Deserialize, Serialize};
use serde_json::json;
use std::fs::File;
use std::io::BufReader;

#[derive(Serialize, Deserialize)]
struct Tag {
    slug: String,
    name: String,
}

#[derive(Serialize, Deserialize)]
struct Tags {
    tags: Vec<Tag>,
}

fn get_tags() -> serde_json::Result<Tags> {
    let file = File::open("../content/tags.json").unwrap();
    let reader = BufReader::new(file);
    let tags: Tags = serde_json::from_reader(reader)?;
    Ok(tags)
}

#[derive(Serialize, Deserialize)]
struct Attachment {
    mp3: String,
    ogg: String,
}

#[derive(Serialize, Deserialize)]
struct Cover {
    original: String,
    display: String,
    preview: String,
    thumbnail: String,
}

#[derive(Serialize, Deserialize)]
struct Release {
    id: String,
    slug: String,
    name: String,
    created_at: String,
    summary: String,
    description: String,
    catnum: String,
    quality: String,
    length: String,
    tracklist: String,
    viewed: u16,
    genres: Vec<String>,
    tags: Vec<String>,
    related: Vec<String>,
    original: String,
    release: Attachment,
    preview: Attachment,
    cover: Cover,
}

#[derive(Serialize, Deserialize)]
struct Releases {
    releases: Vec<Release>,
}

fn get_releases() -> serde_json::Result<Releases> {
    let file = File::open("../content/releases.json").unwrap();
    let reader = BufReader::new(file);
    let releases: Releases = serde_json::from_reader(reader)?;
    Ok(releases)
}

#[derive(Serialize, Deserialize)]
struct Image {
    id: i16,
    original: String,
    display: String,
    preview: String,
    thumbnail: String,
}

#[derive(Serialize, Deserialize)]
struct Gallery {
    images: Vec<Image>,
}

fn get_gallery() -> serde_json::Result<Gallery> {
    let file = File::open("../content/gallery.json").unwrap();
    let reader = BufReader::new(file);
    let gallery: Gallery = serde_json::from_reader(reader)?;
    Ok(gallery)
}

#[derive(Serialize, Deserialize)]
struct IndexContext {
    featured_image: Image,
    tags: Tags,
    gallery: Gallery,
    releases: Releases,
}

fn get_index_context() -> Result<IndexContext, serde_json::Error> {
    Ok(IndexContext {
        featured_image: Image {
            id: 44,
            original: String::from("/content/gallery/44_Quattro-Corti.jpg"),
            display: String::from("/content/gallery/44_Quattro-Corti.display.webp"),
            preview: String::from("/content/gallery/44_Quattro-Corti.preview.webp"),
            thumbnail: String::from("/content/gallery/44_Quattro-Corti.thumbnail.webp"),
        },
        tags: get_tags()?,
        gallery: get_gallery()?,
        releases: get_releases()?,
    })
}

#[get("/")]
fn index() -> Template {
    match get_index_context() {
        Ok(context) => Template::render("index", context),
        Err(e) => {
            let context = json!({"message": e.to_string()});
            Template::render("error", context)
        }
    }
}

#[get("/about")]
fn about() -> Template {
    let context = json!({});
    Template::render("about", context)
}


#[derive(Serialize, Deserialize)]
struct BlogContext {
    tags: Tags,
    gallery: Gallery,
    releases: Releases,
}

fn get_blog_context() -> Result<BlogContext, serde_json::Error> {
    Ok(BlogContext {
        tags: get_tags()?,
        gallery: get_gallery()?,
        releases: get_releases()?,
    })
}

#[get("/blog")]
fn blog() -> Template {
    match get_blog_context() {
        Ok(context) => Template::render("blog", context),
        Err(e) => {
            let context = json!({"message": e.to_string()});
            Template::render("error", context)
        }
    }
}

#[get("/gallery")]
fn gallery() -> Template {
    match get_gallery() {
        Ok(context) => Template::render("gallery", context),
        Err(e) => {
            let context = json!({"message": e.to_string()});
            Template::render("error", context)
        }
    }
}

#[get("/dashboard")]
fn dashboard() -> Template {
    let context = json!({});
    Template::render("dashboard", context)
}

#[get("/api")]
fn api() -> content::Json<String> {
    let json_result = match get_releases() {
        Ok(context) => serde_json::to_string(&context),
        Err(e) => {
            let context = json!({"message": e.to_string()});
            serde_json::to_string(&context)
        }
    };
    content::Json(json_result.unwrap())
}

fn main() {
    rocket::ignite()
        .attach(Template::fairing())
        .mount("/", routes![index, blog, gallery, api, about, dashboard])
        .launch();
}

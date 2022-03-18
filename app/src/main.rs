#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate rocket;

use rocket::response::content;
use rocket_contrib::templates::Template;
use serde::{Serialize, Deserialize};
use serde_json::json;
use std::fs::File;
use std::io::BufReader;

#[get("/")]
fn index() -> Template {
    let context = json!({
        "featured_image": {
            "id": 44,
            "display": "/content/gallery/44_Quattro-Corti.display.webp",
            "preview": "/content/gallery/44_Quattro-Corti.preview.webp",
            "thumbnail": "/content/gallery/44_Quattro-Corti.thumbnail.webp",
        },
        "featured_posts": [],
        "latest_images": [],
        "latest_posts": [],
        "tags": [],
        "posts": [],
    });
    Template::render("index", context)
}

#[get("/about")]
fn about() -> Template {
    let context = json!({});
    Template::render("about", context)
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
struct Blog {
    tags: Vec<String>,
    posts: Vec<String>,
    releases: Vec<Release>,
}

fn get_blog_context() -> serde_json::Result<Blog> {
    let file = File::open("../content/releases.json").unwrap();
    let reader = BufReader::new(file);
    let mut blog: Blog = serde_json::from_reader(reader)?;
    blog.releases.reverse();
    Ok(blog)
}

#[get("/blog")]
fn blog() -> Template {
    match get_blog_context() {
        Ok(context) => {
            Template::render("blog", context)
        },
        Err(e) => {
            let context = json!({"message": e.to_string()});
            Template::render("error", context)
        }
    }
}

#[derive(Serialize, Deserialize)]
struct Image {
    id: u32,
    original: String,
    display: String,
    preview: String,
    thumbnail: String,
}

#[derive(Serialize, Deserialize)]
struct Gallery {
    images: Vec<Image>,
}

fn get_gallery_context() -> serde_json::Result<Gallery> {
    let file = File::open("../content/gallery.json").unwrap();
    let reader = BufReader::new(file);
    let mut gallery: Gallery = serde_json::from_reader(reader)?;
    gallery.images.reverse();
    Ok(gallery)
}

#[get("/gallery")]
fn gallery() -> Template {
    match get_gallery_context() {
        Ok(context) => {
            Template::render("gallery", context)
        },
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
fn api() -> content::Json<&'static str> {
    content::Json("{[]}")
}

fn main() {
    rocket::ignite()
        .attach(Template::fairing())
        .mount("/", routes![index, blog, gallery, api, about, dashboard])
        .launch();
}

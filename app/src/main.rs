#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate rocket;

mod data;
mod images;
mod releases;
mod tags;

use rocket::response::content;
use rocket_contrib::templates::Template;
use serde::{Deserialize, Serialize};
use serde_json::json;
use std::error::Error;

use crate::data::DATA;
use crate::images::Image;
use crate::releases::Release;
use crate::tags::Tag;

#[derive(Serialize, Deserialize)]
struct IndexContext {
    pub featured_image: Image,
    pub featured_releases: Vec<Release>,
    pub front_releases: Vec<Release>,
    pub releases: Vec<Release>,
    pub images: Vec<Image>,
    pub tags: Vec<Tag>,
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
        featured_releases: DATA.releases.featured(),
        front_releases: DATA.releases.front(),
        releases: DATA.releases.latest(),
        images: DATA.images.latest(),
        tags: DATA.tags.popular(),
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
    pub tags: Vec<Tag>,
    pub releases: Vec<Release>,
}

fn get_blog_context() -> Result<BlogContext, serde_json::Error> {
    Ok(BlogContext {
        releases: DATA.releases.latest(),
        tags: DATA.tags.popular(),
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

#[derive(Serialize, Deserialize)]
struct PostContext {
    pub post: Release,
}

fn get_post_context(slug: String) -> Result<PostContext, Box<dyn Error>> {
    match DATA.releases.get(slug) {
        Some(post) => Ok(PostContext { post }),
        None => panic!("Post not found"),
    }
}

#[get("/post/<slug>")]
fn post(slug: String) -> Template {
    match get_post_context(slug) {
        Ok(context) => Template::render("post", context),
        Err(e) => {
            let context = json!({"message": e.to_string()});
            Template::render("error", context)
        }
    }
}

#[derive(Serialize, Deserialize)]
struct GalleryContext {
    pub images: Vec<Image>,
}

fn get_gallery_context() -> Result<GalleryContext, serde_json::Error> {
    Ok(GalleryContext {
        images: DATA.images.latest(),
    })
}

#[get("/gallery")]
fn gallery() -> Template {
    match get_gallery_context() {
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
    let json_result = serde_json::to_string(&DATA.releases.latest());
    content::Json(json_result.unwrap())
}

fn main() {
    rocket::ignite()
        .attach(Template::fairing())
        .mount(
            "/",
            routes![index, blog, post, gallery, api, about, dashboard],
        )
        .launch();
}

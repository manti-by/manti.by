#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use]
extern crate rocket;

mod data;
mod images;
mod releases;
mod tags;

use rocket::response::content;
use rocket::response::content::Json;
use rocket_contrib::templates::Template;
use serde::{Deserialize, Serialize};
use serde_json::json;
use std::error::Error;

use crate::data::DATA;
use crate::images::{FeaturedImage, Image};
use crate::releases::Release;
use crate::tags::Tag;

#[derive(Serialize, Deserialize)]
struct IndexContext {
    pub featured_image: FeaturedImage,
    pub featured_releases: Vec<Release>,
    pub front_releases: Vec<Release>,
    pub releases: Vec<Release>,
    pub latest: Vec<Release>,
    pub images: Vec<Image>,
    pub tags: Vec<Tag>,
}

fn get_index_context() -> Result<IndexContext, serde_json::Error> {
    Ok(IndexContext {
        featured_image: FeaturedImage {
            display: String::from("/static/img/featured.display.webp"),
            thumbnail: String::from("/static/img/featured.thumbnail.webp"),
        },
        featured_releases: DATA.releases.featured(),
        front_releases: DATA.releases.front(),
        releases: DATA.releases.latest(),
        latest: DATA.releases.latest(),
        images: DATA.images.latest(),
        tags: DATA.popular_tags.to_owned(),
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
    pub releases: Vec<Release>,
    pub latest: Vec<Release>,
    pub tags: Vec<Tag>,
}

fn get_blog_context(tag: Option<String>) -> Result<BlogContext, serde_json::Error> {
    let releases = match tag {
        Some(tag) => DATA.releases.filter(tag),
        None => DATA.releases.latest(),
    };
    Ok(BlogContext {
        releases,
        latest: DATA.releases.latest(),
        tags: DATA.popular_tags.to_owned(),
    })
}

#[get("/blog?<tag>")]
fn blog(tag: Option<String>) -> Template {
    match get_blog_context(tag) {
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

#[get("/api?<start>&<limit>", rank = 1)]
fn json_api(start: Option<usize>, limit: Option<usize>) -> Json<String> {
    let releases = DATA.releases.paginate(start, limit);
    let json_result = serde_json::to_string(&releases);
    content::Json(json_result.unwrap())
}

#[get("/api?<query>", rank = 2)]
fn search(query: String) -> content::Json<String> {
    let json_result = serde_json::to_string(&DATA.releases.search(query));
    content::Json(json_result.unwrap())
}

#[derive(Serialize, Deserialize)]
struct ApiReleases {
    releases: Vec<Release>,
}

#[get("/api?format=html&<start>&<limit>", rank = 3)]
fn html_api(start: Option<usize>, limit: Option<usize>) -> Template {
    let releases = DATA.releases.paginate(start, limit);

    let context = ApiReleases { releases };
    Template::render("releases", context)
}

fn main() {
    rocket::ignite()
        .attach(Template::fairing())
        .mount(
            "/",
            routes![index, blog, post, gallery, search, json_api, html_api, about],
        )
        .launch();
}

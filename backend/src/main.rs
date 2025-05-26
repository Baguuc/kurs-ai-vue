pub mod prelude;
pub mod error;
pub mod utils;
pub mod routes;

use clorinde::deadpool_postgres::{Config, CreatePoolError, Pool, Runtime};
use clorinde::tokio_postgres::NoTls;
use prelude::*;
use rocket::http::Header;
use rocket::{Request, Response};
use rocket::fairing::{Fairing, Info, Kind};

pub struct CORS;

#[rocket::async_trait]
impl Fairing for CORS {
    fn info(&self) -> Info {
        Info {
            name: "Add CORS headers to responses",
            kind: Kind::Response,
        }
    }

    async fn on_response<'r>(&self, _request: &'r Request<'_>, response: &mut Response<'r>) {
        response.set_header(Header::new("Access-Control-Allow-Origin", "http://localhost:5173"));
        response.set_header(Header::new("Access-Control-Allow-Methods", "POST, GET"));
        response.set_header(Header::new("Access-Control-Allow-Headers", "*"));
        response.set_header(Header::new("Access-Control-Allow-Credentials", "true"));
    }
}

#[rocket::launch]
async fn rocket() -> _ {
    let pool = create_pool()
        .await
        .expect("Cannot create the database pool!");
    
    rocket::build()
        .attach(CORS)
        .manage(pool)
        .mount("/", rocket::routes![routes::health::health])
        .mount("/courses", rocket::routes![routes::courses::list_courses, routes::courses::fetch_course])
}

async fn create_pool() -> Result<Pool> {
    let mut cfg = Config::new();
    cfg.user = Some(String::from("bagu"));
    cfg.password = Some(String::from("123"));
    cfg.host = Some(String::from("127.0.0.1"));
    cfg.port = Some(5432);
    cfg.dbname = Some(String::from("course_test"));

    return Ok(cfg.create_pool(Some(Runtime::Tokio1), NoTls)?);
}

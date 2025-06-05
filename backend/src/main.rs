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
use dotenv::dotenv;
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
        let allowed_hosts = dotenv::var("CORS_ALLOWED_HOSTS")
            .expect("Cannot read CORS_ALLOWED_HOSTS from environment");

        response.set_header(Header::new("Access-Control-Allow-Origin", allowed_hosts));
        response.set_header(Header::new("Access-Control-Allow-Methods", "POST, GET"));
        response.set_header(Header::new("Access-Control-Allow-Headers", "*"));
        response.set_header(Header::new("Access-Control-Allow-Credentials", "true"));
    }
}

#[rocket::launch]
async fn rocket() -> _ {
    dotenv().ok();

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

    let username = dotenv::var("POSTGRES_USERNAME")
        .expect("Cannot read POSTGRES_USERNAME from environment.");
    
    let password = dotenv::var("POSTGRES_PASSWORD")
        .expect("Cannot read POSTGRES_PASSWORD from environment.");
    
    let host = dotenv::var("POSTGRES_HOST")
        .expect("Cannot read POSTGRES_HOST from environment.");
    
    let port: u16 = dotenv::var("POSTGRES_PORT")
        .expect("Cannot read POSTGRES_PORT from environment.")
        .parse()
        .expect("Cannot read POSTGRES_PORT, invalid value");
    
    let database_name = dotenv::var("POSTGRES_DATABASE")
        .expect("Cannot read POSTGRES_DATABASE from environment.");
    
    cfg.user = Some(username);
    cfg.password = Some(password);
    cfg.host = Some(host);
    cfg.port = Some(port);
    cfg.dbname = Some(database_name);

    return Ok(cfg.create_pool(Some(Runtime::Tokio1), NoTls)?);
}

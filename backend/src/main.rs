pub mod prelude;
pub mod error;
pub mod utils;
pub mod routes;

use clorinde::deadpool_postgres::{Config, CreatePoolError, Pool, Runtime};
use clorinde::tokio_postgres::NoTls;
use prelude::*;

#[rocket::launch]
async fn rocket() -> _ {
    let pool = create_pool()
        .await
        .expect("Cannot create the database pool!");
    
    rocket::build()
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

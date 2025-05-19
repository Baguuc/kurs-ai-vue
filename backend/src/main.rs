pub mod prelude;
pub mod error;
pub mod utils;

use clorinde::deadpool_postgres::{Config, CreatePoolError, Pool, Runtime};
use clorinde::tokio_postgres::NoTls;

// code to test queries from clorind, don't bothere
#[tokio::main]
async fn main() {
    let pool = match create_pool().await {
        Ok(res) => res,
        Err(_) => panic!("Cannot connect to database")
    };
    let client = pool
        .get()
        .await
        .unwrap();
    
    let mut query = clorinde::queries::courses::list_courses();
    let courses = query
        .bind(&client)
        .all()
        .await
        .unwrap();
    
    println!("{:?}", courses);
}

async fn create_pool() -> Result<Pool, CreatePoolError> {
    let mut cfg = Config::new();
    cfg.user = Some(String::from("bagu"));
    cfg.password = Some(String::from("123"));
    cfg.host = Some(String::from("127.0.0.1"));
    cfg.port = Some(5432);
    cfg.dbname = Some(String::from("course_test"));
    cfg.create_pool(Some(Runtime::Tokio1), NoTls)
}

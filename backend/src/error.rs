#[derive(thiserror::Error, Debug)]
pub enum Error {
    #[error("Generic {0}")]
    Generic(String),
    #[error(transparent)]
    IO(#[from] std::io::Error),
    #[error(transparent)]
    Query(#[from] clorinde::tokio_postgres::Error),
    #[error(transparent)]
    CreatePool(#[from] clorinde::deadpool_postgres::CreatePoolError)
}

// This file was generated with `clorinde`. Do not modify.

#[derive(Debug)]
pub struct InsertEpisodeParams<
    T1: crate::StringSql,
    T2: crate::StringSql,
    T3: crate::StringSql,
> {
    pub no: T1,
    pub title: T2,
    pub content: T3,
}
use futures::{self, StreamExt, TryStreamExt};
use crate::client::async_::GenericClient;
pub fn insert_episode() -> InsertEpisodeStmt {
    InsertEpisodeStmt(
        crate::client::async_::Stmt::new(
            "INSERT INTO episodes (no, title, content) VALUES ($1, $2, $3)",
        ),
    )
}
pub struct InsertEpisodeStmt(crate::client::async_::Stmt);
impl InsertEpisodeStmt {
    pub async fn bind<
        'c,
        'a,
        's,
        C: GenericClient,
        T1: crate::StringSql,
        T2: crate::StringSql,
        T3: crate::StringSql,
    >(
        &'s mut self,
        client: &'c C,
        no: &'a T1,
        title: &'a T2,
        content: &'a T3,
    ) -> Result<u64, tokio_postgres::Error> {
        let stmt = self.0.prepare(client).await?;
        client.execute(stmt, &[no, title, content]).await
    }
}
impl<
    'a,
    C: GenericClient + Send + Sync,
    T1: crate::StringSql,
    T2: crate::StringSql,
    T3: crate::StringSql,
> crate::client::async_::Params<
    'a,
    'a,
    'a,
    InsertEpisodeParams<T1, T2, T3>,
    std::pin::Pin<
        Box<dyn futures::Future<Output = Result<u64, tokio_postgres::Error>> + Send + 'a>,
    >,
    C,
> for InsertEpisodeStmt {
    fn params(
        &'a mut self,
        client: &'a C,
        params: &'a InsertEpisodeParams<T1, T2, T3>,
    ) -> std::pin::Pin<
        Box<dyn futures::Future<Output = Result<u64, tokio_postgres::Error>> + Send + 'a>,
    > {
        Box::pin(self.bind(client, &params.no, &params.title, &params.content))
    }
}

// This file was generated with `clorinde`. Do not modify.

#[derive(Debug)]
pub struct InsertModuleParams<T1: crate::StringSql, T2: crate::StringSql> {
    pub no: T1,
    pub title: T2,
}
use futures::{self, StreamExt, TryStreamExt};
use crate::client::async_::GenericClient;
pub fn insert_module() -> InsertModuleStmt {
    InsertModuleStmt(
        crate::client::async_::Stmt::new(
            "INSERT INTO modules (no, title) VALUES ($1, $2)",
        ),
    )
}
pub struct InsertModuleStmt(crate::client::async_::Stmt);
impl InsertModuleStmt {
    pub async fn bind<
        'c,
        'a,
        's,
        C: GenericClient,
        T1: crate::StringSql,
        T2: crate::StringSql,
    >(
        &'s mut self,
        client: &'c C,
        no: &'a T1,
        title: &'a T2,
    ) -> Result<u64, tokio_postgres::Error> {
        let stmt = self.0.prepare(client).await?;
        client.execute(stmt, &[no, title]).await
    }
}
impl<
    'a,
    C: GenericClient + Send + Sync,
    T1: crate::StringSql,
    T2: crate::StringSql,
> crate::client::async_::Params<
    'a,
    'a,
    'a,
    InsertModuleParams<T1, T2>,
    std::pin::Pin<
        Box<dyn futures::Future<Output = Result<u64, tokio_postgres::Error>> + Send + 'a>,
    >,
    C,
> for InsertModuleStmt {
    fn params(
        &'a mut self,
        client: &'a C,
        params: &'a InsertModuleParams<T1, T2>,
    ) -> std::pin::Pin<
        Box<dyn futures::Future<Output = Result<u64, tokio_postgres::Error>> + Send + 'a>,
    > {
        Box::pin(self.bind(client, &params.no, &params.title))
    }
}

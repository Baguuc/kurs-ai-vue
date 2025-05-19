// This file was generated with `clorinde`. Do not modify.

#[derive(Debug, Clone, PartialEq)]
pub struct ListCourses {
    pub id: i32,
    pub name: String,
    pub modules: Vec<crate::types::Module>,
}
pub struct ListCoursesBorrowed<'a> {
    pub id: i32,
    pub name: &'a str,
    pub modules: crate::ArrayIterator<'a, crate::types::ModuleBorrowed<'a>>,
}
impl<'a> From<ListCoursesBorrowed<'a>> for ListCourses {
    fn from(ListCoursesBorrowed { id, name, modules }: ListCoursesBorrowed<'a>) -> Self {
        Self {
            id,
            name: name.into(),
            modules: modules.map(|v| v.into()).collect(),
        }
    }
}
#[derive(Debug, Clone, PartialEq)]
pub struct FetchCourse {
    pub id: i32,
    pub name: String,
    pub modules: Vec<crate::types::Module>,
}
pub struct FetchCourseBorrowed<'a> {
    pub id: i32,
    pub name: &'a str,
    pub modules: crate::ArrayIterator<'a, crate::types::ModuleBorrowed<'a>>,
}
impl<'a> From<FetchCourseBorrowed<'a>> for FetchCourse {
    fn from(FetchCourseBorrowed { id, name, modules }: FetchCourseBorrowed<'a>) -> Self {
        Self {
            id,
            name: name.into(),
            modules: modules.map(|v| v.into()).collect(),
        }
    }
}
use futures::{self, StreamExt, TryStreamExt};
use crate::client::async_::GenericClient;
pub struct ListCoursesQuery<'c, 'a, 's, C: GenericClient, T, const N: usize> {
    client: &'c C,
    params: [&'a (dyn postgres_types::ToSql + Sync); N],
    stmt: &'s mut crate::client::async_::Stmt,
    extractor: fn(
        &tokio_postgres::Row,
    ) -> Result<ListCoursesBorrowed, tokio_postgres::Error>,
    mapper: fn(ListCoursesBorrowed) -> T,
}
impl<'c, 'a, 's, C, T: 'c, const N: usize> ListCoursesQuery<'c, 'a, 's, C, T, N>
where
    C: GenericClient,
{
    pub fn map<R>(
        self,
        mapper: fn(ListCoursesBorrowed) -> R,
    ) -> ListCoursesQuery<'c, 'a, 's, C, R, N> {
        ListCoursesQuery {
            client: self.client,
            params: self.params,
            stmt: self.stmt,
            extractor: self.extractor,
            mapper,
        }
    }
    pub async fn one(self) -> Result<T, tokio_postgres::Error> {
        let stmt = self.stmt.prepare(self.client).await?;
        let row = self.client.query_one(stmt, &self.params).await?;
        Ok((self.mapper)((self.extractor)(&row)?))
    }
    pub async fn all(self) -> Result<Vec<T>, tokio_postgres::Error> {
        self.iter().await?.try_collect().await
    }
    pub async fn opt(self) -> Result<Option<T>, tokio_postgres::Error> {
        let stmt = self.stmt.prepare(self.client).await?;
        Ok(
            self
                .client
                .query_opt(stmt, &self.params)
                .await?
                .map(|row| {
                    let extracted = (self.extractor)(&row)?;
                    Ok((self.mapper)(extracted))
                })
                .transpose()?,
        )
    }
    pub async fn iter(
        self,
    ) -> Result<
        impl futures::Stream<Item = Result<T, tokio_postgres::Error>> + 'c,
        tokio_postgres::Error,
    > {
        let stmt = self.stmt.prepare(self.client).await?;
        let it = self
            .client
            .query_raw(stmt, crate::slice_iter(&self.params))
            .await?
            .map(move |res| {
                res
                    .and_then(|row| {
                        let extracted = (self.extractor)(&row)?;
                        Ok((self.mapper)(extracted))
                    })
            })
            .into_stream();
        Ok(it)
    }
}
pub struct FetchCourseQuery<'c, 'a, 's, C: GenericClient, T, const N: usize> {
    client: &'c C,
    params: [&'a (dyn postgres_types::ToSql + Sync); N],
    stmt: &'s mut crate::client::async_::Stmt,
    extractor: fn(
        &tokio_postgres::Row,
    ) -> Result<FetchCourseBorrowed, tokio_postgres::Error>,
    mapper: fn(FetchCourseBorrowed) -> T,
}
impl<'c, 'a, 's, C, T: 'c, const N: usize> FetchCourseQuery<'c, 'a, 's, C, T, N>
where
    C: GenericClient,
{
    pub fn map<R>(
        self,
        mapper: fn(FetchCourseBorrowed) -> R,
    ) -> FetchCourseQuery<'c, 'a, 's, C, R, N> {
        FetchCourseQuery {
            client: self.client,
            params: self.params,
            stmt: self.stmt,
            extractor: self.extractor,
            mapper,
        }
    }
    pub async fn one(self) -> Result<T, tokio_postgres::Error> {
        let stmt = self.stmt.prepare(self.client).await?;
        let row = self.client.query_one(stmt, &self.params).await?;
        Ok((self.mapper)((self.extractor)(&row)?))
    }
    pub async fn all(self) -> Result<Vec<T>, tokio_postgres::Error> {
        self.iter().await?.try_collect().await
    }
    pub async fn opt(self) -> Result<Option<T>, tokio_postgres::Error> {
        let stmt = self.stmt.prepare(self.client).await?;
        Ok(
            self
                .client
                .query_opt(stmt, &self.params)
                .await?
                .map(|row| {
                    let extracted = (self.extractor)(&row)?;
                    Ok((self.mapper)(extracted))
                })
                .transpose()?,
        )
    }
    pub async fn iter(
        self,
    ) -> Result<
        impl futures::Stream<Item = Result<T, tokio_postgres::Error>> + 'c,
        tokio_postgres::Error,
    > {
        let stmt = self.stmt.prepare(self.client).await?;
        let it = self
            .client
            .query_raw(stmt, crate::slice_iter(&self.params))
            .await?
            .map(move |res| {
                res
                    .and_then(|row| {
                        let extracted = (self.extractor)(&row)?;
                        Ok((self.mapper)(extracted))
                    })
            })
            .into_stream();
        Ok(it)
    }
}
pub fn insert_course() -> InsertCourseStmt {
    InsertCourseStmt(
        crate::client::async_::Stmt::new("INSERT INTO courses (name) VALUES ($1)"),
    )
}
pub struct InsertCourseStmt(crate::client::async_::Stmt);
impl InsertCourseStmt {
    pub async fn bind<'c, 'a, 's, C: GenericClient, T1: crate::StringSql>(
        &'s mut self,
        client: &'c C,
        name: &'a T1,
    ) -> Result<u64, tokio_postgres::Error> {
        let stmt = self.0.prepare(client).await?;
        client.execute(stmt, &[name]).await
    }
}
pub fn list_courses() -> ListCoursesStmt {
    ListCoursesStmt(
        crate::client::async_::Stmt::new(
            "SELECT courses.id, courses.name, ARRAY_AGG(CAST(ROW(tmp.id, tmp.no, tmp.title, tmp.episodes) AS MODULE)) as modules FROM ( SELECT modules.id AS id, modules.no AS no, modules.title AS title, array_agg(CAST(ROW(episodes.id, episodes.no, episodes.title, episodes.content) AS EPISODE)) AS episodes, modules.course_id as course_id FROM courses INNER JOIN modules ON modules.course_id = courses.id INNER JOIN episodes ON episodes.module_id = modules.id GROUP BY modules.id ) tmp INNER JOIN courses ON courses.id = tmp.course_id GROUP BY courses.id",
        ),
    )
}
pub struct ListCoursesStmt(crate::client::async_::Stmt);
impl ListCoursesStmt {
    pub fn bind<'c, 'a, 's, C: GenericClient>(
        &'s mut self,
        client: &'c C,
    ) -> ListCoursesQuery<'c, 'a, 's, C, ListCourses, 0> {
        ListCoursesQuery {
            client,
            params: [],
            stmt: &mut self.0,
            extractor: |
                row: &tokio_postgres::Row,
            | -> Result<ListCoursesBorrowed, tokio_postgres::Error> {
                Ok(ListCoursesBorrowed {
                    id: row.try_get(0)?,
                    name: row.try_get(1)?,
                    modules: row.try_get(2)?,
                })
            },
            mapper: |it| ListCourses::from(it),
        }
    }
}
pub fn fetch_course() -> FetchCourseStmt {
    FetchCourseStmt(
        crate::client::async_::Stmt::new(
            "SELECT courses.id, courses.name, ARRAY_AGG(CAST(ROW(tmp.id, tmp.no, tmp.title, tmp.episodes) AS MODULE)) as modules FROM ( SELECT modules.id AS id, modules.no AS no, modules.title AS title, array_agg(CAST(ROW(episodes.id, episodes.no, episodes.title, episodes.content) AS EPISODE)) AS episodes, modules.course_id as course_id FROM courses INNER JOIN modules ON modules.course_id = courses.id INNER JOIN episodes ON episodes.module_id = modules.id GROUP BY modules.id ) tmp INNER JOIN courses ON courses.id = tmp.course_id WHERE courses.id = $1 GROUP BY courses.id",
        ),
    )
}
pub struct FetchCourseStmt(crate::client::async_::Stmt);
impl FetchCourseStmt {
    pub fn bind<'c, 'a, 's, C: GenericClient>(
        &'s mut self,
        client: &'c C,
        course_id: &'a i32,
    ) -> FetchCourseQuery<'c, 'a, 's, C, FetchCourse, 1> {
        FetchCourseQuery {
            client,
            params: [course_id],
            stmt: &mut self.0,
            extractor: |
                row: &tokio_postgres::Row,
            | -> Result<FetchCourseBorrowed, tokio_postgres::Error> {
                Ok(FetchCourseBorrowed {
                    id: row.try_get(0)?,
                    name: row.try_get(1)?,
                    modules: row.try_get(2)?,
                })
            },
            mapper: |it| FetchCourse::from(it),
        }
    }
}

// This file was generated with `clorinde`. Do not modify.

#[cfg(all(feature = "chrono", not(feature = "time")))]
pub mod time {
    pub type Timestamp = chrono::NaiveDateTime;
    pub type TimestampTz = chrono::DateTime<chrono::FixedOffset>;
    pub type Date = chrono::NaiveDate;
    pub type Time = chrono::NaiveTime;
}
#[cfg(all(feature = "time", not(feature = "chrono")))]
pub mod time {
    pub type Timestamp = time::PrimitiveDateTime;
    pub type TimestampTz = time::OffsetDateTime;
    pub type Date = time::Date;
    pub type Time = time::Time;
}
#[derive(Debug, postgres_types::FromSql, Clone, PartialEq, serde::Serialize)]
#[postgres(name = "episode")]
pub struct Episode {
    #[postgres(name = "id")]
    pub id: i32,
    #[postgres(name = "no")]
    pub no: String,
    #[postgres(name = "title")]
    pub title: String,
    #[postgres(name = "content")]
    pub content: String,
}
#[derive(Debug)]
pub struct EpisodeBorrowed<'a> {
    pub id: i32,
    pub no: &'a str,
    pub title: &'a str,
    pub content: &'a str,
}
impl<'a> From<EpisodeBorrowed<'a>> for Episode {
    fn from(EpisodeBorrowed { id, no, title, content }: EpisodeBorrowed<'a>) -> Self {
        Self {
            id,
            no: no.into(),
            title: title.into(),
            content: content.into(),
        }
    }
}
impl<'a> postgres_types::FromSql<'a> for EpisodeBorrowed<'a> {
    fn from_sql(
        ty: &postgres_types::Type,
        out: &'a [u8],
    ) -> Result<EpisodeBorrowed<'a>, Box<dyn std::error::Error + Sync + Send>> {
        let fields = match *ty.kind() {
            postgres_types::Kind::Composite(ref fields) => fields,
            _ => unreachable!(),
        };
        let mut out = out;
        let num_fields = postgres_types::private::read_be_i32(&mut out)?;
        if num_fields as usize != fields.len() {
            return std::result::Result::Err(
                std::convert::Into::into(
                    format!("invalid field count: {} vs {}", num_fields, fields.len()),
                ),
            );
        }
        let _oid = postgres_types::private::read_be_i32(&mut out)?;
        let id = postgres_types::private::read_value(fields[0].type_(), &mut out)?;
        let _oid = postgres_types::private::read_be_i32(&mut out)?;
        let no = postgres_types::private::read_value(fields[1].type_(), &mut out)?;
        let _oid = postgres_types::private::read_be_i32(&mut out)?;
        let title = postgres_types::private::read_value(fields[2].type_(), &mut out)?;
        let _oid = postgres_types::private::read_be_i32(&mut out)?;
        let content = postgres_types::private::read_value(fields[3].type_(), &mut out)?;
        Ok(EpisodeBorrowed {
            id,
            no,
            title,
            content,
        })
    }
    fn accepts(ty: &postgres_types::Type) -> bool {
        ty.name() == "episode" && ty.schema() == "public"
    }
}
impl<'a> postgres_types::ToSql for EpisodeBorrowed<'a> {
    fn to_sql(
        &self,
        ty: &postgres_types::Type,
        out: &mut postgres_types::private::BytesMut,
    ) -> Result<postgres_types::IsNull, Box<dyn std::error::Error + Sync + Send>> {
        let EpisodeBorrowed { id, no, title, content } = self;
        let fields = match *ty.kind() {
            postgres_types::Kind::Composite(ref fields) => fields,
            _ => unreachable!(),
        };
        out.extend_from_slice(&(fields.len() as i32).to_be_bytes());
        for field in fields {
            out.extend_from_slice(&field.type_().oid().to_be_bytes());
            let base = out.len();
            out.extend_from_slice(&[0; 4]);
            let r = match field.name() {
                "id" => postgres_types::ToSql::to_sql(id, field.type_(), out),
                "no" => postgres_types::ToSql::to_sql(no, field.type_(), out),
                "title" => postgres_types::ToSql::to_sql(title, field.type_(), out),
                "content" => postgres_types::ToSql::to_sql(content, field.type_(), out),
                _ => unreachable!(),
            };
            let count = match r? {
                postgres_types::IsNull::Yes => -1,
                postgres_types::IsNull::No => {
                    let len = out.len() - base - 4;
                    if len > i32::MAX as usize {
                        return Err(Into::into("value too large to transmit"));
                    }
                    len as i32
                }
            };
            out[base..base + 4].copy_from_slice(&count.to_be_bytes());
        }
        Ok(postgres_types::IsNull::No)
    }
    fn accepts(ty: &postgres_types::Type) -> bool {
        if ty.name() != "episode" {
            return false;
        }
        match *ty.kind() {
            postgres_types::Kind::Composite(ref fields) => {
                if fields.len() != 4 {
                    return false;
                }
                fields
                    .iter()
                    .all(|f| match f.name() {
                        "id" => <i32 as postgres_types::ToSql>::accepts(f.type_()),
                        "no" => <&'a str as postgres_types::ToSql>::accepts(f.type_()),
                        "title" => <&'a str as postgres_types::ToSql>::accepts(f.type_()),
                        "content" => {
                            <&'a str as postgres_types::ToSql>::accepts(f.type_())
                        }
                        _ => false,
                    })
            }
            _ => false,
        }
    }
    fn to_sql_checked(
        &self,
        ty: &postgres_types::Type,
        out: &mut postgres_types::private::BytesMut,
    ) -> Result<postgres_types::IsNull, Box<dyn std::error::Error + Sync + Send>> {
        postgres_types::__to_sql_checked(self, ty, out)
    }
}
#[derive(Debug, postgres_types::FromSql, Clone, PartialEq, serde::Serialize)]
#[postgres(name = "module")]
pub struct Module {
    #[postgres(name = "id")]
    pub id: i32,
    #[postgres(name = "no")]
    pub no: String,
    #[postgres(name = "title")]
    pub title: String,
    #[postgres(name = "episodes")]
    pub episodes: Vec<Episode>,
}
#[derive(Debug)]
pub struct ModuleBorrowed<'a> {
    pub id: i32,
    pub no: &'a str,
    pub title: &'a str,
    pub episodes: crate::ArrayIterator<'a, EpisodeBorrowed<'a>>,
}
impl<'a> From<ModuleBorrowed<'a>> for Module {
    fn from(ModuleBorrowed { id, no, title, episodes }: ModuleBorrowed<'a>) -> Self {
        Self {
            id,
            no: no.into(),
            title: title.into(),
            episodes: episodes.map(|v| v.into()).collect(),
        }
    }
}
impl<'a> postgres_types::FromSql<'a> for ModuleBorrowed<'a> {
    fn from_sql(
        ty: &postgres_types::Type,
        out: &'a [u8],
    ) -> Result<ModuleBorrowed<'a>, Box<dyn std::error::Error + Sync + Send>> {
        let fields = match *ty.kind() {
            postgres_types::Kind::Composite(ref fields) => fields,
            _ => unreachable!(),
        };
        let mut out = out;
        let num_fields = postgres_types::private::read_be_i32(&mut out)?;
        if num_fields as usize != fields.len() {
            return std::result::Result::Err(
                std::convert::Into::into(
                    format!("invalid field count: {} vs {}", num_fields, fields.len()),
                ),
            );
        }
        let _oid = postgres_types::private::read_be_i32(&mut out)?;
        let id = postgres_types::private::read_value(fields[0].type_(), &mut out)?;
        let _oid = postgres_types::private::read_be_i32(&mut out)?;
        let no = postgres_types::private::read_value(fields[1].type_(), &mut out)?;
        let _oid = postgres_types::private::read_be_i32(&mut out)?;
        let title = postgres_types::private::read_value(fields[2].type_(), &mut out)?;
        let _oid = postgres_types::private::read_be_i32(&mut out)?;
        let episodes = postgres_types::private::read_value(fields[3].type_(), &mut out)?;
        Ok(ModuleBorrowed {
            id,
            no,
            title,
            episodes,
        })
    }
    fn accepts(ty: &postgres_types::Type) -> bool {
        ty.name() == "module" && ty.schema() == "public"
    }
}
#[derive(Debug)]
pub struct ModuleParams<'a> {
    pub id: i32,
    pub no: &'a str,
    pub title: &'a str,
    pub episodes: &'a [EpisodeBorrowed<'a>],
}
impl<'a> postgres_types::ToSql for ModuleParams<'a> {
    fn to_sql(
        &self,
        ty: &postgres_types::Type,
        out: &mut postgres_types::private::BytesMut,
    ) -> Result<postgres_types::IsNull, Box<dyn std::error::Error + Sync + Send>> {
        let ModuleParams { id, no, title, episodes } = self;
        let fields = match *ty.kind() {
            postgres_types::Kind::Composite(ref fields) => fields,
            _ => unreachable!(),
        };
        out.extend_from_slice(&(fields.len() as i32).to_be_bytes());
        for field in fields {
            out.extend_from_slice(&field.type_().oid().to_be_bytes());
            let base = out.len();
            out.extend_from_slice(&[0; 4]);
            let r = match field.name() {
                "id" => postgres_types::ToSql::to_sql(id, field.type_(), out),
                "no" => postgres_types::ToSql::to_sql(no, field.type_(), out),
                "title" => postgres_types::ToSql::to_sql(title, field.type_(), out),
                "episodes" => postgres_types::ToSql::to_sql(episodes, field.type_(), out),
                _ => unreachable!(),
            };
            let count = match r? {
                postgres_types::IsNull::Yes => -1,
                postgres_types::IsNull::No => {
                    let len = out.len() - base - 4;
                    if len > i32::MAX as usize {
                        return Err(Into::into("value too large to transmit"));
                    }
                    len as i32
                }
            };
            out[base..base + 4].copy_from_slice(&count.to_be_bytes());
        }
        Ok(postgres_types::IsNull::No)
    }
    fn accepts(ty: &postgres_types::Type) -> bool {
        if ty.name() != "module" {
            return false;
        }
        match *ty.kind() {
            postgres_types::Kind::Composite(ref fields) => {
                if fields.len() != 4 {
                    return false;
                }
                fields
                    .iter()
                    .all(|f| match f.name() {
                        "id" => <i32 as postgres_types::ToSql>::accepts(f.type_()),
                        "no" => <&'a str as postgres_types::ToSql>::accepts(f.type_()),
                        "title" => <&'a str as postgres_types::ToSql>::accepts(f.type_()),
                        "episodes" => {
                            <&'a [EpisodeBorrowed<
                                'a,
                            >] as postgres_types::ToSql>::accepts(f.type_())
                        }
                        _ => false,
                    })
            }
            _ => false,
        }
    }
    fn to_sql_checked(
        &self,
        ty: &postgres_types::Type,
        out: &mut postgres_types::private::BytesMut,
    ) -> Result<postgres_types::IsNull, Box<dyn std::error::Error + Sync + Send>> {
        postgres_types::__to_sql_checked(self, ty, out)
    }
}

#[derive(rocket::Responder)]
pub struct ListCoursesOkResponse(rocket::serde::json::Json<Vec<clorinde::queries::courses::ListCourses>>);

#[derive(rocket::Responder)]
#[response(status = 502)]
pub struct ListCoursesErrResponse(String);

#[derive(rocket::Responder)]
pub enum ListCoursesResponse {
    Ok(ListCoursesOkResponse),
    Err(ListCoursesErrResponse)
}

#[rocket::get("/")]
pub async fn list_courses(pool: &rocket::State<clorinde::deadpool_postgres::Pool>) -> ListCoursesResponse {
    use clorinde::queries::courses::list_courses;
    
    let client = match pool.get().await {
        Err(err) => return ListCoursesResponse::Err(ListCoursesErrResponse(err.to_string())).into(),
        Ok(client) => client
    };

    let courses = match list_courses().bind(&client).all().await {
        Err(err) => return ListCoursesResponse::Err(ListCoursesErrResponse(err.to_string())).into(),
        Ok(courses) => courses
    };
    
    ListCoursesResponse::Ok(ListCoursesOkResponse(courses.into()))
}



#[derive(rocket::Responder)]
pub struct FetchCourseOkResponse(rocket::serde::json::Json<clorinde::queries::courses::FetchCourse>);

#[derive(rocket::Responder)]
#[response(status = 502)]
pub struct FetchCourseServerErrResponse(String);

#[derive(rocket::Responder)]
#[response(status = 404)]
pub struct FetchCourseClientErrResponse(String);

#[derive(rocket::Responder)]
pub enum FetchCourseResponse {
    Ok(FetchCourseOkResponse),
    ServerErr(FetchCourseServerErrResponse),
    ClientErr(FetchCourseClientErrResponse)
}

#[rocket::get("/<id>")]
pub async fn fetch_course(id: i32, pool: &rocket::State<clorinde::deadpool_postgres::Pool>) -> FetchCourseResponse {
    use clorinde::queries::courses::fetch_course;
    
    let client = match pool.get().await {
        Err(err) => return FetchCourseResponse::ServerErr(FetchCourseServerErrResponse(err.to_string())).into(),
        Ok(client) => client
    };

    let course = match fetch_course().bind(&client, &id).one().await {
        Err(err) => return FetchCourseResponse::ClientErr(FetchCourseClientErrResponse(String::from("Not found"))).into(),
        Ok(course) => course
    };
    
    FetchCourseResponse::Ok(FetchCourseOkResponse(course.into()))
}

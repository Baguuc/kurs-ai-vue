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

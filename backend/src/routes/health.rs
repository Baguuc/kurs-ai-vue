#[rocket::get("/")]
pub async fn health() -> String {
    String::from("Everything good!")
}

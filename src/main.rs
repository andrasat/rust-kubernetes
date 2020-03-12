use actix_web::{get, App, HttpServer, Responder};

#[get("/")]
async fn index() -> impl Responder {
    format!("Hello World !!!!!")
}

#[actix_rt::main]
async fn main() -> std::io::Result<()> {
    println!("Server running in port:8000");
    HttpServer::new(|| App::new().service(index))
        .bind("0.0.0.0:8000")?
        .run()
        .await
}

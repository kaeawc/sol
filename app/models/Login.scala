package models

import play.api.libs.json._
import play.api.libs.json.Json._

case class Login(
	username:String,
	password:String,
	remember:Option[String]
)

object Login {

	def validate(request:Login):Boolean = (request.password == "asdf")
}
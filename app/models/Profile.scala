package models

import play.api.libs.json._
import play.api.libs.json.Json._

case class Profile(
	username:String,
	email:String,
	name:String
)

object Profile {

	def validate(request:Profile):Boolean = (
		request.username.length > 3 &&
		request.email.length > 3 &&
		request.email.contains("@") &&
		request.name.length > 3)
}
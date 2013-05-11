package models

import play.api.libs.json._
import play.api.libs.json.Json._

case class Registration(
	email:String,
	password:String,
	name:String
)

object Registration {

	def validate(request:Registration):Boolean = (
		request.email.contains("@") &&
		request.password.length > 8 &&
		request.name.length > 3
	)
}
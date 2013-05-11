package models

import play.api.libs.json._
import play.api.libs.json.Json._

case class PasswordReset(
	oldPassword:String,
	newPassword:String,
	againPassword:String
)

object PasswordReset {

	def validate(request:PasswordReset):Boolean = (
		request.oldPassword == "asdf" &&
		request.newPassword == request.againPassword &&
		request.newPassword.length > 4)
}
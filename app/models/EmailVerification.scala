package models

import play.api.libs.json._
import play.api.libs.json.Json._

case class EmailVerification(
	code:String
)

object EmailVerification {

	def validate(request:EmailVerification):Boolean = (request.code == "LOLBBQFTW")
}
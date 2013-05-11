package auth

import play.api._
import play.api.mvc._
import models._

/**
 * Allows all user agents regardless of whether or not they have a cookie
 */
case class Public() extends Rule {
	def isAllowed(request:Request[AnyContent], userAgent:UserAgent, result:Result):Result = {
		result
	}
}
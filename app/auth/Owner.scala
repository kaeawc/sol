package auth

import play.api._
import play.api.mvc._
import models._

/**
 * Providing there is a valid user, check that the user owns the content
 */
case class Owner(content:Long,kind:String = "") extends Rule {
	def isAllowed(request:Request[AnyContent], userAgent:UserAgent, result:Result):Result = {
		val user = userAgent.user
		if (user.isEmpty) Results.Unauthorized("{'reason':'You are must be logged in.'}")
		else {
			if (user.get.owns(content,kind))
				result
			else
				Results.Unauthorized("{'reason':'You are not the owner of this content.'}")
		}
	}
}
package auth

import play.api._
import play.api.mvc._
import models._

/**
 * Providing a valid user, check if that user has one of the given roles.
 */
case class InRoles(roles:Seq[String]) extends Rule {
	def isAllowed(request:Request[AnyContent], userAgent:UserAgent, result:Result):Result = {
		val user = userAgent.user
		if (user.isEmpty) Results.Unauthorized("{'reason':'You are must be logged in.'}")
		else {
			if (roles.contains(user.get.role))
				result
			else
				Results.Unauthorized("{'reason':'You do not have sufficient role permissions.'}")
		}
	}
}
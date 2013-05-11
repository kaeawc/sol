package auth

import play.api._
import play.api.mvc._
import models.UserAgent

trait Rule {
	def check(action:Request[AnyContent] => UserAgent => Result):EssentialAction = Action {
		request:Request[AnyContent] =>
      val userAgent = UserAgent.parseRequest(request)
      isAllowed(request,userAgent,action(request)(userAgent))
	}
	def isAllowed(request:Request[AnyContent], userAgent:UserAgent, result:Result):Result
}

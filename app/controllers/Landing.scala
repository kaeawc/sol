package controllers

import play.api._
import play.api.mvc._
import auth._

object Landing extends Http {

	def get = HttpAction(Public()) { request => userAgent =>
		Ok(views.html.index(userAgent, "Hello!"))
	}

	def unauthorized = HttpAction(Public()) { request => userAgent =>
		Ok(views.html.errors.unauthorized(Option(userAgent)))
	}

}

package controllers

import play.api._
import play.api.mvc._
import play.api.data._
import play.api.data.Forms._
import play.api.templates.Html
import auth._

import models.User

trait FormPosting extends Http {

	def submit[A](
		form:Form[A],
		logical:A => Boolean,
	    success:A => Request[AnyContent] => models.UserAgent => Result,
	    fail:Option[A] => Request[AnyContent] => models.UserAgent => Result
	) = HttpAction(Public()) {
		implicit request => userAgent =>
		val bound = form.bindFromRequest
		if(bound.hasErrors) fail(None)(request)(userAgent)
		else
		{
			val parameters = bound.get
			if(!logical(parameters)) fail(Option(parameters))(request)(userAgent)
			else success(parameters)(request)(userAgent)
		}
	}
}
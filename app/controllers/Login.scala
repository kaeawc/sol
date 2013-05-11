package controllers

import play.api._
import play.api.mvc._
import play.api.data._
import play.api.data.Forms._

import play.api.libs.json._
import play.api.libs.json.Json._

import auth._
import models.{User,UserAgent}

object Login extends FormPosting {

	val form = Form(
		mapping(
			"username" -> text,
			"password" -> text,
			"remember" -> optional(text)
		)(models.requests.account.Login.apply)(models.requests.account.Login.unapply)
	)

	def get = HttpAction(Public()) { request => userAgent => Ok(views.html.login(userAgent, "")) }

	/**
	 * Given a POST to this controller, submit a models.requests.account.Login to be validated.
	 * If successful, respond with the dashboard and an access cookie
	 * Otherwise respond with the login page
	 */
	def post = submit[models.requests.account.Login](form,models.requests.account.Login.validate,success,fail)

	def success(model:models.requests.account.Login) = {
		request:Request[AnyContent] => userAgent:UserAgent =>
		val remember = (model.remember.isEmpty == false && model.remember.get == "on")
		val user = User.getByUsername(model.username)
		val userJson = User.toJson(user.get)
		val userCookieKey = Play.current.configuration.getString("cookies.user.key").get
		val https = (!Play.current.configuration.getString("https.enabled").isEmpty)
		val cookie = auth.Cookie.create(userCookieKey,userJson,https,false)
		Ok(views.html.index(userAgent.withUser(user.get), "You are authorized! :D")).withCookies(cookie)
	}

	def fail(model:Option[models.requests.account.Login]) = {
		request:Request[AnyContent] => userAgent:UserAgent =>
		Ok(views.html.login(userAgent, "The username & password combination you submitted doesn't match any account in our system."))
	}
}
package controllers

import play.api._
import play.api.mvc._

import auth._

object Logout extends Http {

  def get = HttpAction(Public()) {
    request => userAgent => 
    val userCookieKey = Play.current.configuration.getString("cookies.user.key").get
    Ok(views.html.index(userAgent.withoutUser(), "You are now logged out."))
      .discardingCookies(DiscardingCookie(userCookieKey))
      .withNewSession
  }

}

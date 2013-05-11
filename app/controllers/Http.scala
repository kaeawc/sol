package controllers

import play.api._
import play.api.mvc._

import auth._
import models.UserAgent

trait Http extends Controller {

  /**
   * Verifies the user's https only cookie
   */
  def HttpAction(rule:Rule)(action:Request[AnyContent] => UserAgent => Result):EssentialAction = {
    rule.check(action)
  }
}
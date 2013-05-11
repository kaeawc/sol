package controllers

import play.api._
import play.api.mvc._
import play.api.data._
import play.api.data.Forms._

import play.api.libs.json._
import play.api.libs.json.Json._

import auth._
import models.{User,UserAgent,Asteriod,Orbit}

object Asteriods extends FormPosting {

  val form = Form(
    mapping(
      "id" -> optional(longNumber),
      // "orbit" -> text,
      "score" -> bigDecimal,
      "saved" -> bigDecimal,
      "price" -> bigDecimal,
      "profit" -> bigDecimal,
      "full_name" -> text,
      "diameter" -> text,
      "inexact" -> boolean,
      "prov_des" -> text,
      "epoch" -> bigDecimal,
      "fuzzed_price" -> optional(bigDecimal)
    )(Asteriod.apply)(Asteriod.unapply)
  )

  def get(name:String) = HttpAction(Public()) { request => userAgent => Ok(views.html.index(userAgent, "Here you go, a new asteriod just for you!")) }

  /**
   * Given a POST to this controller, submit a Asteriod to be validated.
   */
  def post = submit[Asteriod](form,Asteriod.validate,success,fail)
  /**
   * Given a POST to this controller, submit a Asteriod to be validated.
   */
  def put = submit[Asteriod](form,Asteriod.validate,success,fail)

  def success(model:Asteriod) = { request:Request[AnyContent] => userAgent:UserAgent => Ok("") }

  def fail(model:Option[Asteriod]) = { request:Request[AnyContent] => userAgent:UserAgent => BadRequest("") }
}
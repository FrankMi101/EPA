using BLL;
using ClassLibrary;
using EPAAPI.Models;
using System;
using System.Web.Http;

namespace EPAAPI.Controllers
{
    public class AppraisalCommentsController : ApiController
    {
        public IHttpActionResult GetAppraisalComment(string userID,string schoolYear, string schoolCode, string employeeID, string sessionID, string itemCode)
        {

            AppraisalComment parameters = new AppraisalComment()
            {
                Operate = "Get",
                UserID = userID,
                SchoolYear = schoolYear,
                SchoolCode = schoolCode,
                EmployeeID = employeeID,
                SessionID = sessionID,
                ItemCode = itemCode
            };


            string myComment = AppraisalExecute.Comments(parameters);
            if (String.IsNullOrEmpty(myComment))
            {
                return NotFound();
            }

            return new TextResult(myComment, Request);
        }
        public IHttpActionResult SaveAppraisalComment(string userID, string schoolYear, string schoolCode, string employeeID, string sessionID, string itemCode, string comments)
        {

            AppraisalComment parameters = new AppraisalComment()
            {
                Operate = "Save",
                UserID = userID,
                SchoolYear = schoolYear,
                SchoolCode = schoolCode,
                EmployeeID = employeeID,
                SessionID = sessionID,
                ItemCode = itemCode,
                Value = comments,
                Area = "SUM",
                Category = "TPA"

            };


            string myResult = AppraisalExecute.Comments(parameters);
            if (String.IsNullOrEmpty(myResult))
            {
                return NotFound();
            }

            return new TextResult(myResult, Request);
        }

    }
}

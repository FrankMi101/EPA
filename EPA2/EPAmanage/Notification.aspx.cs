using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.IO;
using System.Net.Mail;
using System.Globalization;
using System.Text;
//using System.IO;
//using System.Text;
namespace EPA2.EPAmanage
{
    public partial class Notification : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // LabelName.Text = Page.Request.QueryString["tName"];
                hfApprYear.Value = Page.Request.QueryString["yID"];
                hfApprSchool.Value = Page.Request.QueryString["cID"];
                hfApprEmployeeID.Value = Page.Request.QueryString["tID"];
                string sID = Page.Request.QueryString["sID"];
                if (sID == "undefined")
                {
                    sID = "Appraisal0";
                }
                hfApprSession.Value = sID;
                hfApprName.Value = Page.Request.QueryString["tName"];
                setPageAttribution();
                GetNoticeForUserInforamtion();
            }
        }
        private void setPageAttribution()
        {
            hfCategory.Value = "EPA";
            hfPageID.Value = "Feedback";
            hfUserID.Value = User.Identity.Name;
            hfUserLoginRole.Value = WorkingProfile.UserRoleLogin;
            hfRunningModel.Value = WebConfig.RunningModel();
            try
            {
                if (Session["NoticeType"].ToString() == "ALP")
                { rblNoticeType.SelectedIndex = 0; }
                if (Session["NoticeType"].ToString() == "EPA")
                { rblNoticeType.SelectedIndex = 1; }
                if (Session["NoticeType"].ToString() == "OBS")
                { rblNoticeType.SelectedIndex = 2;
                    chbICalendar.Visible = true;
                }
            }
            catch { }

        }
        private void GetNoticeForUserInforamtion()
        {
            WorkingAppraisee.AppraisalYear = hfApprYear.Value;
            WorkingAppraisee.EmployeeID = hfApprEmployeeID.Value;

            TextAppraisalYear.Text = hfApprYear.Value;
            TextAppraisalSession.Text = WorkingAppraisee.AppraisalWorkingSession;
            TextCurrentCycle.Text = WorkingAppraisee.AppraisalPhase;
            if (rblNoticeType.SelectedIndex == 2)
            {
                LableDeadLine.Text = "Classroom Obervation Date:";
            }
            //if (WorkingAppraisee.AppraisalPhase == "LTO" || WorkingAppraisee.AppraisalPhase == "NTP")
            //{
            //    rblNoticeType.SelectedIndex = 2;
            //    LableDeadLine.Text = "Classroom Obervation Date:";
            //}
            //else
            //{
            //    rblNoticeType.SelectedIndex = 0;
            //}
            myText.Text = getBodyByType();
            TextSubject.Text = getDefaultSubjectbyNoticeType();

        }
        protected void rblNoticeType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblNoticeType.SelectedValue == "OBS")
            { LableDeadLine.Text = "Classroom Obervation Date:"; }
            myText.Text = getBodyByType();
            TextSubject.Text = getDefaultSubjectbyNoticeType();
        }
        private string getDefaultSubjectbyNoticeType()
        {
            string category = hfCategory.Value;
            string noticeType = "AppraisalStart";
            string noticeArea = rblNoticeType.SelectedValue;
            string noticeGo = "Appraisee";
            string noticeFrom = "Appraiser";
            string purpose = "Notice";
            string subject = GetNoticeFile.eMailContentByType("GetSubject", User.Identity.Name, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose);

            return subject;
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string noticeType = "AppraisalStart";
            string noticeArea = rblNoticeType.SelectedValue;
            string eMailTo = eMailNotification.NotificationeMail("Get", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "NoticeUser",noticeArea);
            string eMailCC = eMailNotification.NotificationeMail("Get", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "CCUser", noticeArea);
            string eMailBcc = "";
            string eMailForm = eMailNotification.NotificationeMail("Get", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "OperateUser", noticeArea);
            string eMailSubject = TextSubject.Text;
            string eMailBody = getEmailBody(); //  myText.Text;
            string eMailFormat = "HTML";
            string noticeDate = DateTime.Now.ToString("yyyy/MM/dd");
            string  eMailBodySave = eMailBody.Replace("{{PlaceHolder:WebSite}}", " <a href=' " + WebConfig.getValuebyKey("ApplicationSite") + "' target='_blank'>  Teacher Performance Appraisal </a>");

            eMailNotification.NotificationeMail("Appraiser", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, noticeType, noticeArea, noticeDate, DeadLineDate.Value, eMailSubject, eMailBodySave);
            string result = "";
            if ( chbICalendar.Checked ) // rblNoticeType.SelectedValue == "OBS")
            {             
                System.Net.Mail.Attachment iCalendar = getiCalendar();
                 result = eMailNotification.SendeMail(eMailTo, eMailCC, eMailBcc, eMailForm, eMailSubject, eMailBody, eMailFormat, iCalendar);
            }
            else
            {
                result = eMailNotification.SendeMail(eMailTo, eMailCC, eMailBcc, eMailForm, eMailSubject, eMailBody, eMailFormat);
                if (rblNoticeType.SelectedValue == "OBS" && !chbICalendar.Checked )
                {    btnAppointment.Visible =true;
                }
            }
            showMessage(result, "Send Email Notification");

        }
        private System.Net.Mail.Attachment getiCalendar()
        {
            DateTime sDate = DateTime.ParseExact(DeadLineDate.Value + " 09:30", "yyyy/MM/dd hh:mm", CultureInfo.InvariantCulture);
            DateTime eDate = DateTime.ParseExact(DeadLineDate.Value + " 12:30 PM", "yyyy/MM/dd hh:mm tt", CultureInfo.InvariantCulture);
            // string sTime = "";
            // string eTime = "";
            // string  sDate = "";
            //  string eDate = "";
            string teacherName = hfApprName.Value;
            string toMail = eMailNotification.NotificationeMail("Get", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "NoticeUser","EPA");
            string location = "Class Room/Principal's Office";
            string subject = "Performance Appraisal Class Room Observation";
            string appraiser = User.Identity.Name;
            string description = "Teacher Performance Appraisal in Class Room Observation ";
            byte[] calendarBytes = iCalendar.getiCalendarbyStringBuiding(User.Identity.Name, sDate, eDate, teacherName, subject, description, location, toMail, appraiser);
            MemoryStream ms = new MemoryStream(calendarBytes);
            System.Net.Mail.Attachment attachment = new System.Net.Mail.Attachment(ms, "event.ics", "text/calendar");
            return attachment;
        }
        private string getEmailBody()
        {
            string htmlfile = GetNoticeFile.FileContentByType("EPA");
            htmlfile = htmlfile.Replace("{{HTMLeMailBodyPlaceHolder}}", myText.Text);
            return htmlfile;
        }

        private void showMessage(string result, string action)
        {
            try
            {
                string strScript = "CallShowMessage(" + "'" + action + "', '" + result + "'); ";
                ClientScript.RegisterStartupScript(GetType(), "_savemessagescript", strScript, true);
            }
            catch { }

        }

        protected void btnRetrieve_Click(object sender, EventArgs e)
        {

        }
        private string getBodyByType()
        {
            string noticeType = "AppraisalStart";
            string noticeArea = rblNoticeType.SelectedValue;
            string noticeDate = DateTime.Now.ToString("yyyy/MM/dd");
            string category = hfCategory.Value;
            string noticeGo = "Appraisee";
            string noticeFrom = "Appraiser";
            string purpose = "Notice";
            string cBody = GetNoticeFile.eMailContentByType("GetBody", User.Identity.Name, category, noticeType, noticeArea,noticeGo, noticeFrom, purpose);
            cBody = cBody.Replace("{{PlaceHolder:ToName}}", WorkingAppraisee.AppraiseeName);
            cBody = cBody.Replace("{{PlaceHolder:AppraisalYear}}", WorkingAppraisee.AppraisalYear);
            cBody = cBody.Replace("{{PlaceHolder:AppraisalCategory}}", GetNoticeFile.eMailContentAppCategory("AppCategory", User.Identity.Name, category, noticeType, noticeArea, noticeGo, noticeFrom, purpose));
            cBody = cBody.Replace("{{PlaceHolder:AppraiserName}}", WorkingAppraisee.AppraiserName);
            cBody = cBody.Replace("{{PlaceHolder:SendName}}", WorkingProfile.UserName);
            cBody = cBody.Replace("{{PlaceHolder:SendDate}}", noticeDate);
            cBody = cBody.Replace("{{PlaceHolder:OneLine}}", " ");
            // cBody = cBody.Replace("{{PlaceHolder:DeadLineDate}}", dateDeadline.Value);
            //  cBody = cBody.Replace("{{PlaceHolder:WebSite}}", applicationWebSite);
            // cBody = cBody.Replace("{{PlaceHolder:AdditionInformation}}", myText.Text);


            if (WebConfig.getValuebyKey("eMailTry") == "Test")
            {
                string eMailTo = eMailNotification.NotificationeMail("Get", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "NoticeUser", noticeArea);
                string eMailCC = eMailNotification.NotificationeMail("Get", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "CCUser", noticeArea);

                cBody = cBody.Replace("{{PlaceHolder:TestEmailTo}}", "Email To: " + eMailTo);
                cBody = cBody.Replace("{{PlaceHolder:TestEmailCC}}", "Email CC: " + eMailCC);
            }
            else
            {
                cBody = cBody.Replace("{{PlaceHolder:TestEmailTo}}", "");
                cBody = cBody.Replace("{{PlaceHolder:TestEmailCC}}", "");
            }
            return cBody;
        }

        protected void btnAppointment_Click(object sender, EventArgs e)
        {
            // create a icalender file for user open 

            DateTime sDate = DateTime.ParseExact(DeadLineDate.Value + " 09:30", "yyyy/MM/dd hh:mm", CultureInfo.InvariantCulture);
            DateTime eDate = DateTime.ParseExact(DeadLineDate.Value + " 12:30 PM", "yyyy/MM/dd hh:mm tt", CultureInfo.InvariantCulture);
            // string sTime = "";
            // string eTime = "";
            // string  sDate = "";
            //  string eDate = "";
            string noticeArea = rblNoticeType.SelectedValue;
            string teacherName = hfApprName.Value;
            string toMail = eMailNotification.NotificationeMail("Get", User.Identity.Name, hfApprYear.Value, hfApprSchool.Value, hfApprEmployeeID.Value, hfApprSession.Value, "NoticeUser", noticeArea);
            string location = "Class Room/Principal's Office";
            string subject = "Performance Appraisal Class Room Observation";
            string appraiser = User.Identity.Name;
            string description = "Teacher Performance Appraisal in Class Room Observation ";


            MakeiCalendarSB(sDate, eDate, teacherName, subject, description, location, toMail, appraiser);
        }


        private void MakeiCalendar(DateTime sDate, DateTime eDate, string teacherName, string subject, string description, string location, string toMail, string appraiser)
        {
            DateTime beginDate = sDate; // _sD '#5/7/2005 4:00:00 PM#  '_sD '
            DateTime endDate = eDate;

            MemoryStream mStream = new MemoryStream();
            mStream = iCalendar.getiCalendarbySteamMemory(User.Identity.Name, sDate, eDate, teacherName, subject, description, location, toMail, appraiser);

            Response.Clear(); //'clears the current output content from the buffer
            Response.AppendHeader("Content-Disposition", "attachment; filename=ClassRoomObservationCalendar.ics");
            Response.AppendHeader("Content-Length", mStream.Length.ToString());
            Response.ContentType = "application/download";
            Response.BinaryWrite(mStream.ToArray());
            Response.End();

        }

        private void MakeiCalendarSB(DateTime sDate, DateTime eDate, string teacherName, string subject, string description, string location, string toMail, string appraiser)
        {
            byte[] calendarBytes = iCalendar.getiCalendarbyStringBuiding(User.Identity.Name, sDate, eDate, teacherName, subject, description, location, toMail, appraiser);
            MemoryStream ms = new MemoryStream(calendarBytes);
            Response.Clear(); //'clears the current output content from the buffer
            Response.AppendHeader("Content-Disposition", "attachment; filename=ClassRoomObservationCalendar.ics");
            Response.AppendHeader("Content-Length", ms.Length.ToString());
            Response.ContentType = "application/download";
            Response.BinaryWrite(ms.ToArray());
            Response.End();

        }
        public static List<string> iCals(List<iCalendar2> iCals)
        {
            List<string> calendars = new List<string>();

            foreach (iCalendar2 iCal in iCals)
            {
                StringBuilder sb = new StringBuilder();

                //Calendar
                sb.AppendLine("BEGIN:VCALENDAR");
                sb.AppendLine("PRODID:-//Compnay Inc//Product Application//EN");
                sb.AppendLine("VERSION:2.0");
                sb.AppendLine("METHOD:REQUEST");

                //Event
                sb.AppendLine("BEGIN:VEVENT");
                sb.AppendLine("DTSTART:" + toUniversalTime(iCal.EventStartDateTime));
                sb.AppendLine("DTEND:" + toUniversalTime(iCal.EventEndDateTime));
                sb.AppendLine("DTSTAMP:" + toUniversalTime(iCal.EventTimeStamp));
                sb.AppendLine("ORGANIZER;CN=John Doe:mailto:johndoe@company.com");
                sb.AppendLine("UID:" + iCal.UID);
                //sb.AppendLine("ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=TRUE;CN=marydoe@company.com;X-NUM-GUESTS=0:mailto:marydoe@company.com");
                sb.AppendLine("CREATED:" + toUniversalTime(iCal.EventCreatedDateTime));
                sb.AppendLine("X-ALT-DESC;FMTTYPE=text/html:" + iCal.EventDescription);
                sb.AppendLine("LAST-MODIFIED:" + toUniversalTime(iCal.EventLastModifiedTimeStamp));
                sb.AppendLine("LOCATION:" + iCal.EventLocation);
                sb.AppendLine("SEQUENCE:0");
                sb.AppendLine("STATUS:CONFIRMED");
                sb.AppendLine("SUMMARY:" + iCal.EventSummary);
                sb.AppendLine("TRANSP:OPAQUE");

                //Alarm
                sb.AppendLine("BEGIN:VALARM");
                sb.AppendLine("TRIGGER:" + String.Format("-PT{0}M", iCal.AlarmTrigger));
                sb.AppendLine("REPEAT:" + iCal.AlarmRepeat);
                sb.AppendLine("DURATION:" + String.Format("PT{0}M", iCal.AlarmDuration));
                sb.AppendLine("ACTION:DISPLAY");
                sb.AppendLine("DESCRIPTION:" + iCal.AlarmDescription);
                sb.AppendLine("END:VALARM");

                sb.AppendLine("END:VEVENT");
                sb.AppendLine("END:VCALENDAR");

                calendars.Add(sb.ToString());
            }

            return calendars;
        }

        public static string toUniversalTime(DateTime dt)
        {
            string DateFormat = "yyyyMMddTHHmmssZ";

            return dt.ToUniversalTime().ToString(DateFormat);
        }
    }
}
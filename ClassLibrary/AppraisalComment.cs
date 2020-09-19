using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
    public class AppraisalBase
    {
        public string Operate { get; set; }
        public string UserID { get; set; }
        public string SchoolYear { get; set; }
        public string SchoolCode { get; set; }
        public string EmployeeID { get; set; }
        public string SessionID { get; set; }
        public string IDs { get; set; }

    }
    public class AppraisalComment : AppraisalBase
    {
        public string Category { get; set; }
        public string Area { get; set; }
        public string ItemCode { get; set; }
        public string Value { get; set; }
        public string Phase { get; set; }
        public string AppraisalRole { get; set; }
        public string SeqNo { get; set; }
        public string ActionItem { get; set; }
    }

    public class AppraisalCommentsHistory
    {
        public string Action { get; set; }
        public string ActionDate { get; set; }
        public string Notes { get; set; }
        public int RowNo { get; set; }
    }
    public class AppraisalCommentSignOff : AppraisalComment
    {
        public string UserRole { get; set; }
        public string SignOffName { get; set; }
        public string SignOffDate { get; set; }
        public string SignOffAction { get; set; }
        public string SignOffComplete { get; set; }
        public string SignOffType { get; set; }
        public string EnforceSignOff { get; set; }

    }
    public class AppraisalCommentNoticeDate : AppraisalComment
    {
        public string UserRole { get; set; }
        public string NoticeType { get; set; }
        public string NoticeArea { get; set; }

    }
    public class AppraisalCommentSTR : AppraisalComment
    {
        public string Column { get; set; }

    }
    public class AppraisalCommentIMP : AppraisalComment
    {

        public string GoalItem { get; set; }

        public string Criteria { get; set; }
        public string Concern { get; set; }
        public string Practices { get; set; }
        public string Steps { get; set; }
        public string Indicators { get; set; }
        public string Completed { get; set; }

    }
    public class AppraisalCommentAGP : AppraisalComment
    {
        public string GoalItem { get; set; }

        public string AreaForGrowth { get; set; }
        public string GrowthStrategy { get; set; }
        public string TimeLine { get; set; }
        public string FutureGrowth { get; set; }

    }
    public class AppraisalCommentAPP : AppraisalComment
    {

        public string Goals { get; set; }
        public string StrategyAction { get; set; }

        public string Practices { get; set; }

        public string Indicators { get; set; }

        public string Results { get; set; }
    }
    public class AppraisalCommentAPM : AppraisalComment
    {
        public string MeetingContent { get; set; }
        public string MeetingDate { get; set; }


    }
    public class AppraisalDateText : AppraisalComment
    {
        public string vDate { get; set; }
    }

    public class AppraisalComment2 : AppraisalComment
    {
        public string GoalItem { get; set; }
    }
    public class DomainCompetency : AppraisalComment
    {
        public string DomainID { get; set; }
        public string CompetencyID { get; set; }


    }
    public class DomainLookFors : DomainCompetency
    {
        public string LookForsID { get; set; }

    }
    public class DomainTips : DomainLookFors
    {
        public string TipsID { get; set; }

    }
    public class AppraisalDate : AppraisalComment
    {
        public string Date { get; set; }
    }

    public class AppraisalCompetency : DomainCompetency
    {
        public string Rate { get; set; }
    }
    public class AppraisalObservation : DomainCompetency
    {
        public string Check { get; set; }
    }
    public class AppraisalListBase : AppraisalBase
    {
        public string myKey { get; set; }
        public string Action { get; set; }
        public string Assignment { get; set; }
        public string Comments { get; set; }
        public string School { get; set; }
        public string RowNo { get; set; }
    }
    public class DigitalSignature : AppraisalBase
    {
        public string CreateTime { get; set; }
        public string DigitalKey { get; set; }

    }

    public class SignOffAutoNotice : AppraisalBase
    {
        public string Category { get; set; }
        public string Area { get; set; }
        public string ActionRole { get; set; }
        public string Action { get; set; }
        public string Value { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
        public string Template { get; set; }

    }

}

using System;

namespace ClassLibrary
{
    public class Appraisee : AppraisalListBase
    {
        public string AppraisalStatus { get; set; }
        public string AppraisalType { get; set; }
        public string AppraisalPhase { get; set; }
        public string AppraisalProcess { get; set; }
        public string AppraisalRole { get; set; }
        public string AppraisalCycle { get; set; }
        public string Appraiser { get; set; }
        public string Mentor { get; set; }
        public string TimeType { get; set; }
        public string TeacherNameL { get; set; }
        public string TeacherName { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string EvidenceLevel { get; set; }

    }
    public class AppraisalList : Appraisee
    {

        public string ALP { get; set; }
        public string EPA { get; set; }
        public string CurrentSession { get; set; }

        public string Appraisal1 { get; set; }
        public string Appraisal2 { get; set; }
        public string Appraisal3 { get; set; }
        public string Appraisal4 { get; set; }
        public string AppraisalOutcome { get; set; }

    }

    public class RollOverList : AppraisalList
    {
        public string AppraisalPhaseP { get; set; }
        public string AppraisalPhaseN { get; set; }
    }

    public class AppraisalHistory : AppraisalList
    {
        public string AppraisalYear { get; set; }
        public string AppraisalSchool { get; set; }
    }
    public class AppraisalNotice : AppraisalList
    {
        public string NoticeDate { get; set; }
        public string DueDate { get; set; }
        public bool SelectedC { get; set; }


    }

    public class ObservationList
    {
        public string DomainID { get; set; }
        public string CompetencyID { get; set; }
        public string CompetencyName { get; set; }
        public bool SelectedC { get; set; }
        public string Comments { get; set; }
        public string RowNo { get; set; }
    }
    public class BuildLookForsList : DomainCompetency
    {
        public string LookForsID { get; set; }
        public string ActionRole { get; set; }
        public string ObjRole { get; set; }
        public string LogDate { get; set; }
        public bool LogCheck { get; set; }
        public string AllowView { get; set; }
        public int RowNo { get; set; }
        public string Action { get; set; }
        public string LookFors { get; set; }
        public string Comments { get; set; }

    }

    public class LookFors
    {
        public string ActionDate { get; set; }
        public string LookForsID { get; set; }
        public string LookForsName { get; set; }
        public int RowNo { get; set; }
        public string Action { get; set; }

    }
    public class OLFCategory
    {
        public string Operate { get; set; }
        public string UserID { get; set; }
        public string Panel { get; set; }
        public int TreeLevel { get; set; }
        public string Level1 { get; set; }

        public string Level2 { get; set; }

        public string Level3 { get; set; }

        public string Level4 { get; set; }

        public string Notes { get; set; }
        public int RowNo { get; set; }

    }
  
}

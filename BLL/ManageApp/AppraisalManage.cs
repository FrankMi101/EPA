using ClassLibrary;
using System;
using System.Collections.Generic;

namespace BLL
{
	public class AppraisalManage
	{
		public static string GetSP(string action)
		{
			switch (SPSource.SPFile)
			{
				case "JsonFile":
					return GetSPFrom.JsonFile(action);
				case "DBTable":
					return GetSPFrom.DbTable(action, "AppraisalManage");
				default:
					return GetSPInClass(action);
			}
		}

		public static List<T> CommonList<T>(string action, object parameter)
		{
			try
			{
				string sp = GetSP(action);
				return CommonExecute<T>.ListOfT(sp, parameter);
			}
			catch (Exception ex)
			{
				string em = ex.StackTrace;
				throw;
			}

		}
		public static T CommonValue<T>(string action, object parameter)
		{
			try
			{
				string sp = GetSP(action);
				return CommonExecute<T>.ValueOfT(sp, parameter);
			}
			catch (Exception ex)
			{
				string em = ex.StackTrace;
				throw;
			}
		}
  

		public static List<AreaList> AppraisalCategory(object parameter)
		{
			return CommonList<AreaList>("AppraisalCategory", parameter);
		}
		public static List<Employee> Employee(object parameter)
		{
			return CommonList<Employee>("Employee", parameter);         
		}
	 
		public static List<Appraisee> Appraisee(object parameter)
		{
			return CommonList<Appraisee>("Appraisee", parameter);
		}
		public static List<AppraisalList> StaffList(object parameter)
		{
			return CommonList<AppraisalList>("StaffList", parameter);
		}
		public static List<AppraisalList> AppraisalStaffs(object parameter)
		{
			return CommonList<AppraisalList>("AppraisalStaffs", parameter);
		}
		public static List<AppraisalNotice> AppraisalStaffsNotice(object parameter)
		{
			return CommonList<AppraisalNotice>("AppraisalStaffsNotice", parameter);
		}
		public static List<AppraisalHistory> AppraisalStaffHistory(object parameter)
		{
			return CommonList<AppraisalHistory>("AppraisalStaffHistory", parameter);
		}
		public static List<AppStatement> Statement(object parameter)
		{
			return CommonList<AppStatement>("Statement", parameter);
		}
		public static List<AppStatement> StatementNoList(object parameter)
		{
			return CommonList<AppStatement>("StatementNoList", parameter);
		}
		public static string SaveSatement(object parameter)
		{
			return CommonValue<string>("StatementSave", parameter);   
		}
		public static string DeleteSatement(object parameter)
		{
			return CommonValue<string>("StatementDelete", parameter);
		}
		public static int SatementNo(object parameter)
		{
			return CommonValue<int>("StatementNo", parameter);
		}
		public static string EmployeeEdit(object parameter)
		{
			return CommonValue<string>("EmployeeEdit", parameter);
		}
		public static string EmployeeAddToApprList(object parameter)
		{
			return CommonValue<string>("EmployeeAddToApprList", parameter);
		}
		public static string AppraiseeEdit(object parameter)
		{
			return CommonValue<string>("AppraiseeEdit", parameter);
  
		}
		public static string AppraiseeDelete(object parameter)
		{
			return CommonValue<string>("AppraiseeDelete", parameter);
		}
		public static string AppraiseeCopyToNew(object parameter)
		{
			return CommonValue<string>("AppraiseeCopyToNew", parameter);
		}

		public static string AppraisalNotes(object parameter)
		{
			return CommonValue<string>("AppraisalNotes", parameter);
		}
		public static string AppraisalNotesSave(object parameter)
		{
			return CommonValue<string>("AppraisalNotesSave", parameter);
		}
		private static string GetSPInClass(string action)
		{

			string parameters = " @Operate,@UserID,@SchoolYear,@SchoolCode";
			string parameters2 = parameters + ",@IDs,@No,@Category,@Area,@Subject,@Statements,@Publisher,@StartDate,@EndDate,@Active";
			string parameterE =   " @Operate,@IDs,@UserID, @EmployeeID";
			string parameterE1 = ",@SchoolYear,@SchoolCode,@AppraisalStatus,@AppraisalType,@AppraisalCycle,@AppraisalRole,@EvidenceLevel,@Appraiser,@Mentor,@TimeType,@Assignment,@Comments";
			string parameterE2 = ",@UnitID,@FirstName,@LastName,@Gender,@Email,@EmployeeStatus,@EmployeePosition,@PositionType,@TimeType,@StartDate,@EndDate,@Assignment,@Comments";

 


			switch (action)
			{
				case "AppraisalCategory":
					return "dbo.EPA_Appr_AppraisalCategory" + parameters;
				case "StatementNo":
					return "dbo.EPA_Org_AppStatementManage" + parameters;
				case "StatementNoList":
					return "dbo.EPA_Org_AppStatementManage" + parameters;
				case "Statement":
					return "dbo.EPA_Org_AppStatementManage" + parameters + ",@IDs,@No";
				case "StatementSave":
					return "dbo.EPA_Org_AppStatementManage" + parameters2;
				case "StatementDelete":
					return "dbo.EPA_Org_AppStatementManage" + parameters + ",@IDs,@No";
				case "Employee":
					return "dbo.EPA_Org_StaffProfileEdit" + parameterE;
				case "EmployeeEdit":
					return "dbo.EPA_Org_StaffProfileEdit" + parameterE + parameterE2; ;
				case "EmployeeAddToApprList":
					return "dbo.EPA_Org_StaffProfileEdit" + parameterE   ;
				case "Appraisee":
					return "dbo.EPA_Appr_AppraiseeProfileEdit" + parameterE + ",@SchoolYear,@SchoolCode";
				case "AppraiseeEdit":
					return "dbo.EPA_Appr_AppraiseeProfileEdit" + parameterE + parameterE1 + ",@StartDate,@EndDate";
				case "AppraiseeDelete":
					return "dbo.EPA_Appr_AppraiseeProfileEdit" + parameterE + ",@SchoolYear,@SchoolCode";
 				case "AppraisalStaffs":
					return "dbo.EPA_Appr_AppraisalStaffList"  + parameters + ",@Searchby,@SearchValue,@WorkingOn,@UserRole";
				case "AppraisalStaffsNotice":
					return "dbo.EPA_Appr_AppraisalStaffListNotice"  + parameters + ",@SearchBy,@SearchValue,@NoticeType,@NoticeArea";
				case "AppraisalStaffHistory":
					return "dbo.EPA_Appr_AppraisalStaffHistory" + parameters + ",@Searchby,@SearchValue";
				case "StaffList":
					return "dbo.EPA_Org_StaffList" + parameters + ",@Searchby,@SearchValue";
				case "RollOverList":
					return "dbo.EPA_Appr_AppraisalProcess_RollOver @Operate, @UserID, @FromSchoolYear, @ToSchoolYear, @SchoolCode";
				case "RollOver":
					return "dbo.EPA_Appr_AppraisalProcess_RollOver @Operate, @UserID, @FromSchoolYear, @ToSchoolYear, @SchoolCode";
				case "AppraisalNotes":
					return "dbo.EPA_Appr_AppraisalData_NotesComments" + parameters + ",@Category"	;
				case "AppraisalNotesSave":
					return "dbo.EPA_Appr_AppraisalData_NotesComments" + parameters + ",@Category,@Value";

				default:
					return action;
			}
		}
 

	}

}

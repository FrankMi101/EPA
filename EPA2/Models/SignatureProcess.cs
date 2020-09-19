using BLL;
using ClassLibrary;
using System.Collections.Generic;

namespace EPA2
{
    public class SignatureProcess : BaseData  
    {

        public SignatureProcess()
        { }
     

        static string sp = "dbo.EPA_Appr_AppraisalProcess_SignOffSignature";

        public static string SignOffAction(string RoleType, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string itemCode, string userRole)
        {
            string sp = "dbo.EPA_Appr_AppraisalProcess_SignOffAction";
            var parameter = new
            {
                RoleType = RoleType,
                UserID = userID,
                SchoolYear = appraisalYear,
                SchoolCode = appraisalschool,
                EmployeeID = employeeID,
                SessionID = appraisalSession,
                Category = category,
                ItemCode = itemCode,
                UserRole = userRole
            };

            return GeneralValue<string>(sp, parameter);
        }
        public static List<AppraisalCommentSignOff> SignOffContents(string RoleType, AppraisalCommentSignOff parameter)
        {
            parameter.SignOffType = RoleType; 
            return GeneralList<AppraisalCommentSignOff>("AppraisalSignOff", "SignOffContents", parameter);
        }
        public static string SignOffAction(string RoleType, AppraisalCommentSignOff parameter)
        {
            parameter.SignOffType = RoleType;
            // return AppraisalSignOff.SignOffName(parameter);
            return GeneralValue<string>("AppraisalSignOff", "SignOffAction", parameter);
        }
        public static string SignOffName(string RoleType, AppraisalCommentSignOff parameter)
        {
             parameter.SignOffType = RoleType;
           // return AppraisalSignOff.SignOffName(parameter);
            return GeneralValue<string>("AppraisalSignOff", "SignOffName", parameter);
        }
        public static string SignOffName(string RoleType, AppraisalCommentSignOff parameter, string action)
        {
          //  parameter.Operate = RoleType;
          ///  return AppraisalSignOff.SignOffNameSave(parameter);
            return GeneralValue<string>("AppraisalSignOff", "SignOffNameSave", parameter);
        }
        public static string SignOffName(string RoleType, AppraisalCommentSignOff parameter, string action, string action2)
        {
          //  parameter.Operate = RoleType;
         //    return AppraisalSignOff.SignOffNameEnforce(parameter);
            return GeneralValue<string>("AppraisalSignOff", "SignOffNameEnforce", parameter);
        }
      

        public static string SignOffDate(string RoleType, AppraisalCommentSignOff parameter)
        {
            parameter.SignOffType = RoleType;
          //  return AppraisalSignOff.SignOffDate(parameter);
            return GeneralValue<string>("AppraisalSignOff", "SignOffDate", parameter);
        }

        public static string SignOffComplete(string RoleType, AppraisalCommentSignOff parameter)
        {
            parameter.SignOffType = RoleType;
            //   return AppraisalSignOff.SignOffComplete(parameter);
            return GeneralValue<string>("AppraisalSignOff", "SignOffComplete", parameter);
        }

        public static string NoticeDate(string RoleType, AppraisalCommentNoticeDate parameter)
        {
            parameter.Operate = RoleType;
          //  return AppraisalSignOff.NoticeDate(parameter);
            return GeneralValue<string>("AppraisalSignOff", "NoticeDate", parameter);
        }
        public static string AutoNoticeAction(string Operate, SignOffAutoNotice parameter)
        {          
            return GeneralValue<string>("AppraisalSignOff", "AutoNotice", parameter); 
        }
       

        public static string DigitalSignature(string Operate, string userID, string employeeID)
        {
            string sp = "dbo.EPA_sys_UserDigitalSignature @Operate,@UserID,@EmployeeID";
            var parameter = new
            {
                Operate = Operate,
                UserID = userID,
                EmployeeID = employeeID
            };
            return GeneralValue<string>(sp, parameter);



        }

        public static string DigitalSignature(string Operate, string userID, string employeeID, string createtime, string digitalKey)
        {
            string sp = "dbo.EPA_sys_UserDigitalSignature @Operate,@UserID,@EmployeeID,@CreateTime,@DigitalKey";

            var parameter = new
            {
                Operate = Operate,
                UserID = userID,
                EmployeeID = employeeID,
                CreateTime = createtime,
                DigitalKey = digitalKey
            };
            return GeneralValue<string>(sp, parameter);


        }

    }
}

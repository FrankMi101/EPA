﻿using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
using System.Web;

namespace DataAccess
{
    public class AppraisalDataAPP
    {

        public AppraisalDataAPP()
        { }
     
        public static DataSet APPWorkingList(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode )
        {
            string SP = "dbo.EPA_Appr_AppraisalData_APPList";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[9];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static string APPWorkingListContent(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_APPList";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[9];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
        public static string APPWorkingListContent(string action, string userID, string appraisalYear, string appraisalschool, string employeeID, string appraisalSession, string category, string area, string itemCode, string SeqNo, string GoalItem, string Value)
        {
            string SP = "dbo.EPA_Appr_AppraisalData_APPList";
            MyADO.MyParameterDB[] myPara = new MyADO.MyParameterDB[12];
            myBaseParameters.SetupBaseParameters(ref myPara, action, userID, appraisalYear, appraisalschool, employeeID, appraisalSession, category, area, itemCode);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 9, 10, "@SeqNo", SeqNo);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 10, 20, "@ActionItem", GoalItem);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 11, 2500, "@Value", HttpContext.Current.Server.HtmlDecode(Value));
            return SetSQLParameter.getMyDataValue(SP, myPara);
        }
    }
}
 
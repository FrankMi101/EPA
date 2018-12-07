using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
using System.Web;

namespace DataAccess
{
    public class AppraisalComments
    {

        public AppraisalComments()
        { }

        public static DataSet CommentsBank(string userID, string type, string owner )
        {
            string SP = "dbo.EPA_sys_CommentsBankOperation";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[4];
            myBaseParameters.SetupBaseParameters(ref myPara, "Get", userID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 2, 20, "@Type", type);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 3, 20, "@Owner", owner); 
            return SetSQLParameter.getMyDataSet(SP, myPara);

        }
        public static DataSet SchoolLearningPlan(string userID, string type, string owner)
        {
            string SP = "dbo.EPA_sys_CommentsBankTree";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[4];
            myBaseParameters.SetupBaseParameters(ref myPara, "Get", userID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 2, 20, "@Type", type);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 3, 20, "@Owner", owner);
            return SetSQLParameter.getMyDataSet(SP, myPara);

        }

        public static DataSet StrategyBank(string userID, string Panel)
        {
            string SP = "dbo.EPA_sys_CommentsStrategies";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[3];
            SetupBaseParameters(ref myPara, "Get", userID, Panel );
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
  
        public static DataSet StrategyBank(string userID, string Panel,string domain)
        {
            string SP = "dbo.EPA_sys_CommentsStrategies";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[4];
            SetupBaseParameters(ref myPara, "Get", userID, Panel,domain);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }

        public static DataSet StrategyBank(string userID, string Panel, string domain,string competency)
        {
            string SP = "dbo.EPA_sys_CommentsStrategies";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[5];
            SetupBaseParameters(ref myPara, "Get", userID, Panel, domain,competency);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static DataSet StrategyBank(string userID, string Panel, string domain, string competency,string lookfor)
        {
            string SP = "dbo.EPA_sys_CommentsStrategies";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[6];
            SetupBaseParameters(ref myPara, "Get", userID, Panel, domain, competency,lookfor);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
       

        public static DataSet OLFLibaray(string userID, string Level1)
        {
            string SP = "dbo.EPA_sys_CommentsOLFLibaray";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[3];
            SetupBaseParameters(ref myPara, "Get", userID, Level1);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static DataSet OLFLibaray(string userID, string Panel, string domain, string competency)
        {
            string SP = "dbo.EPA_sys_CommentsOLFLibaray";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[5];
            SetupBaseParameters(ref myPara, "Get", userID, Panel, domain, competency);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        public static DataSet OLFLibaray(string userID, string Panel, string domain, string competency, string lookfor)
        {
            string SP = "dbo.EPA_sys_CommentsOLFLibaray";
            myCommon.MyParameterDB[] myPara = new myCommon.MyParameterDB[6];
            SetupBaseParameters(ref myPara, "Get", userID, Panel, domain, competency, lookfor);
            return SetSQLParameter.getMyDataSet(SP, myPara);
        }
        private static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string panel)
        {
            SetSQLParameter.setParameterArray(myPara, DbType.String, 0, 30, "@Operate", operate);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 1, 30, "@UserID", userID);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 2, 10, "@Panel", panel);
        }

        private static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string panel,string domain)
        {
            SetupBaseParameters(ref myPara, operate, userID, panel);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 3, 10, "@DomainID", domain);
        }
        private static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string panel, string domain,string competency)
        {
            SetupBaseParameters(ref myPara, operate, userID, panel, domain);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 4, 10, "@Competency", competency);
        }
        private static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string panel, string domain, string competency, string lookfor)
        {
            SetupBaseParameters(ref myPara, operate, userID, panel, domain, competency);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 5, 10, "@LookFors", lookfor);
        }
        private static void SetupBaseParameters(ref myCommon.MyParameterDB[] myPara, string operate, string userID, string panel, string domain, string competency, string lookfor,string tipsId)
        {
            SetupBaseParameters(ref myPara, operate, userID, panel, domain, competency, lookfor);
            SetSQLParameter.setParameterArray(myPara, DbType.String, 6, 10, "@TipsID", tipsId);
        }

    }
}
 
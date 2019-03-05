using Microsoft.VisualStudio.TestTools.UnitTesting;
using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ClassLibrary;

namespace BLL.Tests
{
    [TestClass()]
    public class AppraisalExecuteTests_SetupList
    {
   
        [TestMethod()]
        public void ListofT_Test_DomainList_ReturnList()
        {
            //Arrange
            var myGridview = new System.Web.UI.WebControls.GridView();
            //var parameter1 =  new AppraisalPatameter()
            //{
            //    Operate = "Page",
            //    UserID = "mif",
            //    SchoolYear = "20182019",
            //    SchoolCode ="0525",
            //    SearchBy = "Teacher",
            //    SearchValue = "" 
            //};
            var parameter = new  SetupListParameter();
            parameter = CommonParameters.GetSetupListParameters("Get", "mif", "EPA", "","","","","",0,"");  
            int expect = 5;

            //Act

            var gridDataSource = BLL.AppraisalExecute.ListofT<DomainList>(parameter);
            myGridview.AutoGenerateColumns = true;
            myGridview.DataSource = gridDataSource;
            myGridview.DataBind();

            //Assert
            var result = myGridview.Rows.Count;
            Assert.AreEqual(expect, result, $"  Appraisal Staff List { result}");
        }


        [TestMethod()]
        public void ListofT_Test_CompetencyList_ReturnList()
        {
            //Arrange
            var myGridview = new System.Web.UI.WebControls.GridView();
            //var parameter1 =  new AppraisalPatameter()
            //{
            //    Operate = "Page",
            //    UserID = "mif",
            //    SchoolYear = "20182019",
            //    SchoolCode ="0525",
            //    SearchBy = "Teacher",
            //    SearchValue = "" 
            //};
            var parameter = new SetupListParameter();
            parameter = CommonParameters.GetSetupListParameters("Get", "mif", "EPA", "1", "","", "", "", 0, "");
            int expect = 4;

            //Act

            var gridDataSource = BLL.AppraisalExecute.ListofT<CompetencyList>(parameter);
            myGridview.AutoGenerateColumns = true;
            myGridview.DataSource = gridDataSource;
            myGridview.DataBind();

            //Assert
            var result = myGridview.Rows.Count ;
            Assert.AreEqual(expect, result, $"  Appraisal Staff List { result}");
        }
        [TestMethod()]
        public void ListofT_Test_LookForsList_ReturnList()
        {
            //Arrange
            var myGridview = new System.Web.UI.WebControls.GridView();
            var parameter = new SetupListParameter();
            string DomainID = "1";
            string CompetecnyID = "1";
            parameter = CommonParameters.GetSetupListParameters("Get", "mif", "EPA", DomainID, "", "","","", 0, CompetecnyID);
            int expect = 11;
          
            //Act

            var gridDataSource = BLL.AppraisalExecute.ListofT<LookForsList>(parameter);
            myGridview.AutoGenerateColumns = true;
            myGridview.DataSource = gridDataSource;
            myGridview.DataBind();

            //Assert
            var result = myGridview.Rows.Count;
            Assert.AreEqual(expect, result, $"  Appraisal Staff List { result}");
        }

    }
}
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
    public class AppraisalExecuteTests_List
    {
        [TestMethod()]
        public void AnyListTest()
        {
            Assert.Fail();
        }

        [TestMethod()]
        public void AnyListofTTest_AppraisalStaffList_ReturnList()
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
            var parameter1 = new AppraisalPatameter();
            parameter1 = CommonParameters.GetListParameters("Page", "mif", "20182019", "0529", "Teacher", ""); // new AppraisalPatameter()
            string expect = "208";

            //Act

            var gridDataSource = BLL.AppraisalExecute<AppraisalStaffList>.AnyListofT(parameter1);
            myGridview.AutoGenerateColumns = true;
            myGridview.DataSource = gridDataSource;
            myGridview.DataBind();

            //Assert
            var result = myGridview.Rows.Count.ToString();
            Assert.AreEqual(expect, result, $"  Appraisal Staff List { result}");
        }
        [TestMethod()]
        public void AnyListofTTest_AppraisalList_ReturnList()
        {
            //Arrange
            var myGridview = new System.Web.UI.WebControls.GridView();
            var parameter1 = new AppraisalPatameter();
            parameter1 = CommonParameters.GetListParameters("Page", "mif", "20182019", "0529", "Teacher", ""); // new AppraisalPatameter()
            string expect = "145";

            //Act

            var gridDataSource = BLL.AppraisalExecute<AppraisalList>.AnyListofT(parameter1);
            myGridview.AutoGenerateColumns = true;
            myGridview.DataSource = gridDataSource;
            myGridview.DataBind();

            //Assert
            var result = myGridview.Rows.Count.ToString();
            Assert.AreEqual(expect, result, $"  Appraisal List { result}");
        }
        [TestMethod()]
        public void AnyListofTTest_AppraisalNoticeList_ALP_ReturnList()
        {
            //Arrange
            var myGridview = new System.Web.UI.WebControls.GridView();
            var parameter1 = new AppraisalPatameter();
            parameter1 = CommonParameters.GetNoticeParameters("Page", "mif", "20182019", "0529", "All", "", "AppraisalStart", "ALP"); // new AppraisalPatameter() 
                                                                                                                                      // noticeType = "AppraisalAction, AppraisalStart,AuthorizeUndoSignOff,DemandUndoSignOff,SignOff,UndoSignOff"
                                                                                                                                      // notice area = "ALP,OBS,EPA"
            string expect = "127";

            //Act

            var gridDataSource = BLL.AppraisalExecute<AppraisalNotice>.AnyListofT(parameter1);
            myGridview.AutoGenerateColumns = true;
            myGridview.DataSource = gridDataSource;
            myGridview.DataBind();

            //Assert
            var result = myGridview.Rows.Count.ToString();
            Assert.AreEqual(expect, result, $"  Appraisal Notice ALP List { result}");
        }
        [TestMethod()]
        public void AnyListofTTest_AppraisalNoticeList_EPA_ReturnList()
        {
            //Arrange
            var myGridview = new System.Web.UI.WebControls.GridView();
            var parameter1 = new AppraisalPatameter();
            parameter1 = CommonParameters.GetNoticeParameters("Page", "mif", "20182019", "0529", "All", "", "AppraisalAction", "EPA");
            // noticeType = "AppraisalAction, AppraisalStart,AuthorizeUndoSignOff,DemandUndoSignOff,SignOff,UndoSignOff"
            // notice area = "ALP,OBS,EPA"
            string expect = "32";

            //Act

            var gridDataSource = BLL.AppraisalExecute<AppraisalNotice>.AnyListofT(parameter1);
            myGridview.AutoGenerateColumns = true;
            myGridview.DataSource = gridDataSource;
            myGridview.DataBind();

            //Assert
            var result = myGridview.Rows.Count.ToString();
            Assert.AreEqual(expect, result, $"  Appraisal Notice EPA List { result}");
        }
        [TestMethod()]
        public void AnyListofTTest_AppraisalNoticeList_OBS_ReturnList()
        {
            //Arrange
            var myGridview = new System.Web.UI.WebControls.GridView();
            var parameter1 = new AppraisalPatameter();
            parameter1 = CommonParameters.GetNoticeParameters("Page", "mif", "20182019", "0529", "All", "", "AppraisalAction", "OBS");
            // noticeType = "AppraisalAction, AppraisalStart,AuthorizeUndoSignOff,DemandUndoSignOff,SignOff,UndoSignOff"
            // notice area = "ALP,OBS,EPA"
            string expect = "32";

            //Act

            var gridDataSource = BLL.AppraisalExecute<AppraisalNotice>.AnyListofT(parameter1);
            myGridview.AutoGenerateColumns = true;
            myGridview.DataSource = gridDataSource;
            myGridview.DataBind();

            //Assert
            var result = myGridview.Rows.Count.ToString();
            Assert.AreEqual(expect, result, $"  Appraisal Notice OBS List { result}");
        }
      
    
    }
}
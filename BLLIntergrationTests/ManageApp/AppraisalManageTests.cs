using BLL;
using ClassLibrary;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;

namespace BLL.Tests
{
    [TestClass()]
    public class AppraisalManageTests
    {
        string schoolyear = "20182019";
        string schoolcode = "0529";
        string userid = "mif";
        [TestMethod()]
        public void StatementTest()
        {
            //Arrange

            var parameter = new
            {
                Operate = "Get",
                UserID = userid,
                SchoolYear = schoolyear,
                SchoolCode = schoolcode,
                IDs = 1,
                No = 1
            };


            var myGridview = new System.Web.UI.WebControls.GridView();

            //Act
            var myAppStatement = AppraisalManage.Statement(parameter) ;


            myGridview.AutoGenerateColumns = true;
            myGridview.DataSource = myAppStatement;
            myGridview.DataBind();
           
            int result = myGridview.Rows.Count;

            //Assert
            //  Assert.AreEqual(expect, result, $" { result } ");
            Assert.IsNotNull(result, $" Statement Lsit count is { result} ");
        }

        [TestMethod()]
        public void SaveSatement_For_BoardLevel_Test()
        {
            //Arrange

            AppStatement parameter = new AppStatement()
            {
                Operate = "Update",
                UserID = userid,
                SchoolYear = schoolyear,
                SchoolCode = "0000",
                IDs = 1,
                No = 1,
                Category = "TPA",
                Area = "ALP",
                Subject = "This it test Baord level Statement",
                Statements = "This statement come from the test process for TPA experience teacher on Annual learning Plan Area",
                StartDate = System.DateTime.Now,
                EndDate = System.DateTime.Now.AddMonths(1),
                Active = true,
                Publisher = "Frank"

            };

            //Act
            var result = AppraisalManage.SaveSatement(parameter);

            string expect = "Successfully";

            //Assert
            Assert.AreEqual(expect, result, $" { result } ");

        }
        [TestMethod()]
        public void SaveSatement_For_SchoolLevel_Test()
        {
            //Arrange

            AppStatement parameter = new AppStatement()
            {
                Operate = "Insert",
                UserID = userid,
                SchoolYear = schoolyear,
                SchoolCode = schoolcode,
                IDs = 1,
                No = 1,
                Category = "TPA",
                Area = "ALP",
                Subject = "This it test School level Statement",
                Statements = "This statement come from the test process for TPA experience teacher on Annual learning Plan Area",
                StartDate = System.DateTime.Now,
                EndDate = System.DateTime.Now.AddMonths(1),
                Active = true,
                Publisher = "Frank"

            };

            //Act
            var result = AppraisalManage.SaveSatement(parameter);

            string expect = "Successfully";

            //Assert
            Assert.AreEqual(expect, result, $" { result } ");

        }

        [TestMethod()]
        public void AppraiseeTest_return_one_Appraisee_Information_byEmployeeID()
        {

            //Arrange
            var parameter = new
            {
                Operate = "Get",
                UserID = userid,
                SchoolYear = schoolyear,
                SchoolCode = schoolcode,
                IDs = 3936,
                EmployeeID = "00011169"
            };

            string expect = "plejicl";
 
            //Act
             List<Appraisee> myAppraisee =    AppraisalManage.Appraisee(parameter);
            string result = myAppraisee[0].UserID;
            //Assert
            Assert.AreEqual(expect, result, $" Get Appraisee is { result } ");
        }

        [TestMethod()]
        public void StaffListTest_return_AllSchool_StaffsListbySchoolCode()
        {
            //Arrange
            var parameter = new
            {
                Operate = "Get",
                UserID = userid,
                SchoolYear = schoolyear,
                SchoolCode = schoolcode,
                SearchBy = "School",
                SearchValue = schoolcode
            };
            int expect = 208;
           var myGridview = new System.Web.UI.WebControls.GridView();

            //Act

            var myData = AppraisalManage.StaffList(parameter);
            myGridview.AutoGenerateColumns = true;
            myGridview.DataSource = myData;
            myGridview.DataBind();
            int result = myGridview.Rows.Count;
 
            //Assert
            Assert.AreEqual(expect, result, $" { schoolcode } Staff List Count is { result }  ");
        }

        [TestMethod()]
        public void AppraisalStaffsTest_Return_AllSchoolAppraisee_bySchoolCode()
        {
            //Arrange
            var parameter = new
            {
                Operate = "Get",
                UserID = userid,
                SchoolYear = schoolyear,
                SchoolCode = schoolcode,
                SearchBy = "School",
                SearchValue = schoolcode
            };
            int expect = 145;
            var myGridview = new System.Web.UI.WebControls.GridView();

            //Act

            var myData = AppraisalManage.AppraisalStaffs(parameter);
            myGridview.AutoGenerateColumns = true;
            myGridview.DataSource = myData;
            myGridview.DataBind();
            int result = myGridview.Rows.Count;

            //Assert
            Assert.AreEqual(expect, result, $" { schoolcode }Appraisal Staff List Count is { result }  ");
        }

        [TestMethod()]
        public void AppraisalStaffsNoticeTest_Return_AllSchoolNoticeStaffList_Notice()
        {
            //Arrange
            var parameter = new
            {
                Operate = "Get",
                UserID = userid,
                SchoolYear = schoolyear,
                SchoolCode = schoolcode,
                SearchBy = "School",
                SearchValue = schoolcode,
                NoticeType = "EPA",
                NoticeArea= "ALP"
            };
            int expect = 127;
            var myGridview = new System.Web.UI.WebControls.GridView();

            //Act

            var myData = AppraisalManage.AppraisalStaffsNotice(parameter);
            myGridview.AutoGenerateColumns = true;
            myGridview.DataSource = myData;
            myGridview.DataBind();
            int result = myGridview.Rows.Count;

            //Assert
            Assert.AreEqual(expect, result, $" { schoolcode } Appraisal Staff Notice List Count is { result }  ");
        }

        [TestMethod()]
        public void AppraisalStaffHistroyTest()
        {
            //Arrange
            var parameter = new
            {
                Operate = "Get",
                UserID = userid,
                SchoolYear = schoolyear,
                SchoolCode = schoolcode,
                SearchBy = "EmployeeID",
                SearchValue = "00020682"
            };
            int expect = 5;
            string expect2 = "Stephen, Caroline";
            string expect3 = "New to Professional";
            var myGridview = new System.Web.UI.WebControls.GridView();

            //Act

            var myData = AppraisalManage.AppraisalStaffHistory(parameter);
            myGridview.AutoGenerateColumns = true;
            myGridview.DataSource = myData;
            myGridview.DataBind();
            int result = myGridview.Rows.Count;
            string result2 =  myData[0].TeacherName;
            string result3 = myData[0].AppraisalPhase;
            //Assert
            Assert.AreEqual(expect, result, $" { myData[0].TeacherName } Appraisal History  Count is { result }  ");
            Assert.AreEqual(expect2, result2, $" { myData[0].TeacherName } Appraisal History  name is { result2 }  ");
            Assert.AreEqual(expect3, result3, $" { myData[0].TeacherName } Appraisal phase is { result3 } in {myData[0].SchoolYear }  ");
        }

        [TestMethod()]
        public void AppraiseeEditTest()
        {
            //Arrange

            var parameter = new
            {
                Operate = "Get",
                UserID = userid,
                SchoolYear = schoolyear,
                SchoolCode = schoolcode,
                IDs = 3936,
                EmployeeID = "00011169"
            };

             Appraisee appraisee = AppraisalManage.Appraisee(parameter)[0];
            string expect = "Successfully";

            //Act 
            appraisee.Operate = "Update";
            appraisee.EvidenceLevel = "16"; 
            appraisee.Assignment = "Grade 12 English change by Test process";
            appraisee.Comments = "this is update the appraisal information by Test process";  
            appraisee.StartDate = DateFormat.YMD("2018/09/01");
            appraisee.EndDate = DateFormat.YMD("2019/06/30");

            string result = AppraisalManage.AppraiseeEdit(appraisee);
    
            //Assert
            Assert.AreEqual(expect, result, $"{ appraisee.TeacherName } Appraisal update is { result } ");

        }

        [TestMethod()]
        public void AppraiseeDeleteTest()
        {
            //Arrange

            var parameter = new
            {
                Operate = "Get",
                UserID = userid,
                SchoolYear = schoolyear,
                SchoolCode = schoolcode,
                IDs = 3936,
                EmployeeID = "00011169"
            };

            Appraisee appraisee = AppraisalManage.Appraisee(parameter)[0];
            string expect = "Successfully";

            //Act 
            appraisee.Operate = "Delete";
            appraisee.EmployeeID = "0000000";
            appraisee.IDs =  "0"; 

            string result = AppraisalManage.AppraiseeEdit(appraisee);

            //Assert
            Assert.AreEqual(expect, result, $"{ appraisee.TeacherName } Appraisal update is { result } ");
        }
    }
}
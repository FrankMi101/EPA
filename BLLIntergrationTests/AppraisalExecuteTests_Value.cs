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
    public class AppraisalExecuteTests_Value
    {

        public void AnyValueTest()
        {
            Assert.Fail();
        }
        [TestMethod()]
        public void AnyValueofT_Test_GetDate_OBS_ReturnNothing()
        {
            //Arrange
            var parameter = new AppraisalDate();
            string expect = "";
            // Date OBS21XX not exists in system
            parameter = CommonParameters.GetDateParameter("Get", "mif", "20182019", "0529", "00000000X", "Appraisal1", "OBS21XX", "EPA", "SUM", "", "");

            //Act
            string result = BLL.AppraisalExecute.ValueofT<AppraisalDate>(parameter);

            //Assert
            Assert.AreEqual(expect, result, $"  Appraisal observation date  { result}");
        }
        [TestMethod()]
        public void AnyValueofT_Test_GetDate_OBS_ReturnValue()
        {
            //Arrange
            var parameter = new AppraisalDate();
            string expect = "2018/11/30";
            parameter = CommonParameters.GetDateParameter("Save", "mif", "20182019", "0529", "00000000X", "Appraisal1", "OBS21", "EPA", "SUM", expect, "Test get Date");
            string result1 = BLL.AppraisalExecute.ValueofT<AppraisalDate>(parameter);
            //Act
            parameter.Operate = "GetDate";
            string result = BLL.AppraisalExecute.ValueofT<AppraisalDate>(parameter);

            //Assert
            Assert.AreEqual(expect, result, $"   Appraisal observation date { result}");
        }
        public enum Observation  { OBS21, OBS22, OBS23 }
        [TestMethod()]
        public void AnyValueofT_Test_SaveDate_OBS_ReturnSuccessfullyValue()
        {
            //Arrange
            var parameter = new AppraisalDate();
            parameter = CommonParameters.GetDateParameter("Save", "mif", "20182019", "0529", "00000000T", "Appraisal1", "", "EPA", "SUM", "2018/12/30", "Test save Date");
            string expect = "Successfully";

            string[] Obs = { "OBS21", "OBS22", "OBS23" };
            foreach (string obs in Obs)
            {   
                //Act
                parameter.ItemCode = obs;
                string result = BLL.AppraisalExecute.ValueofT<AppraisalDate>(parameter);

                //Assert
                Assert.AreEqual(expect, result, $"   Appraisal observation date { result}");

            }
            //Act
            //foreach (Observation val in Enum.GetValues(typeof(Observation)))
            //{
            //    parameter = CommonParameters.GetDateParameter("Save", "mif", "20182019", "0529", "00000000X", "Appraisal1", val.ToString(), "EPA", "SUM", "2018/12/30", "Test save Date");

            //    string result = BLL.AppraisalExecute<AppraisalDate>.AnyValueofT(parameter);
            //    //Assert
            //    Assert.AreEqual(expect, result, $"   Appraisal observation date { result}");
            //}


        }
        [TestMethod()]
        public void AnyValueofT_Test_GetText_SingleCommonText_ReturnValue()
        {
            //Arrange
            var myText = new System.Web.UI.WebControls.TextBox();
            var parameter = new AppraisalComment();
            myText.Text = "some Test Text";
            string expect = myText.Text;

            parameter = CommonParameters.GetCommentParameter("Save", "mif", "20182019", "0529", "000000009", "Appraisal1", "ALP31", "EPA", "ALP", expect);
            BLL.AppraisalExecute.ValueofT<AppraisalDate>(parameter);

            parameter.Operate = "Get";

            //Act

            myText.Text = BLL.AppraisalExecute<AppraisalComment>.AnyValueofT(parameter);
            string result = myText.Text;


            //Assert
            Assert.AreEqual(expect, result, $"  Appraisal single text comments { result}");
        }
        [TestMethod()]
        public void AnyValueofT_Test_GetText_SingleCommonText_ReturnNothing()
        {
            //Arrange
            var myText = new System.Web.UI.WebControls.TextBox();
            var parameter = new AppraisalComment();
            // employeeID does not existe in system
            parameter = CommonParameters.GetCommentParameter("Get", "mif", "20182019", "0529", "00000001", "Appraisal1", "ALP31", "EPA", "ALP", "");
            string expect = "";

            //Act

            myText.Text = BLL.AppraisalExecute<AppraisalComment>.AnyValueofT(parameter);
            string result = myText.Text;


            //Assert
            Assert.AreEqual(expect, result, $"  Appraisal single text comments { result}");
        }
        public void AnyValueofT_Test_SaveText_SingleCommonText_ReturnSuccessfully()
        {
            //Arrange
            var myText = new System.Web.UI.WebControls.TextBox();
            myText.Text = "some Test Text";
            var parameter = new AppraisalComment();
            parameter = CommonParameters.GetCommentParameter("Save", "mif", "20182019", "0529", "00003878", "Appraisal1", "ALP31", "EPA", "ALP", myText.Text);

            //Act

            string result = BLL.AppraisalExecute<AppraisalComment>.AnyValueofT(parameter);
            string expect = "Successfully";


            //Assert
            Assert.AreEqual(expect, result, $"  Appraisal single text comments save{ result}");
            parameter.Operate = "Get";
            parameter.Value = "";
            var getText = BLL.AppraisalExecute<AppraisalComment>.AnyValueofT(parameter);
            Assert.AreEqual(myText.Text, getText, $"  Appraisal single text comments save { getText}");

        }
        [TestMethod()]
        public void AnyValueofT_Test_GetText_CommonTextByCompetency_ReturnNothing()
        {
            //Arrange
            var myText = new System.Web.UI.WebControls.TextBox();
            var parameter = new AppraisalCompetency();
            // employeeID does not existe in system
            parameter = CommonParameters.GetCompetencyParameter("Get", "mif", "20172018", "0529", "0000000001", "Appraisal1", "SUM51", "EPA", "SUM", "1", "1", "", "");
            string expect = "";

            //Act

            myText.Text = BLL.AppraisalExecute<AppraisalCompetency>.AnyValueofT(parameter);
            string result = myText.Text;


            //Assert
            Assert.AreEqual(expect, result, $"  Appraisal Domain Competency text comments { result}");
        }
        [TestMethod()]
        public void AnyValueofT_Test_GetText_CommonTextByCompetency_ReturnValue()
        {
            //Arrange
            var myText = new System.Web.UI.WebControls.TextBox();
            myText.Text = "Some Domain Competency Comments Test";
            string expect = myText.Text;
            var parameter = CommonParameters.GetCompetencyParameter("Save", "mif", "20182019", "0529", "000000009", "Appraisal1", "SUM51", "EPA", "SUM", "1", "1", "", myText.Text);
            AppraisalExecute<AppraisalCompetency>.AnyValueofT(parameter);

            //Act
            parameter.Operate = "Get";
            myText.Text = BLL.AppraisalExecute<AppraisalCompetency>.AnyValueofT(parameter);
            string result = myText.Text;


            //Assert
            Assert.AreEqual(expect, result, $"  Appraisal Domain Competency text comments { result}");
        }

        [TestMethod()]
        public void AnyValueofT_Test_GetRate_CommonTextByCompetency_ReturnZero()
        {
            //Arrange           
            var parameter = new AppraisalCompetency();
            // employeeID does not existe in system
            parameter = CommonParameters.GetCompetencyParameter("Rate", "mif", "20172018", "0529", "0000000001", "Appraisal1", "SUM51", "EPA", "SUM", "1", "1", "", "");
            string expect = "0";

            //Act
            string result = BLL.AppraisalExecute<AppraisalCompetency>.AnyValueofT(parameter);

            //Assert
            Assert.AreEqual(expect, result, $"  Appraisal Domain Competency text comments { result}");
        }
        [TestMethod()]
        public void AnyValueofT_Test_GetRate_CommonTextByCompetency_ReturnValue()
        {
            //Arrange
            var mylist = new System.Web.UI.WebControls.RadioButtonList();
            var parameter1 = CommonParameters.GetListParameters("CompetencyRatingList", "mif", "TPA", "SUM31", "");
            AssemblyListControl<CommonList>.SetList(mylist, parameter1, "3");
            var listCount = mylist.Items.Count;
            string expect = mylist.SelectedValue;
            string expecttext = mylist.SelectedItem.Text;
            var parameter = CommonParameters.GetCompetencyParameter("Save", "mif", "20182019", "0529", "000000009", "Appraisal1", "SUM51", "EPA", "SUM", "1", "1", expect, "Test Rate Value");
            AppraisalExecute<AppraisalCompetency>.AnyValueofT(parameter);

            //Act
            parameter.Operate = "Rate";
            string result = BLL.AppraisalExecute<AppraisalCompetency>.AnyValueofT(parameter);

            //Assert
            Assert.AreEqual(expect, result, $"  Appraisal Domain Competency text comments { result}");
        }

        [TestMethod()]
        public void AnyValueofT_Test_SaveText_CommonTextByCompetency_ReturnSuccessfully()
        {
            //Arrange
            var myText = new System.Web.UI.WebControls.TextBox();
            myText.Text = "Domain 1 Competency 1 Some Test Text";
            var myRate = "1";
            var parameter = new AppraisalCompetency();
            parameter = CommonParameters.GetCompetencyParameter("Save", "mif", "20182019", "0529", "0000000009", "Appraisal1", "SUM51", "EPA", "SUM", "1", "1", myRate, myText.Text);
            string expect = "Successfully";

            //Act

            myText.Text = BLL.AppraisalExecute<AppraisalCompetency>.AnyValueofT(parameter);
            string result = myText.Text;


            //Assert
            Assert.AreEqual(expect, result, $"  Appraisal Domain Competency text comments save { result}");
        }
    }
}
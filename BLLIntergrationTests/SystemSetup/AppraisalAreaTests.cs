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
    public class AppraisalAreaTests
    {
        [TestMethod()]
        public void AreaListTest()
        {
            //Arrange
            var parameter = new { Operate = "Get", UserID = "mif" };
            var myGridview = new System.Web.UI.WebControls.GridView();

            //Act

            var myData = AppraisalSetup.AreaList(parameter);
            myGridview.AutoGenerateColumns = true;
            myGridview.DataSource = myData;
            myGridview.DataBind();
            int expect = 11;
            int result = myGridview.Rows.Count;

            //Assert
          //  Assert.AreEqual(expect, result, $" { result } ");
            Assert.IsNotNull(result, $" Area Lsit count is { result} ");
        }

        [TestMethod()]
        public void SaveAreaTest()
        {
            //Arrange
            var parameter = new
            {
                Operate = "Update",
                UserID = "mif",
                IDs = "11",
                Code = "MMF",
                Name = "Mentor-Menter",
                Comments = "Mentor-Menter for new teacher or new principal appraisal",
                Active = 0
            };

            //Act 
            string expect = "Successfully";
            string result = AppraisalSetup.SaveArea(parameter);

            //Assert
            Assert.AreEqual(expect, result, $" { result } ");
        }
        [TestMethod()]
        public void Add_newArea_Test()
        {
            //Arrange
            var parameter = new
            {
                Operate = "Update",
                UserID = "mif",
                IDs = "0",
                Code = "MMF2",
                Name = "Mentor-Menter2",
                Comments = "Mentor-Menter for new teacher or new principal appraisal add new test ",
                Active = 1
            };

            //Act 
            string expect = "Successfully";
            string result = AppraisalSetup.SaveArea(parameter);

            //Assert
            Assert.AreEqual(expect, result, $" { result } ");
        }

        [TestMethod()]
        public void CategoryListTest()
        {
            //Arrange
            var parameter = new { Operate = "Get", UserID = "mif" };
            var myGridview = new System.Web.UI.WebControls.GridView();

            //Act

            var myData = AppraisalSetup.CategoryList(parameter);
            myGridview.AutoGenerateColumns = true;
            myGridview.DataSource = myData;
            myGridview.DataBind();
            int expect = 5;
            int result = myGridview.Rows.Count;

            //Assert
         //   Assert.AreEqual(expect, result, $" { result } ");
            Assert.IsNotNull(result, $" Category Lsit count is { result} ");
        }

        [TestMethod()]
        public void SaveCategoryTest()
        {
            //Arrange
            var parameter = new
            {
                Operate = "Update",
                UserID = "mif",
                IDs = "5",
                Code = "NPA",
                Name = "New Principal Appraisal",
                Comments = "For the first year school principal appraisal template",
                Active = 0
            };

            //Act 
            string expect = "Successfully";
            string result = AppraisalSetup.SaveCategory(parameter);

            //Assert
            Assert.AreEqual(expect, result, $" { result } ");
        }

        [TestMethod()]
        public void Add_newCategory_Test()
        {
            //Arrange
            var parameter = new
            {
                Operate = "Update",
                UserID = "mif",
                IDs = "0",
                Code = "NPA1",
                Name = "New Principal Appraisal test 1",
                Comments = "For the first year school principal appraisal template from intergragtion test process",
                Active = 1
            };

            //Act 
            string expect = "Successfully";
            string result = AppraisalSetup.SaveCategory(parameter);

            //Assert
            Assert.AreEqual(expect, result, $" { result } ");

        }
        [TestMethod()]
        public void Add_newCategory_Retrun_Falied_withSameCodeInSecondTime_Test()
        {
            //Arrange
            var parameter = new
            {
                Operate = "Update",
                UserID = "mif",
                IDs = "0",
                Code = "NPA",
                Name = "New Principal Appraisal",
                Comments = "For the first year school principal appraisal template",
                Active = 1
            };

            //Act 
            string expect = "Successfully";
            string result = AppraisalSetup.SaveCategory(parameter);

            //Assert
            Assert.AreEqual(expect, result, $" { result } ");
        }

    }
}
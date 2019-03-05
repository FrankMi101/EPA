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
    public class AssemblyListControlTests
    {
        [TestMethod()]
        public void SetListTest_buildingRadioButtonList()
        {
            //Arrange
            var mylist = new System.Web.UI.WebControls.RadioButtonList();
            var parameter = CommonParameters.GetListParameters("CompetencyRatingList", "mif", "TPA", "SUM31", "");

            string expect = "Satisfactory";

            //Act
            AssemblyListControl<CommonList>.SetList(mylist, parameter);
            mylist.SelectedIndex = 0;


            //Assert
            var result = mylist.SelectedItem.Text;
            Assert.AreEqual(expect, result, $"  building a radiobuttonlist and select value { result}");
 
        }
        [TestMethod()]
        public void SetListTest_buildingDropdownList_SchoolYear()
        {
            //Arrange
            var mylist = new System.Web.UI.WebControls.DropDownList();
            var parameter = CommonParameters.GetListParameters("SchoolYear", "mif", "", "", "");

            string expect = "20172018";

            //Act
            AssemblyListControl<CommonList>.SetList(mylist, parameter);
            AssemblyListControl<CommonList>.SetValue(mylist, expect);
            //Assert
            var result = mylist.SelectedValue;
            Assert.AreEqual(expect, result, $"  building a dropdown list and select value { result}");

        }
        [TestMethod()]
        public void SetListTest_buildingDropdownListAndInitialize_SchoolYear()
        {
            //Arrange
            var mylist = new System.Web.UI.WebControls.DropDownList();
            var parameter = CommonParameters.GetListParameters("SchoolYear", "mif", "", "", "");

            string expect = "20172018";

            //Act
            AssemblyListControl<CommonList>.SetList(mylist, parameter, expect);
             //Assert
            var result = mylist.SelectedValue;
            Assert.AreEqual(expect, result, $"  building a dropdown list and select value  { result}");

        }

      

        [TestMethod()]
        public void SetList2Test_BuildingSchoolandSchoolCodeList()
        {
            //Arrange
            var myCode = new System.Web.UI.WebControls.DropDownList();
                 var mySchool = new System.Web.UI.WebControls.DropDownList();
            var parameter = CommonParameters.GetListParameters("SchoolList", "mif", "Admin", "20182109", "0529");
            string expect = "0529";

            //Act
            AssemblyListControl<CommonListSchool>.SetList2(myCode,mySchool, parameter);
            AssemblyListControl<CommonListSchool>.SetValue(myCode, expect);
            AssemblyListControl<CommonListSchool>.SetValue(mySchool, expect);
 

            //Assert
            var result = myCode.SelectedValue;
            var result2 = mySchool.SelectedValue;
            Assert.AreEqual(expect, result, $"  building a dropdown list and select value  { result}");
            Assert.AreEqual(expect, result2, $"  building a dropdown list and select value  { result2}");
        }

        [TestMethod()]
        public void SetList2Test_BuildingandInitial_SchoolandSchoolCodeList()
        {
            //Arrange
            var myCode = new System.Web.UI.WebControls.DropDownList();
            var mySchool = new System.Web.UI.WebControls.DropDownList();
            var parameter = CommonParameters.GetListParameters("SchoolList", "mif", "Admin", "20182109", "0529");
            string expect = "0529";

            //Act
            AssemblyListControl<CommonListSchool>.SetList2(myCode, mySchool, parameter, expect); 
            //Assert
            var result = myCode.SelectedValue;
            var result2 = mySchool.SelectedValue;
            Assert.AreEqual(expect, result, $"  building a dropdown list and select value  { result}");
            Assert.AreEqual(expect, result2, $"  building a dropdown list and select value  { result2}");
        }

        [TestMethod()]
        public void SetValueTest()
        {
            //Arrange
            var mylist = new System.Web.UI.WebControls.DropDownList();
            var parameter = CommonParameters.GetListParameters("SchoolYear", "mif", "", "", "");

            string expect = "20172018";

            //Act
            AssemblyListControl<CommonList>.SetList(mylist, parameter);
            AssemblyListControl<CommonList>.SetValue(mylist, expect);
            //Assert
            var result = mylist.SelectedValue;
            Assert.AreEqual(expect, result, $"  building a dropdown list and select value { result}");
        }
    }
}
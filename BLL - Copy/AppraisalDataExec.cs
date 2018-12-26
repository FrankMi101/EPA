using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL
{
    public class AppraisalDataExec
    {
        public static string Comments (AppraisalComment parameter)
        {
            var ad = new AppraisalData();
            return ad.Comment(parameter);
        }
    }
}

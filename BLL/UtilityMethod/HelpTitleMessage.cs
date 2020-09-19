using ClassLibrary;

namespace BLL
{
    public class HelpTitleMessage
    {
        public HelpTitleMessage()
        { }
        public static string GetContent(TitleHelp parameter)
        {
            string sp = "dbo.EPA_sys_HelpTitleContentSP @Operate,@UserID,@Category,@Area,@Code,@ContentType";

            return AppraisalCommon.CommonValue<string>(sp, parameter);
        }
        public static string SaveContent(TitleHelp parameter)
        {
            string sp = "dbo.EPA_sys_HelpTitleContentSP @Operate,@UserID,@Category,@Area,@Code,@ContentType,@Value";

            return AppraisalCommon.CommonValue<string>(sp, parameter);
        }
    }
}

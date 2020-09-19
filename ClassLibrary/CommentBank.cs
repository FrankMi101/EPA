namespace ClassLibrary
{
    public class CommentBank
    {
        public string Comments { get; set; }
        public string DomainName { get; set; }
        public string Shared { get; set; }
        public string IDs { get; set; }
        public string DomainID { get; set; }
        public string SharedID { get; set; }
        public string Active { get; set; }
        public int RowNo { get; set; }
        public  string Action { get; set; }

        public string ActionS { get; set; }

    }

    public class StrategyBank : DomainTips
    {
        public string Panel { get; set; }
        public int TreeLevel { get; set; }
        public string Notes { get; set; }
        public int RowNo { get; set; }

    }

    public class CommentsSnippet
    {
        public string Operate { get; set; }
        public string UserID { get; set; }
        public string CategoryID { get; set; }
        public string AreaID { get; set; }
        public string ItemCode { get; set; }
        public int DomainID { get; set; }
        public int CompetencyID { get; set; }
        public int RowNo { get; set; }
        public string Comments { get; set; } 
    }
}

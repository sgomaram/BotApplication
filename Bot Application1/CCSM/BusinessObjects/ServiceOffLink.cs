using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CCSM.BusinessObjects
{
    public class ServiceOffLink
    {

        public ServiceOffLink() { }

        private int serviceOffId;
        public int ServiceOffId
        {
            get { return serviceOffId; }
            set { serviceOffId = value; }
        }
        private string serviceOffName;
        public string ServiceOffName
        {
            get { return serviceOffName; }
            set { serviceOffName = value; }
        }
        private string serviceOffImage;
        public string ServiceOffImage
        {
            get { return serviceOffImage; }
            set { serviceOffImage = value; }
        }
        private string searchKeywords;
        public string SearchKeywords
        {
            get { return searchKeywords; }
            set { searchKeywords = value; }
        }
        private int companyId;
        public int CompanyId
        {
            get { return companyId; }
            set { companyId = value; }
        }

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(this.CompanyId);
            sb.Append(", ");
            sb.Append(this.serviceOffId);
            sb.Append(", ");
            sb.Append(this.ServiceOffImage);
            sb.Append(", ");
            sb.Append(this.ServiceOffName);
            return sb.ToString();
        }

    }
}

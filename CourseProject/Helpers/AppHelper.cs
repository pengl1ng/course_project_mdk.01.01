using CourseProject.DataBaseModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace CourseProject.Helpers
{
    public static class AppHelper
    {
        public static Frame MainFrame = new Frame();
        public static DbEntities DbConnect = new DbEntities();
    }
}

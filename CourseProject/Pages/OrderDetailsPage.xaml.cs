using CourseProject.DataBaseModel;
using CourseProject.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace CourseProject.Pages
{
    /// <summary>
    /// Логика взаимодействия для OrderDetailsPage.xaml
    /// </summary>
    public partial class OrderDetailsPage : Page
    {
        public OrderDetailsPage(Orders order)
        {
            InitializeComponent();
            var orderDetail = from o in AppHelper.DbConnect.Orders
                              join op in AppHelper.DbConnect.Order_Product on o.OrderId equals op.OrderId
                              join u in AppHelper.DbConnect.Users on o.OrderClient equals u.UserId
                              join p in AppHelper.DbConnect.Products on op.ProductId equals p.ProductId
                              where o.OrderId == order.OrderId
                              select new
                              {
                                  OrderId = "Номер заказа: " + order.OrderId.ToString(),
                                  OrderDate = "Дата заказа: " + order.OrderCreateDate.Day.ToString() + "." + order.OrderCreateDate.Month.ToString() +
                                              "." + order.OrderCreateDate.Year.ToString(),
                                  ProductImage = p.ProductImage.ToString(),
                                  ProductName = p.ProductName.ToString(),
                                  ProductAmount = op.ProductAmount.ToString() + " шт.",
                                  ProductPrice = (p.ProductPrice * op.ProductAmount).ToString() + " руб.",
                              };
            lvOrderDetails.ItemsSource = orderDetail.ToList();
            tblockOrderId.Text = "Номер заказа " + order.OrderId.ToString();
            tblockDate.Text = "Дата заказа " + order.OrderCreateDate.Day.ToString() + "." + order.OrderCreateDate.Month.ToString() +
                              "." + order.OrderCreateDate.Year.ToString();
            DataContext = order;
        }

        private void btnToMain_Click(object sender, RoutedEventArgs e)
        {
            AppHelper.MainFrame.GoBack();
        }
    }
}

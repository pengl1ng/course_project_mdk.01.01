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
    /// Логика взаимодействия для OrdersPage.xaml
    /// </summary>
    public partial class OrdersPage : Page
    {
        public OrdersPage(Users user)
        {
            InitializeComponent();
            lvOrders.ItemsSource = AppHelper.DbConnect.Orders.Where(x => x.Users.UserId == user.UserId).ToList();
            DataContext = user;
        }

        private void btnToMain_Click(object sender, RoutedEventArgs e)
        {
            AppHelper.MainFrame.GoBack();
        }

        private void btnOrder_Click(object sender, RoutedEventArgs e)
        {
            AppHelper.MainFrame.Navigate(new OrderDetailsPage((sender as Button).DataContext as Orders));
        }
    }
}

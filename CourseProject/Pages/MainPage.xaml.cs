using CourseProject.Helpers;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
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
    /// Логика взаимодействия для MainPage.xaml
    /// </summary>
    public partial class MainPage : Page
    {
        public MainPage()
        {
            InitializeComponent();
            lvProducts.DataContext = AppHelper.DbConnect.Products.ToList();
        }

        private void btnCart_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnAuthorize_Click(object sender, RoutedEventArgs e)
        {
            AppHelper.MainFrame.Navigate(new AuthorizationPage());
        }

        private void btnAddToCart_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}

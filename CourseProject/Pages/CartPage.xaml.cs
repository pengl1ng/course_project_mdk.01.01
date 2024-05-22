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
    /// Логика взаимодействия для CartPage.xaml
    /// </summary>
    public partial class CartPage : Page
    {
        Users usr = new Users();
        public CartPage(Users user)
        {
            InitializeComponent();
            var cartList = from c in AppHelper.DbConnect.Cart
                           join cp in AppHelper.DbConnect.Cart_Products on c.CartId equals cp.CartId
                           join p in AppHelper.DbConnect.Products on cp.ProductId equals p.ProductId
                           where c.ClientId == user.UserId
                           select new
                           {
                               ProductImage = p.ProductImage.ToString(),
                               ProductName = p.ProductName.ToString(),
                               Amount = cp.ProductAmountInCart.ToString() + " шт.",
                               ProductPrice = (p.ProductPrice * cp.ProductAmountInCart).ToString() + " руб."
                           };
            lvCart.ItemsSource = cartList.ToList();
            DataContext = user;
            usr = user;
        }

        private void btnOrder_Click(object sender, RoutedEventArgs e)
        {
            var prices = from c in AppHelper.DbConnect.Cart
                         join cp in AppHelper.DbConnect.Cart_Products on c.CartId equals cp.CartId
                         join p in AppHelper.DbConnect.Products on cp.ProductId equals p.ProductId
                         where c.ClientId == usr.UserId
                         select new
                         {
                             Price = p.ProductPrice * cp.ProductAmountInCart
                         };
            Orders newOrder = new Orders
            {
                OrderClient = usr.UserId,
                OrderStatus = 1,
                OrderCreateDate = DateTime.Now
            };

            AppHelper.DbConnect.Orders.Add(newOrder);
            AppHelper.DbConnect.SaveChanges();

            
        }

        private void btnToMain_Click(object sender, RoutedEventArgs e)
        {
            AppHelper.MainFrame.GoBack();
        }
    }
}

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
    /// Логика взаимодействия для AuthorizationPage.xaml
    /// </summary>
    public partial class AuthorizationPage : Page
    {
        public AuthorizationPage()
        {
            InitializeComponent();
        }

        private void btnAuthorize_Click(object sender, RoutedEventArgs e)
        {
            if (TBoxLogin.Text != "" && PassBox.Password != "")
            {
                try
                {
                    var user = AppHelper.DbConnect.Users.FirstOrDefault(x => x.UserLogin == TBoxLogin.Text && x.UserPassword == PassBox.Password);

                    if (user != null)
                    {
                        AppHelper.MainFrame.Navigate(new MainPage(user));
                    }
                    else
                    {
                        MessageBox.Show("Данного пользователя не существует", "Ошибка авторизации", MessageBoxButton.OK, MessageBoxImage.Warning);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private void btnRegistration_Click(object sender, RoutedEventArgs e)
        {
            AppHelper.MainFrame.Navigate(new RegistartionPage());
        }
    }
}

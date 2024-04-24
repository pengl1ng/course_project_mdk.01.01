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
    /// Логика взаимодействия для RegistartionPage.xaml
    /// </summary>
    public partial class RegistartionPage : Page
    {
        Users newUser;
        public RegistartionPage()
        {
            InitializeComponent();
            newUser = new Users();
            newUser.UserRole = 2;
            SpReg.DataContext = newUser;
        }

        private void btnRegist_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var userExists = AppHelper.DbConnect.Users.FirstOrDefault(x => x.UserEMail == TBoxEmail.Text);
                if (userExists == null)
                {
                    if (TBoxEmail.Text.Length >= 4 && TBoxLogin.Text.Length >= 4 && TBoxName.Text.Length >= 4
                        && TBoxPatronimyc.Text.Length >= 4 && TBoxSurname.Text.Length >= 4 && TBoxPassword.Text.Length >= 4)
                    {
                        AppHelper.DbConnect.Users.Add(SpReg.DataContext as Users);
                        AppHelper.DbConnect.SaveChanges();
                        MessageBox.Show("Пользователь успешно зарегистрирован", "Успешная регистрация", MessageBoxButton.OK, MessageBoxImage.Information);
                        AppHelper.MainFrame.GoBack();
                    }
                    else
                    {
                        MessageBox.Show("Длина всех данных должна быть более 4х символов!", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Warning);
                    }
                }
                else
                {
                    MessageBox.Show("Пользователь с таким адресом эл. почты уже существует", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Warning);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}

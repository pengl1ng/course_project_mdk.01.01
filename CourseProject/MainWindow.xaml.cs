using CourseProject.Helpers;
using CourseProject.Pages;
using System.Windows;

namespace CourseProject
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            AppHelper.MainFrame = _MainFrame;
            AppHelper.MainFrame.Navigate(new AuthorizationPage());
        }
    }
}

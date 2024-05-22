using CourseProject.DataBaseModel;
using CourseProject.Helpers;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Diagnostics;
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
        List<Products> origin = AppHelper.DbConnect.Products.ToList();
        List<Products> current = new List<Products>();
        Users usr = new Users();
        public MainPage(Users user)
        {
            InitializeComponent();

            current = origin;
            lvProducts.ItemsSource = current;
            usr = user;
            DataContext = usr;

            cboxCategory.ItemsSource = AppHelper.DbConnect.Categories.ToList();
            cboxCategory.SelectedValuePath = "CategoryId";
            cboxCategory.DisplayMemberPath = "CategoryName";

            cboxPCCompany.ItemsSource = AppHelper.DbConnect.Products.Where(x => x.ProductCategory == 1).Select(x => x.ProductManufacturer).Distinct().ToList();
            cboxMotherboardCompany.ItemsSource = AppHelper.DbConnect.Products.Where(x => x.ProductCategory == 2).Select(x => x.ProductManufacturer).Distinct().ToList();
            cboxDRAM.ItemsSource = AppHelper.DbConnect.Products.Where(x => x.ProductCategory == 3).Select(x => x.ProductManufacturer).Distinct().ToList();
            cboxGPUCompany.ItemsSource = AppHelper.DbConnect.Products.Where(x => x.ProductCategory == 4).Select(x => x.ProductManufacturer).Distinct().ToList();
            cboxStorageCompany.ItemsSource = AppHelper.DbConnect.Products.Where(x => x.ProductCategory == 5).Select(x => x.ProductManufacturer).Distinct().ToList();
            cboxProcessorCompany.ItemsSource = AppHelper.DbConnect.Products.Where(x => x.ProductCategory == 6).Select(x => x.ProductManufacturer).Distinct().ToList();
            cboxSupliesCompany.ItemsSource = AppHelper.DbConnect.Products.Where(x => x.ProductCategory == 7).Select(x => x.ProductManufacturer).Distinct().ToList();
            cboxCoolingCompany.ItemsSource = AppHelper.DbConnect.Products.Where(x => x.ProductCategory == 8).Select(x => x.ProductManufacturer).Distinct().ToList();
        }

        private void UpdateFilters()
        {
            if (PriceFilterNull.IsChecked == true) current = origin.ToList();
            if (PriceFilterAsc.IsChecked == true) current = origin.OrderBy(x => x.ProductPrice).ToList();
            if (PriceFilterDesc.IsChecked == true) current = origin.OrderByDescending(x => x.ProductPrice).ToList();
            if (tboxSearch.Text != "") current = current.Where(x => x.ProductName.ToLower().Contains(tboxSearch.Text.ToLower())).ToList();
            if (cboxCategory.SelectedIndex != -1) current = current.Where(x => x.ProductCategory == cboxCategory.SelectedIndex + 1).ToList();
            if (cboxPCCompany.SelectedIndex != -1) current = current.Where(x => x.ProductManufacturer == cboxPCCompany.SelectedValue.ToString()).ToList();
            if (cboxGPUCompany.SelectedIndex != -1) current = current.Where(x => x.ProductManufacturer == cboxGPUCompany.SelectedValue.ToString()).ToList();
            if (cboxProcessorCompany.SelectedIndex != -1) current = current.Where(x => x.ProductManufacturer == cboxProcessorCompany.SelectedValue.ToString()).ToList();
            if (cboxMotherboardCompany.SelectedIndex != -1) current = current.Where(x => x.ProductManufacturer == cboxMotherboardCompany.SelectedValue.ToString()).ToList();
            if (cboxDRAM.SelectedIndex != -1) current = current.Where(x => x.ProductManufacturer == cboxDRAM.SelectedValue.ToString()).ToList();
            if (cboxStorageCompany.SelectedIndex != -1) current = current.Where(x => x.ProductManufacturer == cboxStorageCompany.SelectedValue.ToString()).ToList();
            if (cboxSupliesCompany.SelectedIndex != -1) current = current.Where(x => x.ProductManufacturer == cboxSupliesCompany.SelectedValue.ToString()).ToList();
            if (cboxCoolingCompany.SelectedIndex != -1) current = current.Where(x => x.ProductManufacturer == cboxCoolingCompany.SelectedValue.ToString()).ToList();
            lvProducts.ItemsSource = current;
        }

        private void btnCart_Click(object sender, RoutedEventArgs e)
        {
            AppHelper.MainFrame.Navigate(new CartPage(usr));
        }

        private void btnAuthorize_Click(object sender, RoutedEventArgs e)
        {
            AppHelper.MainFrame.Navigate(new AuthorizationPage());
        }

        private void btnAddToCart_Click(object sender, RoutedEventArgs e)
        {
            var userCart = AppHelper.DbConnect.Cart.FirstOrDefault(x => x.ClientId == usr.UserId);
            Console.WriteLine(userCart);

            if (userCart == null)
            {
                Cart newUserCart = new Cart();
                newUserCart.ClientId = usr.UserId;
                AppHelper.DbConnect.Cart.Add(newUserCart);
                AppHelper.DbConnect.SaveChanges();
            }

            int ProductID = (lvProducts.SelectedItem as Products).ProductId;
            AddProductToCart(ProductID);
        }

        private void cboxCategory_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (cboxCategory.SelectedIndex == 0)
            {
                PCFilter.Visibility = Visibility.Visible;
                GPUFilter.Visibility = Visibility.Collapsed;
                ProcessorFilter.Visibility = Visibility.Collapsed;
                MotherboardFilter.Visibility = Visibility.Collapsed;
                DRAMFilter.Visibility = Visibility.Collapsed;
                StorageFilter.Visibility = Visibility.Collapsed;
                SupliesFilter.Visibility = Visibility.Collapsed;
                CoolingFilter.Visibility = Visibility.Collapsed;
                cboxGPUCompany.SelectedIndex = -1;
                cboxProcessorCompany.SelectedIndex = -1;
                cboxDRAM.SelectedIndex = -1;
                cboxMotherboardCompany.SelectedIndex = -1;
                cboxStorageCompany.SelectedIndex = -1;
                cboxSupliesCompany.SelectedIndex = -1;
                cboxCoolingCompany.SelectedIndex = -1;
            }
            else if (cboxCategory.SelectedIndex == 1)
            {
                MotherboardFilter.Visibility = Visibility.Visible;
                DRAMFilter.Visibility = Visibility.Collapsed;
                StorageFilter.Visibility = Visibility.Collapsed;
                SupliesFilter.Visibility = Visibility.Collapsed;
                CoolingFilter.Visibility = Visibility.Collapsed;
                PCFilter.Visibility = Visibility.Collapsed;
                GPUFilter.Visibility = Visibility.Collapsed;
                ProcessorFilter.Visibility = Visibility.Collapsed;
                cboxPCCompany.SelectedIndex = -1;
                cboxGPUCompany.SelectedIndex = -1;
                cboxProcessorCompany.SelectedIndex = -1;
                cboxDRAM.SelectedIndex = -1;
                cboxStorageCompany.SelectedIndex = -1;
                cboxSupliesCompany.SelectedIndex = -1;
                cboxCoolingCompany.SelectedIndex = -1;
            }
            else if (cboxCategory.SelectedIndex == 2)
            {
                DRAMFilter.Visibility = Visibility.Visible;
                StorageFilter.Visibility = Visibility.Collapsed;
                SupliesFilter.Visibility = Visibility.Collapsed;
                CoolingFilter.Visibility = Visibility.Collapsed;
                PCFilter.Visibility = Visibility.Collapsed;
                GPUFilter.Visibility = Visibility.Collapsed;
                ProcessorFilter.Visibility = Visibility.Collapsed;
                MotherboardFilter.Visibility = Visibility.Collapsed;
                cboxMotherboardCompany.SelectedIndex = -1;
                cboxStorageCompany.SelectedIndex = -1;
                cboxSupliesCompany.SelectedIndex = -1;
                cboxCoolingCompany.SelectedIndex = -1;
                cboxPCCompany.SelectedIndex = -1;
                cboxGPUCompany.SelectedIndex = -1;
                cboxProcessorCompany.SelectedIndex = -1;
            }
            else if (cboxCategory.SelectedIndex == 3)
            {
                PCFilter.Visibility = Visibility.Collapsed;
                GPUFilter.Visibility = Visibility.Visible;
                ProcessorFilter.Visibility = Visibility.Collapsed;
                MotherboardFilter.Visibility = Visibility.Collapsed;
                DRAMFilter.Visibility = Visibility.Collapsed;
                StorageFilter.Visibility = Visibility.Collapsed;
                SupliesFilter.Visibility = Visibility.Collapsed;
                CoolingFilter.Visibility = Visibility.Collapsed;
                cboxPCCompany.SelectedIndex = -1;
                cboxProcessorCompany.SelectedIndex = -1;
                cboxDRAM.SelectedIndex = -1;
                cboxMotherboardCompany.SelectedIndex = -1;
                cboxStorageCompany.SelectedIndex = -1;
                cboxSupliesCompany.SelectedIndex = -1;
                cboxCoolingCompany.SelectedIndex = -1;
            }
            else if (cboxCategory.SelectedIndex == 4)
            {
                StorageFilter.Visibility = Visibility.Visible;
                PCFilter.Visibility = Visibility.Collapsed;
                GPUFilter.Visibility = Visibility.Collapsed;
                ProcessorFilter.Visibility = Visibility.Collapsed;
                MotherboardFilter.Visibility = Visibility.Collapsed;
                DRAMFilter.Visibility = Visibility.Collapsed;
                SupliesFilter.Visibility = Visibility.Collapsed;
                CoolingFilter.Visibility = Visibility.Collapsed;
                cboxPCCompany.SelectedIndex = -1;
                cboxGPUCompany.SelectedIndex = -1;
                cboxProcessorCompany.SelectedIndex = -1;
                cboxDRAM.SelectedIndex = -1;
                cboxMotherboardCompany.SelectedIndex = -1;
                cboxSupliesCompany.SelectedIndex = -1;
                cboxCoolingCompany.SelectedIndex = -1;
            }
            else if (cboxCategory.SelectedIndex == 5)
            {
                PCFilter.Visibility = Visibility.Collapsed;
                GPUFilter.Visibility = Visibility.Collapsed;
                ProcessorFilter.Visibility = Visibility.Visible;
                MotherboardFilter.Visibility = Visibility.Collapsed;
                DRAMFilter.Visibility = Visibility.Collapsed;
                StorageFilter.Visibility = Visibility.Collapsed;
                SupliesFilter.Visibility = Visibility.Collapsed;
                CoolingFilter.Visibility = Visibility.Collapsed;
                cboxPCCompany.SelectedIndex = -1;
                cboxGPUCompany.SelectedIndex = -1;
                cboxDRAM.SelectedIndex = -1;
                cboxMotherboardCompany.SelectedIndex = -1;
                cboxStorageCompany.SelectedIndex = -1;
                cboxSupliesCompany.SelectedIndex = -1;
                cboxCoolingCompany.SelectedIndex = -1;
            }
            else if (cboxCategory.SelectedIndex == 6)
            {
                SupliesFilter.Visibility = Visibility.Visible;
                CoolingFilter.Visibility = Visibility.Collapsed;
                PCFilter.Visibility = Visibility.Collapsed;
                GPUFilter.Visibility = Visibility.Collapsed;
                ProcessorFilter.Visibility = Visibility.Collapsed;
                MotherboardFilter.Visibility = Visibility.Collapsed;
                DRAMFilter.Visibility = Visibility.Collapsed;
                StorageFilter.Visibility = Visibility.Collapsed;
                cboxPCCompany.SelectedIndex = -1;
                cboxGPUCompany.SelectedIndex = -1;
                cboxProcessorCompany.SelectedIndex = -1;
                cboxDRAM.SelectedIndex = -1;
                cboxMotherboardCompany.SelectedIndex = -1;
                cboxStorageCompany.SelectedIndex = -1;
                cboxCoolingCompany.SelectedIndex = -1;
            }
            else if (cboxCategory.SelectedIndex == 7)
            {
                CoolingFilter.Visibility = Visibility.Visible;
                PCFilter.Visibility = Visibility.Collapsed;
                GPUFilter.Visibility = Visibility.Collapsed;
                ProcessorFilter.Visibility = Visibility.Collapsed;
                MotherboardFilter.Visibility = Visibility.Collapsed;
                DRAMFilter.Visibility = Visibility.Collapsed;
                StorageFilter.Visibility = Visibility.Collapsed;
                SupliesFilter.Visibility = Visibility.Collapsed;
                cboxPCCompany.SelectedIndex = -1;
                cboxGPUCompany.SelectedIndex = -1;
                cboxProcessorCompany.SelectedIndex = -1;
                cboxDRAM.SelectedIndex = -1;
                cboxMotherboardCompany.SelectedIndex = -1;
                cboxStorageCompany.SelectedIndex = -1;
                cboxSupliesCompany.SelectedIndex = -1;
            }
            else
            {
                PCFilter.Visibility = Visibility.Collapsed;
                GPUFilter.Visibility = Visibility.Collapsed;
                ProcessorFilter.Visibility = Visibility.Collapsed;
                MotherboardFilter.Visibility = Visibility.Collapsed;
                DRAMFilter.Visibility = Visibility.Collapsed;
                StorageFilter.Visibility = Visibility.Collapsed;
                SupliesFilter.Visibility = Visibility.Collapsed;
                CoolingFilter.Visibility = Visibility.Collapsed;
                cboxPCCompany.SelectedIndex = -1;
                cboxGPUCompany.SelectedIndex = -1;
                cboxProcessorCompany.SelectedIndex = -1;
                cboxDRAM.SelectedIndex = -1;
                cboxMotherboardCompany.SelectedIndex = -1;
                cboxStorageCompany.SelectedIndex = -1;
                cboxSupliesCompany.SelectedIndex = -1;
                cboxCoolingCompany.SelectedIndex = -1;
            }
            UpdateFilters();
        }

        private void cboxProcessorCompany_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateFilters();
        }

        private void cboxGPUCompany_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateFilters();
        }

        private void cboxPCCompany_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateFilters();
        }

        private void cboxMotherboardCompany_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateFilters();
        }

        private void cboxDRAM_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateFilters();
        }

        private void PriceFilterNull_Click(object sender, RoutedEventArgs e)
        {
            UpdateFilters();
        }

        private void PriceFilterAsc_Click(object sender, RoutedEventArgs e)
        {
            UpdateFilters();
        }

        private void PriceFilterDesc_Click(object sender, RoutedEventArgs e)
        {
            UpdateFilters();
        }

        private void cboxCoolingCompany_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateFilters();
        }

        private void cboxSupliesCompany_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateFilters();
        }

        private void cboxStorageCompany_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateFilters();
        }

        private void btnClearFilters_Click(object sender, RoutedEventArgs e)
        {
            cboxPCCompany.SelectedIndex = -1;
            cboxGPUCompany.SelectedIndex = -1;
            cboxProcessorCompany.SelectedIndex = -1;
            cboxDRAM.SelectedIndex = -1;
            cboxMotherboardCompany.SelectedIndex = -1;
            cboxStorageCompany.SelectedIndex = -1;
            cboxSupliesCompany.SelectedIndex = -1;
            cboxCoolingCompany.SelectedIndex = -1;
            PCFilter.Visibility = Visibility.Collapsed;
            GPUFilter.Visibility = Visibility.Collapsed;
            ProcessorFilter.Visibility = Visibility.Collapsed;
            MotherboardFilter.Visibility = Visibility.Collapsed;
            DRAMFilter.Visibility = Visibility.Collapsed;
            StorageFilter.Visibility = Visibility.Collapsed;
            SupliesFilter.Visibility = Visibility.Collapsed;
            CoolingFilter.Visibility = Visibility.Collapsed;
            cboxCategory.SelectedIndex = -1;
            PriceFilterAsc.IsChecked = false;
            PriceFilterDesc.IsChecked = false;
            PriceFilterNull.IsChecked = true;
            tboxSearch.Text = "";
            UpdateFilters();
        }

        private void tboxSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateFilters();
        }

        private void btnOrders_Click(object sender, RoutedEventArgs e)
        {
            AppHelper.MainFrame.Navigate(new OrdersPage(usr));
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            AppHelper.MainFrame.GoBack();
        }
        
        private void AddProductToCart(int productId)
        {
            var userCart = AppHelper.DbConnect.Cart.FirstOrDefault(x => x.ClientId == usr.UserId);
            var productAdded = AppHelper.DbConnect.Cart_Products.FirstOrDefault(x => x.CartId == userCart.CartId && x.ProductId == productId);

            if (productAdded == null)
            {
                Cart_Products newCart_Product = new Cart_Products();
                newCart_Product.CartId = userCart.CartId;
                newCart_Product.ProductId = productId;
                newCart_Product.ProductAmountInCart = 1;
                AppHelper.DbConnect.Cart_Products.Add(newCart_Product);
                AppHelper.DbConnect.SaveChanges();
            }
            else
            {
                productAdded.ProductAmountInCart += 1;
                AppHelper.DbConnect.SaveChanges();
            }
        }
    }
}

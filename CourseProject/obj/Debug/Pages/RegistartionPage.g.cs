﻿#pragma checksum "..\..\..\Pages\RegistartionPage.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "A1F000BF10E2326E6A962BB4A9DDE54CEF244B36FE9C8C45CF8B07F2C8E007CF"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using CourseProject.Pages;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace CourseProject.Pages {
    
    
    /// <summary>
    /// RegistartionPage
    /// </summary>
    public partial class RegistartionPage : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 17 "..\..\..\Pages\RegistartionPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.StackPanel SpReg;
        
        #line default
        #line hidden
        
        
        #line 23 "..\..\..\Pages\RegistartionPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TBoxName;
        
        #line default
        #line hidden
        
        
        #line 28 "..\..\..\Pages\RegistartionPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TBoxSurname;
        
        #line default
        #line hidden
        
        
        #line 33 "..\..\..\Pages\RegistartionPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TBoxPatronimyc;
        
        #line default
        #line hidden
        
        
        #line 38 "..\..\..\Pages\RegistartionPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TBoxEmail;
        
        #line default
        #line hidden
        
        
        #line 43 "..\..\..\Pages\RegistartionPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TBoxLogin;
        
        #line default
        #line hidden
        
        
        #line 48 "..\..\..\Pages\RegistartionPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TBoxPassword;
        
        #line default
        #line hidden
        
        
        #line 51 "..\..\..\Pages\RegistartionPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnRegist;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/CourseProject;component/pages/registartionpage.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Pages\RegistartionPage.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.SpReg = ((System.Windows.Controls.StackPanel)(target));
            return;
            case 2:
            this.TBoxName = ((System.Windows.Controls.TextBox)(target));
            return;
            case 3:
            this.TBoxSurname = ((System.Windows.Controls.TextBox)(target));
            return;
            case 4:
            this.TBoxPatronimyc = ((System.Windows.Controls.TextBox)(target));
            return;
            case 5:
            this.TBoxEmail = ((System.Windows.Controls.TextBox)(target));
            return;
            case 6:
            this.TBoxLogin = ((System.Windows.Controls.TextBox)(target));
            return;
            case 7:
            this.TBoxPassword = ((System.Windows.Controls.TextBox)(target));
            return;
            case 8:
            this.btnRegist = ((System.Windows.Controls.Button)(target));
            
            #line 52 "..\..\..\Pages\RegistartionPage.xaml"
            this.btnRegist.Click += new System.Windows.RoutedEventHandler(this.btnRegist_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}


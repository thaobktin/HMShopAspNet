using System;
using System.Data;
using System.Web.UI.WebControls;
using HM.Services;
using HM.Util;
using HM.Common;
using HM.Model;
using HM.Control;


namespace HMShop.Qwerty.Products
{
    public partial class DetailProductManager : AdminControl
    {
        const string imageId = " ";
        string SaveProductId
        {
            get { return (string)ViewState[imageId]; }
            set { ViewState[imageId] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var productId = "";
                if (!IsPostBack)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["productid"]))
                    {
                        productId = Request.QueryString["productid"];
                    }
                    txtProductName.Focus();
                    BindCategory();
                    BindSupplier();
                    BindProductDetail(productId);
                }
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        void BindCategory()
        {
            var categoryService = new CategoryService();
            var list = categoryService.ReadByEnable(true);
            ddlCategories.DataTextField = "Name";
            ddlCategories.DataValueField = "ID";
            ddlCategories.DataSource = list;
            ddlCategories.DataBind();
        }

        void BindSupplier()
        {
            var supplierService = new SupplierService();
            var dt = supplierService.ReadAll();
            ddlSuppliers.DataTextField = "Name";
            ddlSuppliers.DataValueField = "ID";
            ddlSuppliers.DataSource = dt;
            ddlSuppliers.DataBind();
        }

        void BindProductDetail(string productId)
        {
            var productService = new ProductService();
            var product = productService.ReadById(productId);
            if(product != null)
            {
                txtProductName.Text = product.Name;
                ckeDesc.Text = product.Description;
                txtPrice.Text = product.Price.ToString();
                imgProduct.ImageUrl = "~/HttpHandlers/DisplayProductImage.ashx?ProductImageID=" + product.Image.ID.ToString();
                ddlCategories.SelectedIndex = ddlCategories.Items.IndexOf(ddlCategories.Items.FindByText(product.Category.Name));
                ddlSuppliers.SelectedIndex = ddlSuppliers.Items.IndexOf(ddlSuppliers.Items.FindByText(product.Supplier.Name));

                SaveProductId = product.Image.ID;
            }
            else
            {
                imgProduct.ImageUrl = "~/Assets/images/NoImage.jpg";
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                var productId = Request.QueryString["productid"];
                var productService = new ProductService();

                if (productId == null) //Add new
                {
                    var product = new ProductInfo
                    {
                        ID = "",
                        Category = new CategoryInfo
                        {
                            Name = ddlCategories.SelectedItem.Value
                        },
                        Supplier = new SupplierInfo
                        {
                            ID = ddlSuppliers.SelectedItem.Value
                        },
                        Image = new ProductImageInfo
                        {
                            Data = fudImgPrd.FileBytes
                        },
                        Name = txtProductName.Text,
                        Description = ckeDesc.Text,
                        Unit = "",
                        Price = Convert.ToDecimal(txtPrice.Text)
                    };

                    productService.Create(product);
                }
                else //Update
                {
                    var product = new ProductInfo
                    {
                        ID = Request.QueryString["productid"],
                        Category = new CategoryInfo
                        {
                            Name = ddlCategories.SelectedItem.Value
                        },
                        Supplier = new SupplierInfo
                        {
                            ID = ddlSuppliers.SelectedItem.Value
                        },
                        Image = new ProductImageInfo
                        {
                            ID = SaveProductId
                        },
                        Name = txtProductName.Text,
                        Description = ckeDesc.Text,
                        Unit = "",
                        Price = Convert.ToDecimal(txtPrice.Text)
                    };

                    if (fudImgPrd.HasFile)
                    {
                        product.Image.Data = fudImgPrd.FileBytes;
                    }
                    else
                    {
                        byte[] prdImg = productService.ReadImage(product.Image.ID).Data;
                        product.Image.Data = prdImg;
                    }

                    productService.Upate(product);
                }

                ReturnListProduct();
            }
            catch (Exception ex)
            {
                var url = Page.ResolveUrl("~/LogPages/HttpErrorPage.aspx?handler=" + ex.Message);
                Response.Redirect(url, false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ReturnListProduct();
        }

        void ReturnListProduct()
        {
            var url = PathConfig.ADMIN_CMD + CmdConfig.PRODUCT_LIST_PRODUCT;
            Response.Redirect(url, false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;
using JooleUI.Models;
using Newtonsoft.Json;

namespace JooleUI.Controllers
{
    public class SearchController : Controller
    {
        // GET: CategoryAndSub
        [HttpGet]
        public ActionResult Index(int? value)
        {
            List<Category> listObj = new List<Category>();
            //List<SubCategory> subCateList = new List<SubCategory>();
            //Dictionary<string, List<string>> cateAndSubCate = new Dictionary<string, List<string>>();
            foreach (var tempCatego in new Services.Service().getCategories())
            {

                Category tempObj = new Category();
                //SubCategory tempSubCategory = new SubCategory();
                tempObj.Category_ID = tempCatego.Category_ID;
                tempObj.Category_Name = tempCatego.Category_Name;
                //string categoryVal = tempCatego.Category_Name;

                /*
                List<string> subCategoList = new List<string>();
                foreach (var temp in new Services.Service().GetSubCategories(tempCatego.Category_ID))
                {
                    subCategoList.Add(temp.SubCategory_Name);
                }*/
                //tempSubCategory.SubCategory_Name = subCategoList;
                //listObj.Add(tempSearchObj);
                //cateAndSubCate.Add(categoryVal, subCategoList);
                listObj.Add(tempObj);
                //subCateList.Add()

            }
            //var asdfw = cateAndSubCate.Values;
            //var asdf = cateAndSubCate.Keys;
            ViewBag.Category = new SelectList(listObj, "Category_ID", "Category_Name");


            if (value != null)
            {
                SubCategory tempSubCategory = new SubCategory();

                List<string> subCategoList = new List<string>();
                int val = (int) value;
                foreach (var temp in new Services.Service().GetSubCategories(val))
                {
                    subCategoList.Add(temp.SubCategory_Name);
                }
                tempSubCategory.SubCategory_Name = subCategoList;
                ViewBag.subCategory = new SelectList(subCategoList);
            }
            //var asdf = JsonConvert.SerializeObject(cateAndSubCate);


            //return Json(asdf, JsonRequestBehavior.AllowGet);
            //Category temp = new Category();
            return View();
        }

        [HttpPost]
        public ActionResult Index(string SearchQuery, string Category)
        {
            if (string.IsNullOrEmpty(SearchQuery))
            {
                //search based on the category

            }else
            {
                List<string> asdf = new List<string>();
                foreach(var temp in new Services.Service().GetSubCategories(Int32.Parse(Category)))
                {
                    asdf.Add(temp.SubCategory_Name);
                }
                if (asdf.Contains(SearchQuery))
                {
                    //sub category
                }
                else
                {
                    //search without subcategory
                }

            }
            return RedirectToAction("Summary", "Product",SearchQuery);
        }

    }
}
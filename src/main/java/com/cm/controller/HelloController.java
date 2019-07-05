package com.cm.controller;

import com.cm.model.Goods;
import com.cm.model.ShoppingCar;
import com.cm.model.User;
import com.cm.result.CommonJson;
import com.cm.service.GoodsService;
import com.cm.service.ShoppingCarService;
import com.cm.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class HelloController{
    @Autowired
    UserService userService;
    @Autowired
    GoodsService goodsService;
    @Autowired
    ShoppingCarService shoppingCarService;

    //所有货物
    @RequestMapping(value = {"/","","/to_index"} )
    public String index(Model model,@RequestParam(value = "curr",defaultValue = "1")int curr,@RequestParam(value = "page",defaultValue = "0")int page,@RequestParam(value = "limit",defaultValue = "9")int limit) {
        List<Goods> list=goodsService.getAllGoods();
        List<Goods> list2=goodsService.getAllPageGoods(page,limit);
        model.addAttribute("goodslist",list2);
        model.addAttribute("allgoods",list);
        model.addAttribute("page",curr);
        return "normal/index";
    }


    //test
    @RequestMapping("/hello")
    public ModelAndView handleRequest(javax.servlet.http.HttpServletRequest httpServletRequest, javax.servlet.http.HttpServletResponse httpServletResponse) throws Exception {
        ModelAndView mav = new ModelAndView("test");
        mav.addObject("message", "Hello Spring MVC");
        return mav;
    }

    //去登陆
    @RequestMapping(value = "/to_login")
    public String toLogin() {
        return "normal/login";
    }

    //商品分类
    @RequestMapping(value = "/to_category")
    public String toCategory(Model model,@RequestParam(value = "goodsCategory",defaultValue = "食品")String goodsCategory) {
        Goods goodsModel=new Goods();
        goodsModel.setGoodsCategory(goodsCategory);
        model.addAttribute("categorylist",goodsService.category(goodsModel));
        return "normal/category";
    }

    //去注册
    @RequestMapping(value = "/to_register")
    public String toRegister() {
        return "normal/register";
    }

    //我的主页
    @RequestMapping(value = "/my_home")
    public String toMine(HttpServletRequest httpServletRequest,Model model) {
        HttpSession httpSession=httpServletRequest.getSession();
        User user=(User)httpSession.getAttribute("user");
        int userid=(int)user.getUserId();
        ShoppingCar shoppingCar=new ShoppingCar();
        shoppingCar.setUserId(userid);
        List<ShoppingCar> list=shoppingCarService.SelectUserCar(shoppingCar);
        int allprice=0;
        List<Integer> list1=new ArrayList<Integer>();
        for (int i=0;i<list.size();i++){
            int money=0;
            int a= (int) list.get(i).getGoods().getGoodsPrice();
            allprice+=list.get(i).getShopNumber()*a;
            money=list.get(i).getShopNumber()*a;
            list1.add(money);
        }
        System.out.println("money is"+allprice);
        model.addAttribute("carlist",list);
        model.addAttribute("user",user);
        model.addAttribute("allmoney",allprice);
        model.addAttribute("moneylist",list1);
        return "business/mine";
    }

    //商品详情
    @RequestMapping(value = "to_goodsinfo")
    public String toGoodsInfo(Goods goodsModel, Model model){
        List<Goods> goodsInfolist=goodsService.goodsInfo(goodsModel);
        System.out.println(goodsInfolist.get(0).getGoodsImagePath());
        model.addAttribute("goodsInfolist",goodsInfolist.get(0));
        return "normal/goodsinfo";
    }

    //购物车
    @RequestMapping(value = "/shopping_cart")
    public String toShoppingCar(){
        return "customer/shoppingcar";
    }

    //商家发布的货物
    @RequestMapping(value = "/query_published_goods")
    @ResponseBody
    public Object QueryGooods(HttpServletRequest httpServletRequest){
       // System.out.println(limit+""+page);
        HttpSession httpSession=httpServletRequest.getSession();
        Goods goods=new Goods();
        User user=(User)httpSession.getAttribute("user");
        int userid=(int)user.getUserId();
        goods.setUserId(userid);
        List<Goods> list=goodsService.getUserGoods(goods);
        HashMap<String,Object> map=new HashMap<String, Object>();
        map.put("data",list);
        map.put("code", 0);
        map.put("count",list.size());
        return map;
    }


    //加入购物车
    @RequestMapping(value = "/add_car")
    @ResponseBody
    public Object AddShoppingCar(ShoppingCar shoppingCar,HttpServletRequest httpServletRequest){
        CommonJson commonJson=new CommonJson();
        Goods goods=new Goods();
        goods.setGoodsId(shoppingCar.getGoodsId());
        List<Goods> list=goodsService.getGoodsById(goods);
        HttpSession httpSession=httpServletRequest.getSession();
        User user=(User) httpSession.getAttribute("user");
        int userId= (int) user.getUserId();
        if (httpSession.getAttribute("user")==null){
            commonJson.setCode(-1);
            commonJson.setMsg("请先登录！");
            return commonJson;
        }else if(list.get(0).getUserId()==userId){
            commonJson.setCode(-2);
            commonJson.setMsg("你不能购买自己发布的商品！");
            return commonJson;
        }
        else {
            shoppingCar.setUserId(userId);
            System.out.println("num is"+shoppingCar.getShopNumber()+"user id "+shoppingCar.getUserId()+"goods id is"+shoppingCar.getGoodsId());
            shoppingCarService.AddCar(shoppingCar);
            Goods goodsModel=new Goods();
            goodsModel.setGoodsId(shoppingCar.getGoodsId());
            goodsModel.setGoodsNumber(String.valueOf(shoppingCar.getShopNumber()));
            System.out.println("number is"+goodsModel.getGoodsNumber());
            goodsService.updateNumber(goodsModel);
            commonJson.setCode(0);
            commonJson.setMsg("加入成功!");
            return commonJson;
        }
    }

    //搜索
    @RequestMapping(value = "/search")
    public String Search(Goods goodsModel, Model model){
        List<Goods> searchist=goodsService.goodsSearch(goodsModel);
        model.addAttribute("searchlist",searchist);
        System.out.println(searchist.size());
        return "normal/search";
    }

    //注册
    @RequestMapping(value = "/do_register",method = RequestMethod.POST)
    @ResponseBody
    public Object register(User userModel, Model model) {
        List<User> list=userService.register(userModel);
        if (list.size()!=0){
            CommonJson<User> userModelCommonJson=new CommonJson<User>();
            userModelCommonJson.setCode(-1);
            userModelCommonJson.setMsg("电话已被注册!");
            return userModelCommonJson;
        }
        else {
            userService.insertUser(userModel);
            CommonJson<User> userModelCommonJson=new CommonJson<User>();
            userModelCommonJson.setCode(0);
            userModelCommonJson.setMsg("注册成功！");
            return userModelCommonJson;
        }
    }

    //登录
    @RequestMapping(value = "/do_login",method = RequestMethod.POST)
    @ResponseBody
    public Object login(User userModel, Model model, HttpServletRequest request) {
        List<User> list=userService.login(userModel);
        HttpSession session = request.getSession(true);
        if (list.size()==0){
            CommonJson<User> userModelCommonJson=new CommonJson<User>();
            userModelCommonJson.setCode(-1);
            userModelCommonJson.setMsg("账号或密码错误！");
            return  userModelCommonJson;
        }
        else {
            CommonJson<User> userModelCommonJson=new CommonJson<User>();
            userModelCommonJson.setCode(0);
            userModelCommonJson.setMsg("登录成功！");
            session.setAttribute("user",list.get(0));
            return  userModelCommonJson;
        }
    }

    //delete
    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public String delete(User userModel){
        userService.deleteUserById(userModel);
        return "redirect:/index";
    }

    //注销
    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        if(session.getAttribute("user")!=null){
            session.removeAttribute("user");
        }
        return "redirect:/to_index";
    }

    //上传商品
    @RequestMapping(value = "/do_publish", method = RequestMethod.POST)
    @ResponseBody
    public Object save(Goods goodsModel, @RequestParam(value="image",required = false) MultipartFile image, HttpServletRequest request, Model model) {

        //获取文件在服务器上的储存位置
        String path = request.getSession().getServletContext().getRealPath("/resources/upload");
        File filePath = new File(path);
        System.out.println("文件保存路径：" + path);
        if (!filePath.exists() && !filePath.isDirectory()) {
            System.out.println("目录不存在，创建目录：" + filePath);
            filePath.mkdir();
        }

        //获取原始文件名称
        String originalFileName = image.getOriginalFilename();
        System.out.println("原始文件名称：" + originalFileName);

        //获取文件类型，以最后一个`.`作为标识
        String type = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
        System.out.println("文件类型：" + type);

        //设置文件新名字
        String fileName = System.currentTimeMillis() + "." + type;
        System.out.println("文件新名称：" + fileName);
        //在指定路径创建一个文件
        File targetFile = new File(path, fileName);

        //将文件保存到服务器指定位置
        try {
            image.transferTo(targetFile);
            model.addAttribute("msg", "保存数据成功");
            String goodsImagePath="resources/upload/" + fileName;
            goodsModel.setGoodsImagePath(goodsImagePath);
            HttpSession httpSession=request.getSession();
            User user=(User)httpSession.getAttribute("user");
            goodsModel.setUserId((int)user.getUserId());
            System.out.println(goodsModel.getGoodsName()+"name is"+"number is "+goodsModel.getGoodsNumber());
            goodsService.save(goodsModel);
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("保存文件错误...");
            CommonJson commonJson=new CommonJson();
            commonJson.setCode(-1);
            commonJson.setMsg("上传失败!");
            return commonJson;
        }
        CommonJson commonJson=new CommonJson();
        commonJson.setCode(0);
        commonJson.setMsg("上传成功!");
        return commonJson;
    }






}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.CartDAO;
import daos.ProductDAO;
import dtos.CartDTO;
import dtos.OrderDetailDTO;
import dtos.UserDTO;
import java.io.IOException;
import java.util.HashMap;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tuanv
 */
public class CheckoutController extends HttpServlet {

    public static final String SUCCESS = "SearchController";
    public static final String ERROR = "viewcart.jsp";
    public static final String ERRORUSER = "index.html";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("USER_LOGIN");
            if (user.getRole().equals("USER")) {
                long millis = System.currentTimeMillis();
                java.sql.Date date = new java.sql.Date(millis);
                CartDTO cart = (CartDTO) session.getAttribute("CART");
                if (cart != null) {
                    boolean check = true;
                    String txttotalPrice = request.getParameter("totalPrice");
                    float totalPrice = 0;
                    if (txttotalPrice == null) {
                        check = false;
                    } else {
                        if (txttotalPrice.trim().isEmpty()) {
                            check = false;
                        } else {
                            try {
                                totalPrice = Float.parseFloat(txttotalPrice);
                                if (totalPrice < 0) {
                                    check = false;
                                }
                            } catch (Exception e) {
                                check = false;
                            }
                        }
                    }
                    String payment = request.getParameter("cbpayment");
                    if (payment.equals("COD")) {
                        payment = "1";
                    } else if (payment.equals("viaPayPal")) {
                        payment = "2";
                    } else {
                        check = false;
                    }
                    ProductDAO prodao = new ProductDAO();
                    HashMap<String, OrderDetailDTO> hash = cart.getHash();
                    Set<String> key = hash.keySet();

                    String error = "";
                    for (String productID : key) {
                        if (!prodao.CheckproductToCheckout(hash.get(productID).getQuantity(), productID)) {
                            error = error + hash.get(productID).getProduct().getProductName();
                            check = false;
                            request.setAttribute("CHECKOUT_ERROR", error + "not enough quantity!!!!");
                        }
                    }
                    String phone = request.getParameter("txtPhone");
                    if (phone != null) {
                        if (phone.trim().isEmpty()) {
                            check = false;
                            request.setAttribute("PHONE_ERROR", "Phone is not empty");
                        } else {
                            if (phone.length() == 10) {
                                try {
                                    Float cphone = Float.parseFloat(phone);
                                } catch (Exception e) {
                                    check = false;
                                    request.setAttribute("PHONE_ERROR", "Phone is num");
                                }
                            }else{
                                check=false;
                                request.setAttribute("PHONE_ERROR", "Phone is 10 character num");
                            }
                        }
                    } else {
                        check = false;
                        request.setAttribute("PHONE_ERROR", "Phone is not empty");
                    }
                    String address = request.getParameter("txtaddress");
                    if(address!=null){
                        if(address.trim().isEmpty()){
                            check=false;
                            request.setAttribute("ADDRESS_ERROR", "ADDRESS is not empty");
                        }
                    }else{
                        check=false;
                        request.setAttribute("ADDRESS_ERROR", "ADDRESS is not empty");
                    }
                    if (check) {
                        cart.setUserID(user.getUserID());
                        cart.setOrderDate(date.toString());
                        cart.setTotalPrice(totalPrice);
                        cart.setPayID(payment);
                        CartDAO cartdao = new CartDAO();
                        cartdao.createOrder(cart,phone,address);
                        url = SUCCESS;
                        session.setAttribute("CART", null);
                    }
                }
            } else {
                url = ERRORUSER;
            }
        } catch (Exception e) {
            log(e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

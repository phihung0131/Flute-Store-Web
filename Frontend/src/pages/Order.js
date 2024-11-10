import React from "react";
import CheckoutForm from "../components/Customer/Order/CheckoutForm";
import Header from "../components/Customer/common/Header";
import Footer from "../components/Customer/common/Footer";
import { useEffect } from "react";
import { scrollToTop } from "../helper/scrollToTop";
const Order = () => {
  useEffect(() => {
    scrollToTop();
  }, []);
  return (
    <>
      <Header />
      <CheckoutForm />
      <Footer />
    </>
  );
};

export default Order;
